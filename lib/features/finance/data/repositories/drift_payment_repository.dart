import 'package:drift/drift.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/database/tables/lessons_table.dart';
import 'package:tutor_app/core/database/tables/sql_constraints.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/finance/data/mappers/payment_mapper.dart';
import 'package:tutor_app/features/finance/domain/models/income_report.dart';
import 'package:tutor_app/features/finance/domain/models/payment.dart';
import 'package:tutor_app/features/finance/domain/models/student_balance.dart';
import 'package:tutor_app/features/finance/domain/repositories/payment_repository.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';

class DriftPaymentRepository implements PaymentRepository {
  DriftPaymentRepository(this._db);

  final AppDatabase _db;

  /// Баланс считается коррелированными подзапросами по каждому ученику;
  /// все они идут по индексам внешних ключей.
  static final _balancesSql =
      '''
SELECT
  s.id AS student_id,
  s.full_name AS student_name,
  s.is_archived AS is_archived,
  COALESCE((
    SELECT SUM(l.price_kopecks)
    FROM lessons l
    JOIN enrollments e ON e.id = l.enrollment_id
    WHERE e.student_id = s.id
      AND l.package_id IS NULL
      AND ${sqlIn('l.status', billableLessonStatusValues)}
  ), 0) AS lessons_charged,
  COALESCE((
    SELECT SUM(p.price_kopecks)
    FROM lesson_packages p
    JOIN enrollments e ON e.id = p.enrollment_id
    WHERE e.student_id = s.id
  ), 0) AS packages_charged,
  COALESCE((
    SELECT SUM(pm.amount_kopecks) FROM payments pm WHERE pm.student_id = s.id
  ), 0) AS paid,
  (SELECT MAX(pm.paid_at) FROM payments pm WHERE pm.student_id = s.id)
    AS last_payment_at
FROM students s
''';

  /// Каждая сумма — коррелированный подзапрос по ученику с фильтром
  /// по дате (`?1` — начало периода, `?2` — конец).
  static final _incomeSql =
      '''
SELECT
  s.id AS student_id,
  s.full_name AS student_name,
  COALESCE((
    SELECT SUM(pm.amount_kopecks) FROM payments pm
    WHERE pm.student_id = s.id AND pm.paid_at >= ?1 AND pm.paid_at < ?2
  ), 0) AS received,
  COALESCE((
    SELECT SUM(l.price_kopecks)
    FROM lessons l JOIN enrollments e ON e.id = l.enrollment_id
    WHERE e.student_id = s.id
      AND l.starts_at >= ?1 AND l.starts_at < ?2
      AND l.package_id IS NULL
      AND ${sqlIn('l.status', billableLessonStatusValues)}
  ), 0) AS lessons_charged,
  COALESCE((
    SELECT SUM(p.price_kopecks)
    FROM lesson_packages p JOIN enrollments e ON e.id = p.enrollment_id
    WHERE e.student_id = s.id
      AND p.purchased_at >= ?1 AND p.purchased_at < ?2
  ), 0) AS packages_sold,
  (
    SELECT COUNT(*)
    FROM lessons l JOIN enrollments e ON e.id = l.enrollment_id
    WHERE e.student_id = s.id
      AND l.starts_at >= ?1 AND l.starts_at < ?2
      AND l.status = '${LessonStatus.completed.name}'
  ) AS completed_lessons,
  COALESCE((
    SELECT SUM(l.duration_minutes)
    FROM lessons l JOIN enrollments e ON e.id = l.enrollment_id
    WHERE e.student_id = s.id
      AND l.starts_at >= ?1 AND l.starts_at < ?2
      AND l.status = '${LessonStatus.completed.name}'
  ), 0) AS completed_minutes
FROM students s
''';

  @override
  Stream<IncomeReport> watchIncomeReport(DatePeriod period) => _db
      .customSelect(
        _incomeSql,
        variables: [
          Variable.withDateTime(period.start),
          Variable.withDateTime(period.end),
        ],
        readsFrom: {
          _db.students,
          _db.enrollments,
          _db.lessons,
          _db.lessonPackages,
          _db.payments,
        },
      )
      .watch()
      .map((rows) {
        final students =
            rows
                .map(
                  (row) => StudentIncome(
                    studentId: row.read<int>('student_id'),
                    studentName: row.read<String>('student_name'),
                    received: Money(row.read<int>('received')),
                    lessonsCharged: Money(row.read<int>('lessons_charged')),
                    packagesSold: Money(row.read<int>('packages_sold')),
                    completedLessons: row.read<int>('completed_lessons'),
                    completedDuration: Duration(
                      minutes: row.read<int>('completed_minutes'),
                    ),
                  ),
                )
                .where((income) => !income.isEmpty)
                .toList()
              ..sort((a, b) {
                final byReceived = b.received.compareTo(a.received);
                return byReceived != 0
                    ? byReceived
                    : b.charged.compareTo(a.charged);
              });
        return IncomeReport(period: period, students: students);
      });

  @override
  Stream<List<PaymentDetails>> watchPayments({
    int? studentId,
    DatePeriod? period,
  }) {
    final payments = _db.payments;
    final filters = <Expression<bool>>[
      if (studentId != null) payments.studentId.equals(studentId),
      if (period != null) ...[
        payments.paidAt.isBiggerOrEqualValue(period.start),
        payments.paidAt.isSmallerThanValue(period.end),
      ],
    ];

    final query =
        _db.select(payments).join([
          innerJoin(
            _db.students,
            _db.students.id.equalsExp(payments.studentId),
          ),
        ])..orderBy([
          OrderingTerm.desc(payments.paidAt),
          OrderingTerm.desc(payments.id),
        ]);
    if (filters.isNotEmpty) query.where(filters.reduce((a, b) => a & b));

    return query.watch().map(
      (rows) => rows
          .map(
            (row) => PaymentDetails(
              payment: row.readTable(payments).toModel(),
              studentName: row.readTable(_db.students).fullName,
            ),
          )
          .toList(),
    );
  }

  @override
  Future<Payment?> getPayment(int id) async {
    final row = await (_db.select(
      _db.payments,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    return row?.toModel();
  }

  @override
  Future<int> createPayment(PaymentDraft draft) =>
      _db.into(_db.payments).insert(draft.toCompanion());

  @override
  Future<void> updatePayment(Payment payment) async {
    final updated =
        await (_db.update(_db.payments)..where((t) => t.id.equals(payment.id)))
            .write(payment.toUpdateCompanion(DateTime.now()));
    if (updated == 0) {
      throw const NotFoundFailure(FailureReason.paymentNotFound);
    }
  }

  @override
  Future<void> deletePayment(int id) =>
      (_db.delete(_db.payments)..where((t) => t.id.equals(id))).go();

  @override
  Stream<StudentBalance?> watchBalance(int studentId) =>
      _balancesQuery(studentId: studentId)
          .watchSingleOrNull()
          .map((row) => row == null ? null : _toBalance(row));

  @override
  Stream<List<StudentBalance>> watchBalances() =>
      _balancesQuery().watch().map((rows) => rows.map(_toBalance).toList());

  @override
  Stream<List<StudentBalance>> watchDebtors({Money minDebt = Money.zero}) =>
      watchBalances().map((balances) => _debtorsOf(balances, minDebt));

  @override
  Future<List<StudentBalance>> getDebtors({Money minDebt = Money.zero}) async {
    final rows = await _balancesQuery().get();
    return _debtorsOf(rows.map(_toBalance), minDebt);
  }

  Selectable<QueryRow> _balancesQuery({int? studentId}) => _db.customSelect(
    studentId == null ? _balancesSql : '$_balancesSql WHERE s.id = ?1',
    variables: [if (studentId != null) Variable.withInt(studentId)],
    readsFrom: {
      _db.students,
      _db.enrollments,
      _db.lessons,
      _db.lessonPackages,
      _db.payments,
    },
  );

  StudentBalance _toBalance(QueryRow row) => StudentBalance(
    studentId: row.read<int>('student_id'),
    studentName: row.read<String>('student_name'),
    isArchived: row.read<bool>('is_archived'),
    lessonsCharged: Money(row.read<int>('lessons_charged')),
    packagesCharged: Money(row.read<int>('packages_charged')),
    paid: Money(row.read<int>('paid')),
    lastPaymentAt: row.readNullable<DateTime>('last_payment_at'),
  );

  List<StudentBalance> _debtorsOf(
    Iterable<StudentBalance> balances,
    Money minDebt,
  ) =>
      balances
          .where((balance) => balance.hasDebt && balance.debt >= minDebt)
          .toList()
        ..sort((a, b) => b.debt.compareTo(a.debt));
}

import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/finance/domain/models/finance_summary.dart';
import 'package:tutor_app/features/finance/domain/models/income_report.dart';
import 'package:tutor_app/features/finance/domain/models/student_balance.dart';
import 'package:tutor_app/features/finance/domain/payment_validator.dart';

StudentBalance _balance(
  String name, {
  int charged = 0,
  int packages = 0,
  int paid = 0,
}) => StudentBalance(
  studentId: name.hashCode,
  studentName: name,
  lessonsCharged: Money.rubles(charged),
  packagesCharged: Money.rubles(packages),
  paid: Money.rubles(paid),
);

void main() {
  group('баланс ученика: начислено / оплачено / долг', () {
    test('долг = занятия + пакеты − платежи', () {
      final balance = _balance(
        'Анна',
        charged: 4500,
        packages: 5000,
        paid: 6000,
      );

      expect(balance.charged, const Money.rubles(9500));
      expect(balance.balance, const Money.rubles(-3500));
      expect(balance.debt, const Money.rubles(3500));
      expect(balance.hasDebt, isTrue);
    });

    test('переплата — аванс, долга нет', () {
      final balance = _balance('Анна', charged: 1500, paid: 2000);

      expect(balance.balance, const Money.rubles(500));
      expect(balance.debt, Money.zero);
      expect(balance.hasDebt, isFalse);
    });
  });

  group('сводка по всем ученикам', () {
    test('долги и авансы не взаимозачитываются', () {
      final summary = FinanceSummary.fromBalances([
        _balance('Анна', charged: 3000),
        _balance('Борис', charged: 1500, paid: 500),
        _balance('Вера', charged: 1000, paid: 3000),
        _balance('Глеб', charged: 2000, paid: 2000),
      ]);

      expect(summary.totalDebt, const Money.rubles(4000));
      expect(summary.totalAdvance, const Money.rubles(2000));
      expect(summary.totalCharged, const Money.rubles(7500));
      expect(summary.totalPaid, const Money.rubles(5500));
      expect(summary.debtorsCount, 2);
    });

    test('пустая сводка', () {
      final summary = FinanceSummary.fromBalances(const []);

      expect(summary.totalDebt, Money.zero);
      expect(summary.debtorsCount, 0);
    });
  });

  group('отчёт о доходах', () {
    test('итоги складываются из строк учеников', () {
      final report = IncomeReport(
        period: DatePeriod.month(DateTime(2026, 10)),
        students: const [
          StudentIncome(
            studentId: 1,
            studentName: 'Анна',
            received: Money.rubles(3000),
            lessonsCharged: Money.rubles(1500),
            completedLessons: 1,
            completedDuration: Duration(minutes: 60),
          ),
          StudentIncome(
            studentId: 2,
            studentName: 'Борис',
            packagesSold: Money.rubles(5000),
            completedLessons: 2,
            completedDuration: Duration(minutes: 90),
          ),
        ],
      );

      expect(report.received, const Money.rubles(3000));
      expect(report.lessonsCharged, const Money.rubles(1500));
      expect(report.packagesSold, const Money.rubles(5000));
      expect(report.charged, const Money.rubles(6500));
      expect(report.completedLessons, 3);
      expect(report.completedDuration, const Duration(minutes: 150));
    });
  });

  group('проверка платежа', () {
    final now = DateTime(2026, 10, 13, 12);

    test('сумма из поля формы', () {
      expect(PaymentValidator.amount(''), isNotNull);
      expect(PaymentValidator.amount('0'), isNotNull);
      expect(PaymentValidator.amount('abc'), isNotNull);
      expect(PaymentValidator.amount('1000001'), isNotNull);
      expect(PaymentValidator.amount('1 500,50'), isNull);
    });

    test('дата: сегодня в любой час можно, завтра нельзя', () {
      PaymentValidator.ensureValid(
        amount: const Money.rubles(100),
        paidAt: DateTime(2026, 10, 13, 23, 59),
        now: now,
      );
      expect(
        () => PaymentValidator.ensureValid(
          amount: const Money.rubles(100),
          paidAt: DateTime(2026, 10, 14),
          now: now,
        ),
        throwsA(isA<ValidationFailure>()),
      );
    });
  });
}

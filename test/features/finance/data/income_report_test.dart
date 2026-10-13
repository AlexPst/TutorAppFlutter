import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/database/drift_transaction_runner.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/finance/domain/models/payment.dart';
import 'package:tutor_app/features/finance/domain/usecases/save_payment.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';

import '../../../helpers/seed.dart';

void main() {
  late AppDatabase db;
  late Seed seed;

  setUp(() {
    db = createTestDatabase();
    seed = Seed(db);
  });

  tearDown(() => db.close());

  group('отчёт о доходах за период', () {
    test('получено и начислено считаются по своим датам', () async {
      final anna = await seed.student('Анна');
      final boris = await seed.student('Борис');
      final idle = await seed.student('Без движения');
      final annaMath = await seed.enrollment(studentId: anna);
      final borisMath = await seed.enrollment(studentId: boris);
      await seed.enrollment(studentId: idle);

      // Октябрь.
      await seed.lesson(
        annaMath,
        startsAt: DateTime(2026, 10, 2, 18),
        status: LessonStatus.completed,
        duration: const Duration(minutes: 90),
      );
      await seed.lesson(
        annaMath,
        startsAt: DateTime(2026, 10, 9, 18),
        status: LessonStatus.noShow,
      );
      await seed.lesson(
        annaMath,
        startsAt: DateTime(2026, 10, 16, 18),
        status: LessonStatus.cancelledByTutor,
      );
      await seed.payment(
        anna,
        const Money.rubles(2000),
        paidAt: DateTime(2026, 10, 20),
      );
      final package = await seed.package(
        borisMath,
        purchasedAt: DateTime(2026, 10, 1),
      );
      await seed.lesson(
        borisMath,
        startsAt: DateTime(2026, 10, 3, 18),
        status: LessonStatus.completed,
        packageId: package,
      );
      // Сентябрь — не попадает в отчёт за октябрь.
      await seed.payment(
        boris,
        const Money.rubles(5000),
        paidAt: DateTime(2026, 9, 30),
      );
      await seed.lesson(
        borisMath,
        startsAt: DateTime(2026, 9, 29, 18),
        status: LessonStatus.completed,
      );

      final report = await seed.payments
          .watchIncomeReport(DatePeriod.month(DateTime(2026, 10)))
          .first;

      expect(report.students.map((s) => s.studentName), ['Анна', 'Борис']);
      final annaIncome = report.students.first;
      expect(annaIncome.received, const Money.rubles(2000));
      expect(annaIncome.lessonsCharged, const Money.rubles(3000));
      expect(annaIncome.completedLessons, 1);
      expect(annaIncome.completedDuration, const Duration(minutes: 90));
      final borisIncome = report.students.last;
      expect(borisIncome.received, Money.zero);
      expect(borisIncome.lessonsCharged, Money.zero);
      expect(borisIncome.packagesSold, const Money.rubles(5000));
      expect(borisIncome.completedLessons, 1);

      expect(report.received, const Money.rubles(2000));
      expect(report.charged, const Money.rubles(8000));
      expect(report.completedLessons, 2);
    });

    test('пустой период', () async {
      await seed.enrollment();

      final report = await seed.payments
          .watchIncomeReport(DatePeriod.day(DateTime(2026, 10, 13)))
          .first;

      expect(report.isEmpty, isTrue);
      expect(report.received, Money.zero);
    });
  });

  group('сохранение платежа', () {
    late SavePaymentUseCase save;

    setUp(() {
      save = SavePaymentUseCase(
        payments: seed.payments,
        students: seed.students,
        transaction: DriftTransactionRunner(db),
        clock: () => DateTime(2026, 10, 13, 12),
      );
    });

    test('платёж уменьшает долг', () async {
      final studentId = await seed.student();
      final enrollmentId = await seed.enrollment(studentId: studentId);
      await seed.lesson(
        enrollmentId,
        startsAt: DateTime(2026, 10, 1, 18),
        status: LessonStatus.completed,
      );

      await save.create(
        PaymentDraft(
          studentId: studentId,
          amount: const Money.rubles(1000),
          paidAt: DateTime(2026, 10, 13),
          comment: '  ',
        ),
      );

      final balance = await seed.payments.watchBalance(studentId).first;
      expect(balance?.debt, const Money.rubles(500));
      final payment = (await seed.payments.watchPayments().first).single;
      expect(payment.payment.comment, isNull);
    });

    test('будущая дата и несуществующий ученик отклоняются', () async {
      final studentId = await seed.student();

      await expectLater(
        save.create(
          PaymentDraft(
            studentId: studentId,
            amount: const Money.rubles(1000),
            paidAt: DateTime(2026, 10, 14),
          ),
        ),
        throwsA(isA<ValidationFailure>()),
      );
      await expectLater(
        save.create(
          PaymentDraft(
            studentId: 999,
            amount: const Money.rubles(1000),
            paidAt: DateTime(2026, 10, 13),
          ),
        ),
        throwsA(isA<NotFoundFailure>()),
      );
    });

    test('изменение не переносит платёж другому ученику', () async {
      final anna = await seed.student('Анна');
      final boris = await seed.student('Борис');
      final id = await seed.payment(anna, const Money.rubles(1000));
      final payment = await seed.payments.getPayment(id);

      await save.update(
        payment!.copyWith(studentId: boris, amount: const Money.rubles(1200)),
      );

      final updated = await seed.payments.getPayment(id);
      expect(updated?.studentId, anna);
      expect(updated?.amount, const Money.rubles(1200));
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/core/domain/money.dart';
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

  DateTime day(int day) => DateTime(2026, 10, day, 18);

  group('баланс', () {
    test(
      'начисляются только оплачиваемые занятия вне пакета и пакеты',
      () async {
        final studentId = await seed.student();
        final math = await seed.enrollment(studentId: studentId);
        final physics = await seed.enrollment(
          studentId: studentId,
          rate: const Money.rubles(2000),
        );
        final packageId = await seed.package(physics);

        await seed.lesson(
          math,
          startsAt: day(1),
          status: LessonStatus.completed,
        );
        await seed.lesson(math, startsAt: day(2), status: LessonStatus.noShow);
        await seed.lesson(
          math,
          startsAt: day(3),
          status: LessonStatus.cancelledByStudent,
        );
        await seed.lesson(
          math,
          startsAt: day(4),
          status: LessonStatus.cancelledByTutor,
        );
        await seed.lesson(math, startsAt: day(5));
        await seed.lesson(
          physics,
          startsAt: day(6),
          status: LessonStatus.completed,
          packageId: packageId,
          price: const Money.rubles(2000),
        );
        await seed.payment(studentId, const Money.rubles(4000));

        final balance = await seed.payments.watchBalance(studentId).first;

        expect(balance?.lessonsCharged, const Money.rubles(4500));
        expect(balance?.packagesCharged, const Money.rubles(5000));
        expect(balance?.paid, const Money.rubles(4000));
        expect(balance?.balance, const Money.rubles(-5500));
        expect(balance?.debt, const Money.rubles(5500));
        expect(balance?.lastPaymentAt, DateTime(2026, 10, 10));
      },
    );

    test('ученик без операций: нулевой баланс', () async {
      final studentId = await seed.student();

      final balance = await seed.payments.watchBalance(studentId).first;

      expect(balance?.balance, Money.zero);
      expect(balance?.hasDebt, isFalse);
      expect(balance?.lastPaymentAt, isNull);
    });

    test('баланс пересчитывается после платежа', () async {
      final studentId = await seed.student();
      final enrollmentId = await seed.enrollment(studentId: studentId);
      await seed.lesson(
        enrollmentId,
        startsAt: day(1),
        status: LessonStatus.completed,
      );
      final debts = seed.payments
          .watchBalance(studentId)
          .map((balance) => balance!.debt);
      final expectation = expectLater(
        debts,
        emitsInOrder([const Money.rubles(1500), Money.zero]),
      );

      await Future<void>.delayed(Duration.zero);
      await seed.payment(studentId, const Money.rubles(1500));
      await expectation;
    });

    test('удаление пакета делает его занятия платными', () async {
      final studentId = await seed.student();
      final enrollmentId = await seed.enrollment(studentId: studentId);
      final packageId = await seed.package(enrollmentId);
      await seed.lesson(
        enrollmentId,
        startsAt: day(1),
        status: LessonStatus.completed,
        packageId: packageId,
      );

      await seed.packages.deletePackage(packageId);
      final balance = await seed.payments.watchBalance(studentId).first;

      expect(balance?.lessonsCharged, const Money.rubles(1500));
      expect(balance?.packagesCharged, Money.zero);
    });

    test('должники: с порогом, по убыванию долга, без авансов', () async {
      final small = await seed.student('Малый долг');
      final big = await seed.student('Большой долг');
      final advance = await seed.student('Аванс');
      for (final (studentId, lessons) in [(small, 1), (big, 3), (advance, 1)]) {
        final enrollmentId = await seed.enrollment(studentId: studentId);
        for (var i = 1; i <= lessons; i++) {
          await seed.lesson(
            enrollmentId,
            startsAt: day(i),
            status: LessonStatus.completed,
          );
        }
      }
      await seed.payment(advance, const Money.rubles(3000));

      final all = await seed.payments.watchDebtors().first;
      final aboveThreshold = await seed.payments.getDebtors(
        minDebt: const Money.rubles(2000),
      );

      expect(all.map((b) => b.studentName), ['Большой долг', 'Малый долг']);
      expect(aboveThreshold.map((b) => b.studentId), [big]);
    });
  });

  group('платежи', () {
    test('история: фильтры, сначала новые, с именем ученика', () async {
      final anna = await seed.student('Анна');
      final boris = await seed.student('Борис');
      final early = await seed.payment(
        anna,
        const Money.rubles(1000),
        paidAt: DateTime(2026, 10, 2),
      );
      final late = await seed.payment(
        anna,
        const Money.rubles(1000),
        paidAt: DateTime(2026, 10, 20),
      );
      await seed.payment(
        anna,
        const Money.rubles(1000),
        paidAt: DateTime(2026, 9, 30),
      );
      await seed.payment(
        boris,
        const Money.rubles(1000),
        paidAt: DateTime(2026, 10, 5),
      );

      final payments = await seed.payments
          .watchPayments(
            studentId: anna,
            period: DatePeriod.month(DateTime(2026, 10)),
          )
          .first;

      expect(payments.map((p) => p.payment.id), [late, early]);
      expect(payments.first.studentName, 'Анна');
    });

    test('обновление платежа', () async {
      final studentId = await seed.student();
      final id = await seed.payment(studentId, const Money.rubles(1000));
      final payment = await seed.payments.getPayment(id);

      await seed.payments.updatePayment(
        payment!.copyWith(amount: const Money.rubles(1200), comment: 'СБП'),
      );
      final updated = await seed.payments.getPayment(id);

      expect(updated?.amount, const Money.rubles(1200));
      expect(updated?.comment, 'СБП');
    });
  });

  group('пакеты', () {
    test('доступные пакеты: FIFO, без исчерпанных', () async {
      final enrollmentId = await seed.enrollment();
      final exhausted = await seed.package(
        enrollmentId,
        lessonsCount: 1,
        purchasedAt: DateTime(2026, 9, 1),
      );
      final newer = await seed.package(
        enrollmentId,
        purchasedAt: DateTime(2026, 10, 5),
      );
      final older = await seed.package(
        enrollmentId,
        purchasedAt: DateTime(2026, 10, 1),
      );
      await seed.lesson(
        enrollmentId,
        startsAt: day(1),
        status: LessonStatus.completed,
        packageId: exhausted,
      );
      await seed.lesson(
        enrollmentId,
        startsAt: day(2),
        status: LessonStatus.completed,
        packageId: older,
      );

      final available = await seed.packages.getAvailablePackages(enrollmentId);

      expect(available.map((p) => p.package.id), [older, newer]);
      expect(available.first.usedLessons, 1);
      expect(available.first.remainingLessons, 3);
    });

    test('пакеты ученика по всем направлениям, сначала новые', () async {
      final studentId = await seed.student();
      final math = await seed.enrollment(studentId: studentId);
      final physics = await seed.enrollment(studentId: studentId);
      final first = await seed.package(math, purchasedAt: DateTime(2026, 9, 1));
      final second = await seed.package(physics);
      await seed.package(await seed.enrollment());

      final packages = await seed.packages
          .watchPackages(studentId: studentId)
          .first;

      expect(packages.map((p) => p.package.id), [second, first]);
    });

    test('нельзя сделать занятий меньше, чем уже списано', () async {
      final enrollmentId = await seed.enrollment();
      final packageId = await seed.package(enrollmentId);
      for (final i in [1, 2]) {
        await seed.lesson(
          enrollmentId,
          startsAt: day(i),
          status: LessonStatus.completed,
          packageId: packageId,
        );
      }
      final package = await seed.packages.getPackage(packageId);

      await expectLater(
        seed.packages.updatePackage(package!.copyWith(lessonsCount: 1)),
        throwsA(isA<ConflictFailure>()),
      );
      await seed.packages.updatePackage(package.copyWith(lessonsCount: 2));
      expect((await seed.packages.getPackage(packageId))?.lessonsCount, 2);
    });
  });
}

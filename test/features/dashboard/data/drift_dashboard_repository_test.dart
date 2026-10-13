import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/dashboard/data/repositories/drift_dashboard_repository.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';

import '../../../helpers/seed.dart';

void main() {
  late AppDatabase db;
  late Seed seed;
  late DriftDashboardRepository dashboard;

  setUp(() {
    db = createTestDatabase();
    seed = Seed(db);
    dashboard = DriftDashboardRepository(db);
  });

  tearDown(() => db.close());

  test('статистика месяца', () async {
    final studentId = await seed.student();
    final enrollmentId = await seed.enrollment(studentId: studentId);
    final packageId = await seed.package(
      enrollmentId,
      purchasedAt: DateTime(2026, 10, 3),
    );
    // Пакет и платёж прошлого месяца не учитываются.
    await seed.package(enrollmentId, purchasedAt: DateTime(2026, 9, 30));
    await seed.payment(
      studentId,
      const Money.rubles(999),
      paidAt: DateTime(2026, 9, 30),
    );
    await seed.payment(
      studentId,
      const Money.rubles(3000),
      paidAt: DateTime(2026, 10, 15),
    );

    await seed.lesson(
      enrollmentId,
      startsAt: DateTime(2026, 10, 1, 18),
      status: LessonStatus.completed,
      duration: const Duration(minutes: 90),
    );
    await seed.lesson(
      enrollmentId,
      startsAt: DateTime(2026, 10, 2, 18),
      status: LessonStatus.completed,
      packageId: packageId,
    );
    await seed.lesson(
      enrollmentId,
      startsAt: DateTime(2026, 10, 3, 18),
      status: LessonStatus.noShow,
    );
    await seed.lesson(
      enrollmentId,
      startsAt: DateTime(2026, 10, 4, 18),
      status: LessonStatus.cancelledByTutor,
    );
    await seed.lesson(enrollmentId, startsAt: DateTime(2026, 10, 30, 18));
    await seed.lesson(
      enrollmentId,
      startsAt: DateTime(2026, 11, 1, 10),
      status: LessonStatus.completed,
    );

    final stats = await dashboard
        .watchPeriodStats(DatePeriod.month(DateTime(2026, 10)))
        .first;

    expect(stats.lessonsByStatus, {
      LessonStatus.planned: 1,
      LessonStatus.completed: 2,
      LessonStatus.cancelledByStudent: 0,
      LessonStatus.cancelledByTutor: 1,
      LessonStatus.noShow: 1,
    });
    expect(stats.completedDuration, const Duration(minutes: 150));
    expect(stats.lessonsCharged, const Money.rubles(3000));
    expect(stats.packagesSold, const Money.rubles(5000));
    expect(stats.charged, const Money.rubles(8000));
    expect(stats.received, const Money.rubles(3000));
    expect(stats.attendanceRate, closeTo(2 / 3, 1e-9));
  });

  test('пустой период', () async {
    final stats = await dashboard
        .watchPeriodStats(DatePeriod.month(DateTime(2026, 10)))
        .first;

    expect(stats.completedLessons, 0);
    expect(stats.charged, Money.zero);
    expect(stats.attendanceRate, isNull);
  });
}

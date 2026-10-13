import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/providers/clock_provider.dart';
import 'package:tutor_app/features/dashboard/dashboard_providers.dart';
import 'package:tutor_app/features/dashboard/domain/models/period_stats.dart';
import 'package:tutor_app/features/dashboard/domain/models/upcoming_range.dart';
import 'package:tutor_app/features/finance/domain/models/student_balance.dart';
import 'package:tutor_app/features/finance/finance_providers.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_details.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/lessons/lessons_providers.dart';
import 'package:tutor_app/features/students/students_providers.dart';

part 'dashboard_screen_providers.g.dart';

@riverpod
class UpcomingRangeController extends _$UpcomingRangeController {
  @override
  UpcomingRange build() => UpcomingRange.today;

  void set(UpcomingRange range) => state = range;
}

/// Запланированные занятия в выбранном горизонте, по времени начала.
@riverpod
Stream<List<LessonDetails>> upcomingLessons(Ref ref) {
  final range = ref.watch(upcomingRangeControllerProvider);
  final period = range.periodFrom(ref.watch(clockProvider)());
  return ref
      .watch(lessonRepositoryProvider)
      .watchLessons(period: period, statuses: {LessonStatus.planned});
}

/// Прошедшие, но не отмеченные занятия.
@riverpod
Stream<List<LessonDetails>> unmarkedLessons(Ref ref) => ref
    .watch(lessonRepositoryProvider)
    .watchUnmarked(now: ref.watch(clockProvider)());

/// Статистика текущего месяца: получено, начислено, проведено занятий.
@riverpod
Stream<PeriodStats> currentMonthStats(Ref ref) => ref
    .watch(dashboardRepositoryProvider)
    .watchPeriodStats(DatePeriod.month(ref.watch(clockProvider)()));

@riverpod
Stream<int> activeStudentsCount(Ref ref) => ref
    .watch(studentRepositoryProvider)
    .watchStudents()
    .map((students) => students.length);

/// Должники по убыванию долга.
@riverpod
Stream<List<StudentBalance>> dashboardDebtors(Ref ref) =>
    ref.watch(paymentRepositoryProvider).watchDebtors();

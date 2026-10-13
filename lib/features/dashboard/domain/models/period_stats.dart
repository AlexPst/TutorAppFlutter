import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';

part 'period_stats.freezed.dart';

/// Статистика за период. Занятия относятся к периоду по времени начала,
/// пакеты — по дате оформления, платежи — по дате оплаты.
@freezed
abstract class PeriodStats with _$PeriodStats {
  const factory PeriodStats({
    required DatePeriod period,
    required Map<LessonStatus, int> lessonsByStatus,
    required Duration completedDuration,
    required Money lessonsCharged,
    required Money packagesSold,
    required Money received,
  }) = _PeriodStats;

  const PeriodStats._();

  int countOf(LessonStatus status) => lessonsByStatus[status] ?? 0;

  int get completedLessons => countOf(LessonStatus.completed);

  /// Начислено за период: занятия вне пакетов и проданные пакеты.
  Money get charged => lessonsCharged + packagesSold;

  /// Доля проведённых среди занятий, которые должны были состояться по вине
  /// или решению ученика. `null`, если таких занятий не было.
  double? get attendanceRate {
    final expected =
        completedLessons +
        countOf(LessonStatus.noShow) +
        countOf(LessonStatus.cancelledByStudent);
    if (expected == 0) return null;
    return completedLessons / expected;
  }
}

import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/students/domain/models/grade_scale.dart';

/// Бизнес-правила занятия. Нарушение — `ValidationFailure`.
abstract final class LessonValidator {
  static const minDuration = Duration(minutes: 5);
  static const maxDuration = Duration(hours: 10);
  static const maxPrice = Money.rubles(1000000);

  static void ensureValid({required Duration duration, required Money price}) {
    if (duration < minDuration || duration > maxDuration) {
      throw const ValidationFailure(FailureReason.lessonDurationOutOfRange);
    }
    if (price.isNegative || price > maxPrice) {
      throw const ValidationFailure(FailureReason.lessonPriceInvalid);
    }
  }

  /// Оценка ставится только проведённому занятию и только по шкале ученика.
  static void ensureGradeAllowed({
    required int? grade,
    required LessonStatus status,
    required GradeScale scale,
  }) {
    if (grade == null) return;
    if (status != LessonStatus.completed) {
      throw const ValidationFailure(FailureReason.gradeOnlyForCompleted);
    }
    if (!scale.contains(grade)) {
      throw ValidationFailure(FailureReason.gradeOutOfScale, {
        'min': scale.min,
        'max': scale.max,
      });
    }
  }
}

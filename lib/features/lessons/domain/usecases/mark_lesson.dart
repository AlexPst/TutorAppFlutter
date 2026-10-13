import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/core/domain/transaction_runner.dart';
import 'package:tutor_app/features/lessons/domain/lesson_validator.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/lessons/domain/repositories/lesson_repository.dart';
import 'package:tutor_app/features/lessons/domain/services/lesson_outcome_service.dart';
import 'package:tutor_app/features/progress/domain/repositories/progress_repository.dart';
import 'package:tutor_app/features/students/domain/repositories/student_repository.dart';
import 'package:tutor_app/features/students/domain/student_validator.dart';

/// Итог занятия для записи в прогресс: оценка и комментарий.
class LessonResult {
  const LessonResult({this.grade, this.comment});

  final int? grade;
  final String? comment;
}

/// Отмечает итог занятия: статус, тему и, если передан [LessonResult],
/// оценку с комментарием. Оплата пересчитывается автоматически.
class MarkLessonUseCase {
  MarkLessonUseCase({
    required this._lessons,
    required this._students,
    required this._progress,
    required this._outcome,
    required this._transaction,
  });

  final LessonRepository _lessons;
  final StudentRepository _students;
  final ProgressRepository _progress;
  final LessonOutcomeService _outcome;
  final TransactionRunner _transaction;

  /// [topic] — новая тема; `null` оставляет прежнюю. [result] — `null`,
  /// если прогресс менять не нужно (быстрая отмена).
  Future<void> call({
    required int lessonId,
    required LessonStatus status,
    String? topic,
    LessonResult? result,
  }) => _transaction.run(() async {
    final current = await _lessons.getLesson(lessonId);
    if (current == null) {
      throw const NotFoundFailure(FailureReason.lessonNotFound);
    }

    if (result?.grade != null) {
      final enrollment = await _students.getEnrollment(current.enrollmentId);
      final student = enrollment == null
          ? null
          : await _students.getStudent(enrollment.studentId);
      if (student == null) {
        throw const NotFoundFailure(FailureReason.studentNotFound);
      }
      LessonValidator.ensureGradeAllowed(
        grade: result!.grade,
        status: status,
        scale: student.gradeScale,
      );
    }

    final next = await _outcome.withBilling(
      previous: current,
      next: current.copyWith(
        status: status,
        topic: topic == null
            ? current.topic
            : StudentValidator.optionalText(topic),
      ),
    );
    await _lessons.updateLesson(next);

    if (result != null) {
      await _progress.saveLessonResult(
        lessonId: lessonId,
        enrollmentId: next.enrollmentId,
        date: next.startsAt,
        grade: result.grade,
        note: StudentValidator.optionalText(result.comment),
      );
    } else {
      await _outcome.dropGradeUnlessCompleted(next);
    }
  });
}

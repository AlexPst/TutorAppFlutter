import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/core/domain/transaction_runner.dart';
import 'package:tutor_app/features/lessons/domain/repositories/lesson_repository.dart';

/// Переносит запланированное занятие на другое время. Статус, стоимость
/// и оплата не меняются.
class RescheduleLessonUseCase {
  RescheduleLessonUseCase({required this._lessons, required this._transaction});

  final LessonRepository _lessons;
  final TransactionRunner _transaction;

  Future<void> call({required int lessonId, required DateTime startsAt}) =>
      _transaction.run(() async {
        final current = await _lessons.getLesson(lessonId);
        if (current == null) {
          throw const NotFoundFailure(FailureReason.lessonNotFound);
        }
        if (!current.status.isPlanned) {
          throw const ValidationFailure(FailureReason.rescheduleOnlyPlanned);
        }
        if (current.startsAt == startsAt) return;
        await _lessons.updateLesson(current.copyWith(startsAt: startsAt));
      });
}

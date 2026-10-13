import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/core/domain/transaction_runner.dart';
import 'package:tutor_app/features/lessons/domain/lesson_validator.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson.dart';
import 'package:tutor_app/features/lessons/domain/repositories/lesson_repository.dart';
import 'package:tutor_app/features/lessons/domain/services/lesson_outcome_service.dart';

/// Сохраняет изменения занятия из формы: время, длительность, стоимость,
/// статус, тему, заметку. Пакет для оплаты выбирается заново по правилам,
/// поэтому переданный `packageId` игнорируется.
class UpdateLessonUseCase {
  UpdateLessonUseCase({
    required this._lessons,
    required this._outcome,
    required this._transaction,
  });

  final LessonRepository _lessons;
  final LessonOutcomeService _outcome;
  final TransactionRunner _transaction;

  Future<void> call(Lesson lesson) => _transaction.run(() async {
    LessonValidator.ensureValid(duration: lesson.duration, price: lesson.price);
    final current = await _lessons.getLesson(lesson.id);
    if (current == null) {
      throw const NotFoundFailure(FailureReason.lessonNotFound);
    }

    final next = await _outcome.withBilling(
      previous: current,
      next: lesson.copyWith(enrollmentId: current.enrollmentId),
    );
    await _lessons.updateLesson(next);
    await _outcome.dropGradeUnlessCompleted(next);
  });
}

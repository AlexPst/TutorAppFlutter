import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/core/domain/transaction_runner.dart';
import 'package:tutor_app/features/lessons/domain/lesson_validator.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/lessons/domain/repositories/lesson_repository.dart';
import 'package:tutor_app/features/lessons/domain/services/lesson_outcome_service.dart';
import 'package:tutor_app/features/students/domain/repositories/student_repository.dart';

/// Создаёт занятие. Можно сразу указать итоговый статус — например,
/// записать уже проведённое занятие; тогда оно сразу оплачивается.
class CreateLessonUseCase {
  CreateLessonUseCase({
    required this._lessons,
    required this._students,
    required this._outcome,
    required this._transaction,
  });

  final LessonRepository _lessons;
  final StudentRepository _students;
  final LessonOutcomeService _outcome;
  final TransactionRunner _transaction;

  Future<int> call(
    LessonDraft draft, {
    LessonStatus status = LessonStatus.planned,
  }) => _transaction.run(() async {
    LessonValidator.ensureValid(duration: draft.duration, price: draft.price);
    final enrollment = await _students.getEnrollment(draft.enrollmentId);
    if (enrollment == null) {
      throw const NotFoundFailure(FailureReason.enrollmentNotFound);
    }
    if (enrollment.isArchived) {
      throw const ValidationFailure(FailureReason.enrollmentArchived);
    }

    final id = await _lessons.createLesson(draft);
    if (status != LessonStatus.planned) {
      final created = (await _lessons.getLesson(id))!;
      await _lessons.updateLesson(
        await _outcome.withBilling(
          previous: null,
          next: created.copyWith(status: status),
        ),
      );
    }
    return id;
  });
}

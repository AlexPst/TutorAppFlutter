import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/core/domain/transaction_runner.dart';
import 'package:tutor_app/features/lessons/domain/lesson_validator.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/lessons/domain/repositories/lesson_repository.dart';
import 'package:tutor_app/features/progress/domain/models/progress_entry.dart';
import 'package:tutor_app/features/progress/domain/repositories/progress_repository.dart';
import 'package:tutor_app/features/students/domain/repositories/student_repository.dart';
import 'package:tutor_app/features/students/domain/student_validator.dart';

/// Создание и изменение записи прогресса вручную.
///
/// Правила:
/// - запись содержит хотя бы тему, оценку или заметку;
/// - оценка — в пределах шкалы ученика;
/// - запись без занятия не может быть датирована будущим;
/// - запись, привязанная к занятию: занятие того же направления, у него
///   нет другой записи, оценка — только если занятие проведено, дата
///   берётся из занятия, а тема хранится в самом занятии (одна тема на
///   расписание и прогресс).
class SaveProgressEntryUseCase {
  SaveProgressEntryUseCase({
    required this._progress,
    required this._lessons,
    required this._students,
    required this._transaction,
    required this._clock,
  });

  final ProgressRepository _progress;
  final LessonRepository _lessons;
  final StudentRepository _students;
  final TransactionRunner _transaction;
  final DateTime Function() _clock;

  Future<int> create(ProgressEntryDraft draft) => _transaction.run(() async {
    final entry = await _prepare(
      enrollmentId: draft.enrollmentId,
      lessonId: draft.lessonId,
      date: draft.date,
      topic: draft.topic,
      grade: draft.grade,
      note: draft.note,
    );
    return _progress.createEntry(entry);
  });

  /// Направление записи не меняется; привязку к занятию можно изменить.
  Future<void> update(ProgressEntry entry) => _transaction.run(() async {
    final current = await _progress.getEntry(entry.id);
    if (current == null) {
      throw const NotFoundFailure(FailureReason.progressEntryNotFound);
    }
    final prepared = await _prepare(
      enrollmentId: current.enrollmentId,
      lessonId: entry.lessonId,
      date: entry.date,
      topic: entry.topic,
      grade: entry.grade,
      note: entry.note,
      entryId: entry.id,
    );
    await _progress.updateEntry(
      entry.copyWith(
        enrollmentId: prepared.enrollmentId,
        lessonId: prepared.lessonId,
        date: prepared.date,
        topic: prepared.topic,
        grade: prepared.grade,
        note: prepared.note,
      ),
    );
  });

  Future<ProgressEntryDraft> _prepare({
    required int enrollmentId,
    required int? lessonId,
    required DateTime date,
    required String? topic,
    required int? grade,
    required String? note,
    int? entryId,
  }) async {
    final normalizedTopic = StudentValidator.optionalText(topic);
    final normalizedNote = StudentValidator.optionalText(note);
    if (normalizedTopic == null && grade == null && normalizedNote == null) {
      throw const ValidationFailure(FailureReason.progressEntryEmpty);
    }

    final enrollment = await _students.getEnrollment(enrollmentId);
    final student = enrollment == null
        ? null
        : await _students.getStudent(enrollment.studentId);
    if (student == null) {
      throw const NotFoundFailure(FailureReason.enrollmentNotFound);
    }
    if (grade != null && !student.gradeScale.contains(grade)) {
      throw ValidationFailure(FailureReason.gradeOutOfScale, {
        'min': student.gradeScale.min,
        'max': student.gradeScale.max,
      });
    }

    if (lessonId == null) {
      final today = _clock();
      if (!date.isBefore(DateTime(today.year, today.month, today.day + 1))) {
        throw const ValidationFailure(FailureReason.progressDateInFuture);
      }
      return ProgressEntryDraft(
        enrollmentId: enrollmentId,
        date: date,
        topic: normalizedTopic,
        grade: grade,
        note: normalizedNote,
      );
    }

    final lesson = await _linkableLesson(
      lessonId: lessonId,
      enrollmentId: enrollmentId,
      entryId: entryId,
    );
    LessonValidator.ensureGradeAllowed(
      grade: grade,
      status: lesson.status,
      scale: student.gradeScale,
    );
    if (normalizedTopic != null && normalizedTopic != lesson.topic) {
      await _lessons.updateLesson(lesson.copyWith(topic: normalizedTopic));
    }
    return ProgressEntryDraft(
      enrollmentId: enrollmentId,
      lessonId: lessonId,
      date: lesson.startsAt,
      grade: grade,
      note: normalizedNote,
    );
  }

  Future<Lesson> _linkableLesson({
    required int lessonId,
    required int enrollmentId,
    required int? entryId,
  }) async {
    final lesson = await _lessons.getLesson(lessonId);
    if (lesson == null) {
      throw const NotFoundFailure(FailureReason.lessonNotFound);
    }
    if (lesson.enrollmentId != enrollmentId) {
      throw const ValidationFailure(FailureReason.lessonOfOtherSubject);
    }
    if (lesson.status == LessonStatus.planned) {
      throw const ValidationFailure(FailureReason.lessonNotPast);
    }
    final existing = await _progress.getEntryForLesson(lessonId);
    if (existing != null && existing.id != entryId) {
      throw const ConflictFailure(FailureReason.lessonHasProgressEntry);
    }
    return lesson;
  }
}

import 'package:tutor_app/features/progress/domain/models/progress_entry.dart';
import 'package:tutor_app/features/progress/domain/models/subject_progress.dart';

abstract interface class ProgressRepository {
  /// Хронология направления: проведённые занятия с темами, их оценки
  /// и заметки, а также самостоятельные записи прогресса.
  Stream<SubjectProgress> watchProgress(int enrollmentId);

  Future<ProgressEntry?> getEntry(int id);

  Future<ProgressEntry?> getEntryForLesson(int lessonId);

  Future<int> createEntry(ProgressEntryDraft draft);

  /// Сохраняет дату, тему, оценку, заметку и привязку к занятию.
  /// Направление не меняется. Бросает `NotFoundFailure`, если записи нет.
  Future<void> updateEntry(ProgressEntry entry);

  Future<void> deleteEntry(int id);

  /// Сохраняет оценку и заметку к занятию: создаёт, обновляет или, если оба
  /// значения пустые, удаляет запись прогресса этого занятия.
  Future<void> saveLessonResult({
    required int lessonId,
    required int enrollmentId,
    required DateTime date,
    int? grade,
    String? note,
  });
}

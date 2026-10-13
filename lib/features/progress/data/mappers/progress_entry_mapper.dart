import 'package:drift/drift.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/features/progress/domain/models/progress_entry.dart';

extension ProgressEntryRowMapper on ProgressEntryRow {
  ProgressEntry toModel() => ProgressEntry(
    id: id,
    enrollmentId: enrollmentId,
    lessonId: lessonId,
    date: entryDate,
    topic: topic,
    grade: grade,
    note: note,
  );
}

extension ProgressEntryDraftMapper on ProgressEntryDraft {
  ProgressEntriesCompanion toCompanion() => ProgressEntriesCompanion.insert(
    enrollmentId: enrollmentId,
    lessonId: Value(lessonId),
    entryDate: date,
    topic: Value(topic),
    grade: Value(grade),
    note: Value(note),
  );
}

extension ProgressEntryMapper on ProgressEntry {
  /// Направление записи не меняется.
  ProgressEntriesCompanion toUpdateCompanion(DateTime updatedAt) =>
      ProgressEntriesCompanion(
        lessonId: Value(lessonId),
        entryDate: Value(date),
        topic: Value(topic),
        grade: Value(grade),
        note: Value(note),
        updatedAt: Value(updatedAt),
      );
}

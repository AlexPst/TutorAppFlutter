import 'package:drift/drift.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/progress/data/mappers/progress_entry_mapper.dart';
import 'package:tutor_app/features/progress/domain/models/progress_entry.dart';
import 'package:tutor_app/features/progress/domain/models/subject_progress.dart';
import 'package:tutor_app/features/progress/domain/repositories/progress_repository.dart';

class DriftProgressRepository implements ProgressRepository {
  DriftProgressRepository(this._db);

  final AppDatabase _db;

  /// Первая часть — занятия направления: проведённые, а также любые другие,
  /// к которым есть запись прогресса. Вторая — записи вне занятий.
  static final _progressSql =
      '''
SELECT
  l.id AS lesson_id,
  p.id AS entry_id,
  l.starts_at AS item_date,
  l.topic AS topic,
  p.grade AS grade,
  p.note AS note
FROM lessons l
LEFT JOIN progress_entries p ON p.lesson_id = l.id
WHERE l.enrollment_id = ?1
  AND (l.status = '${LessonStatus.completed.name}' OR p.id IS NOT NULL)
UNION ALL
SELECT
  NULL,
  p.id,
  p.entry_date,
  p.topic,
  p.grade,
  p.note
FROM progress_entries p
WHERE p.enrollment_id = ?1 AND p.lesson_id IS NULL
ORDER BY item_date DESC, entry_id DESC
''';

  @override
  Stream<SubjectProgress> watchProgress(int enrollmentId) => _db
      .customSelect(
        _progressSql,
        variables: [Variable.withInt(enrollmentId)],
        readsFrom: {_db.lessons, _db.progressEntries},
      )
      .watch()
      .map(
        (rows) => SubjectProgress(
          enrollmentId: enrollmentId,
          items: rows
              .map(
                (row) => ProgressItem(
                  date: row.read<DateTime>('item_date'),
                  lessonId: row.readNullable<int>('lesson_id'),
                  entryId: row.readNullable<int>('entry_id'),
                  topic: row.readNullable<String>('topic'),
                  grade: row.readNullable<int>('grade'),
                  note: row.readNullable<String>('note'),
                ),
              )
              .toList(),
        ),
      );

  @override
  Future<ProgressEntry?> getEntry(int id) async {
    final row = await (_db.select(
      _db.progressEntries,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    return row?.toModel();
  }

  @override
  Future<ProgressEntry?> getEntryForLesson(int lessonId) async {
    final row = await (_db.select(
      _db.progressEntries,
    )..where((t) => t.lessonId.equals(lessonId))).getSingleOrNull();
    return row?.toModel();
  }

  @override
  Future<int> createEntry(ProgressEntryDraft draft) =>
      _db.into(_db.progressEntries).insert(draft.toCompanion());

  @override
  Future<void> updateEntry(ProgressEntry entry) async {
    final updated =
        await (_db.update(_db.progressEntries)
              ..where((t) => t.id.equals(entry.id)))
            .write(entry.toUpdateCompanion(DateTime.now()));
    if (updated == 0) {
      throw const NotFoundFailure(FailureReason.progressEntryNotFound);
    }
  }

  @override
  Future<void> deleteEntry(int id) =>
      (_db.delete(_db.progressEntries)..where((t) => t.id.equals(id))).go();

  @override
  Future<void> saveLessonResult({
    required int lessonId,
    required int enrollmentId,
    required DateTime date,
    int? grade,
    String? note,
  }) => _db.transaction(() async {
    final existing = await getEntryForLesson(lessonId);
    final isEmpty = grade == null && note == null;

    if (existing == null) {
      if (isEmpty) return;
      await createEntry(
        ProgressEntryDraft(
          enrollmentId: enrollmentId,
          lessonId: lessonId,
          date: date,
          grade: grade,
          note: note,
        ),
      );
    } else if (isEmpty) {
      await deleteEntry(existing.id);
    } else {
      await updateEntry(
        existing.copyWith(date: date, grade: grade, note: note),
      );
    }
  });
}

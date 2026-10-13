import 'package:drift/drift.dart';
import 'package:tutor_app/core/database/tables/enrollments_table.dart';
import 'package:tutor_app/core/database/tables/lessons_table.dart';

@DataClassName('ProgressEntryRow')
@TableIndex(
  name: 'idx_progress_entries_enrollment_date',
  columns: {#enrollmentId, #entryDate},
)
class ProgressEntries extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get enrollmentId =>
      integer().references(Enrollments, #id, onDelete: KeyAction.cascade)();

  /// Не больше одной записи прогресса на занятие.
  IntColumn get lessonId => integer().nullable().unique().references(
    Lessons,
    #id,
    onDelete: KeyAction.cascade,
  )();

  DateTimeColumn get entryDate => dateTime()();

  TextColumn get topic => text().nullable()();

  IntColumn get grade => integer().nullable()();

  TextColumn get note => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
    'CHECK (grade IS NOT NULL OR topic IS NOT NULL OR note IS NOT NULL)',
  ];
}

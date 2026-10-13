import 'package:drift/drift.dart';
import 'package:tutor_app/core/database/tables/students_table.dart';
import 'package:tutor_app/core/database/tables/subjects_table.dart';

/// Направление: ученик × предмет со своей ставкой.
@DataClassName('EnrollmentRow')
@TableIndex(name: 'idx_enrollments_subject', columns: {#subjectId})
class Enrollments extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get studentId =>
      integer().references(Students, #id, onDelete: KeyAction.cascade)();

  /// Предмет нельзя удалить, пока по нему есть направления.
  IntColumn get subjectId =>
      integer().references(Subjects, #id, onDelete: KeyAction.restrict)();

  IntColumn get rateKopecks => integer()();

  IntColumn get defaultDurationMinutes =>
      integer().withDefault(const Constant(60))();

  TextColumn get note => text().nullable()();

  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
    {studentId, subjectId},
  ];

  @override
  List<String> get customConstraints => [
    'CHECK (rate_kopecks >= 0)',
    'CHECK (default_duration_minutes > 0)',
  ];
}

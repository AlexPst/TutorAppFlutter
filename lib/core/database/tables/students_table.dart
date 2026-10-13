import 'package:drift/drift.dart';

@DataClassName('StudentRow')
@TableIndex(
  name: 'idx_students_archived_name',
  columns: {#isArchived, #fullName},
)
class Students extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get fullName => text().withLength(min: 1, max: 200)();

  TextColumn get phone => text().nullable()();

  TextColumn get telegram => text().nullable()();

  TextColumn get note => text().nullable()();

  IntColumn get gradeScaleMin => integer().withDefault(const Constant(2))();

  IntColumn get gradeScaleMax => integer().withDefault(const Constant(5))();

  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
    'CHECK (grade_scale_min < grade_scale_max)',
  ];
}

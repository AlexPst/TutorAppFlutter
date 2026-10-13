import 'package:drift/drift.dart';

@DataClassName('SubjectRow')
class Subjects extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 100).unique()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

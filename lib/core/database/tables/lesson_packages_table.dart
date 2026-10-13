import 'package:drift/drift.dart';
import 'package:tutor_app/core/database/tables/enrollments_table.dart';

@DataClassName('LessonPackageRow')
@TableIndex(
  name: 'idx_lesson_packages_enrollment_purchased_at',
  columns: {#enrollmentId, #purchasedAt},
)
class LessonPackages extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get enrollmentId =>
      integer().references(Enrollments, #id, onDelete: KeyAction.cascade)();

  IntColumn get lessonsCount => integer()();

  IntColumn get priceKopecks => integer()();

  DateTimeColumn get purchasedAt => dateTime()();

  TextColumn get note => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
    'CHECK (lessons_count > 0)',
    'CHECK (price_kopecks >= 0)',
  ];
}

import 'package:drift/drift.dart';
import 'package:tutor_app/core/database/tables/enrollments_table.dart';
import 'package:tutor_app/core/database/tables/lesson_packages_table.dart';
import 'package:tutor_app/core/database/tables/sql_constraints.dart';

/// Допустимые значения `lessons.status`. Совпадают с именами `LessonStatus`.
const lessonStatusValues = [
  'planned',
  'completed',
  'cancelledByStudent',
  'cancelledByTutor',
  'noShow',
];

/// Статусы, в которых занятие оплачивается.
const billableLessonStatusValues = [
  'completed',
  'cancelledByStudent',
  'noShow',
];

@DataClassName('LessonRow')
@TableIndex(name: 'idx_lessons_starts_at', columns: {#startsAt})
@TableIndex(
  name: 'idx_lessons_enrollment_starts_at',
  columns: {#enrollmentId, #startsAt},
)
@TableIndex(name: 'idx_lessons_package', columns: {#packageId})
class Lessons extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get enrollmentId =>
      integer().references(Enrollments, #id, onDelete: KeyAction.cascade)();

  DateTimeColumn get startsAt => dateTime()();

  IntColumn get durationMinutes => integer()();

  TextColumn get status => text().withDefault(const Constant('planned'))();

  /// Стоимость, зафиксированная на момент создания занятия.
  IntColumn get priceKopecks => integer()();

  /// При удалении пакета его занятия становятся платными по своей стоимости.
  IntColumn get packageId => integer().nullable().references(
    LessonPackages,
    #id,
    onDelete: KeyAction.setNull,
  )();

  TextColumn get topic => text().nullable()();

  TextColumn get note => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
    'CHECK (duration_minutes > 0)',
    'CHECK (price_kopecks >= 0)',
    'CHECK (${sqlIn('status', lessonStatusValues)})',
    // Из пакета списываются только оплачиваемые занятия.
    'CHECK (package_id IS NULL OR '
        '${sqlIn('status', billableLessonStatusValues)})',
  ];
}

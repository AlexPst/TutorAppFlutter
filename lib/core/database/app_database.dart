import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tutor_app/core/database/tables/app_settings_table.dart';
import 'package:tutor_app/core/database/tables/enrollments_table.dart';
import 'package:tutor_app/core/database/tables/lesson_packages_table.dart';
import 'package:tutor_app/core/database/tables/lessons_table.dart';
import 'package:tutor_app/core/database/tables/payments_table.dart';
import 'package:tutor_app/core/database/tables/progress_entries_table.dart';
import 'package:tutor_app/core/database/tables/students_table.dart';
import 'package:tutor_app/core/database/tables/subjects_table.dart';

part 'app_database.g.dart';

/// Даты хранятся как Unix-время (секунды, UTC) и при чтении переводятся
/// в локальный часовой пояс. Границы дня, недели и месяца вычисляются
/// в Dart по локальному времени и передаются в запросы диапазонами.
@DriftDatabase(
  tables: [
    Students,
    Subjects,
    Enrollments,
    LessonPackages,
    Lessons,
    Payments,
    ProgressEntries,
    AppSettings,
  ],
)
class AppDatabase extends _$AppDatabase {
  /// [executor] передаётся в тестах, например `NativeDatabase.memory()`.
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  static const databaseName = 'tutor_app';

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) => migrator.createAll(),
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  /// Файл БД лежит в каталоге данных приложения, а не в «Документах»:
  /// на Linux это `~/.local/share/<app id>/`.
  static QueryExecutor _openConnection() => driftDatabase(
    name: databaseName,
    native: const DriftNativeOptions(
      databaseDirectory: getApplicationSupportDirectory,
    ),
  );
}

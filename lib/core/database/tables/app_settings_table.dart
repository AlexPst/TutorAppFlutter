import 'package:drift/drift.dart';

/// Настройки приложения в формате ключ–значение. Хранятся в БД,
/// чтобы попадать в резервную копию.
@DataClassName('AppSettingRow')
class AppSettings extends Table {
  TextColumn get key => text()();

  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

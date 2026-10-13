import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/features/settings/domain/models/app_preferences.dart';
import 'package:tutor_app/features/settings/domain/repositories/settings_repository.dart';

/// Настройки в таблице `app_settings` (ключ — значение): так они попадают
/// в резервную копию вместе с данными.
class DriftSettingsRepository implements SettingsRepository {
  DriftSettingsRepository(this._db);

  final AppDatabase _db;

  static const _themeKey = 'theme';
  static const _languageKey = 'language';

  @override
  Stream<AppPreferences> watchPreferences() =>
      _db.select(_db.appSettings).watch().map((rows) {
        final values = {for (final row in rows) row.key: row.value};
        return AppPreferences(
          theme: _parse(
            ThemePreference.values,
            values[_themeKey],
            ThemePreference.system,
          ),
          language: _parse(
            LanguagePreference.values,
            values[_languageKey],
            LanguagePreference.system,
          ),
        );
      });

  @override
  Future<void> setTheme(ThemePreference theme) => _save(_themeKey, theme.name);

  @override
  Future<void> setLanguage(LanguagePreference language) =>
      _save(_languageKey, language.name);

  Future<void> _save(String key, String value) => _db
      .into(_db.appSettings)
      .insertOnConflictUpdate(
        AppSettingsCompanion.insert(key: key, value: value),
      );

  /// Неизвестное значение (например, из более новой версии) — по умолчанию.
  static T _parse<T extends Enum>(List<T> values, String? name, T fallback) =>
      values.where((value) => value.name == name).firstOrNull ?? fallback;
}

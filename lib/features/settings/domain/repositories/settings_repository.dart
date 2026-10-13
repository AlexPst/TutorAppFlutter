import 'package:tutor_app/features/settings/domain/models/app_preferences.dart';

abstract interface class SettingsRepository {
  /// Текущие настройки; несохранённые значения — по умолчанию.
  Stream<AppPreferences> watchPreferences();

  Future<void> setTheme(ThemePreference theme);

  Future<void> setLanguage(LanguagePreference language);
}

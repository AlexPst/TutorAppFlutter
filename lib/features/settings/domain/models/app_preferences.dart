import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_preferences.freezed.dart';

enum ThemePreference { system, light, dark }

/// Язык интерфейса. `system` — язык устройства, если он поддерживается,
/// иначе английский.
enum LanguagePreference { system, ru, en }

/// Пользовательские настройки внешнего вида.
@freezed
abstract class AppPreferences with _$AppPreferences {
  const factory AppPreferences({
    @Default(ThemePreference.system) ThemePreference theme,
    @Default(LanguagePreference.system) LanguagePreference language,
  }) = _AppPreferences;
}

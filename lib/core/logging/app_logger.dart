import 'dart:developer' as developer;

/// Журнал приложения поверх `dart:developer`: виден в `flutter run`,
/// DevTools и `adb logcat`, не требует зависимостей.
abstract final class AppLogger {
  static const _name = 'tutor_app';

  /// Уровень SEVERE из `package:logging`.
  static const _errorLevel = 1000;

  static void info(String message) => developer.log(message, name: _name);

  static void error(String message, Object error, [StackTrace? stackTrace]) =>
      developer.log(
        message,
        name: _name,
        level: _errorLevel,
        error: error,
        stackTrace: stackTrace,
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tutor_app/app/router/app_router.dart';
import 'package:tutor_app/app/theme/app_theme.dart';
import 'package:tutor_app/core/errors/app_error_handling.dart';
import 'package:tutor_app/features/settings/domain/models/app_preferences.dart';
import 'package:tutor_app/features/settings/settings_providers.dart';
import 'package:tutor_app/l10n/l10n.dart';

class TutorApp extends ConsumerWidget {
  const TutorApp({super.key});

  /// Язык, если язык устройства не поддерживается.
  static const fallbackLocale = Locale('en');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Пока настройки читаются из БД (доли секунды) — системные значения.
    final preferences =
        ref.watch(appPreferencesProvider).value ?? const AppPreferences();

    return MaterialApp.router(
      onGenerateTitle: (context) => context.l10n.appTitle,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: appMessengerKey,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: switch (preferences.theme) {
        ThemePreference.system => ThemeMode.system,
        ThemePreference.light => ThemeMode.light,
        ThemePreference.dark => ThemeMode.dark,
      },
      locale: switch (preferences.language) {
        LanguagePreference.system => null,
        LanguagePreference.ru => const Locale('ru'),
        LanguagePreference.en => const Locale('en'),
      },
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      localeResolutionCallback: resolveLocale,
      routerConfig: ref.watch(appRouterProvider),
    );
  }

  /// Выбирает поддерживаемый язык по языку устройства (или настройки)
  /// и делает его локалью форматирования дат и сумм (`Formatters`).
  static Locale resolveLocale(Locale? requested, Iterable<Locale> supported) {
    final resolved =
        supported
            .where((locale) => locale.languageCode == requested?.languageCode)
            .firstOrNull ??
        fallbackLocale;
    Intl.defaultLocale = resolved.languageCode;
    return resolved;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_app/core/widgets/content_width.dart';
import 'package:tutor_app/core/widgets/messages.dart';
import 'package:tutor_app/features/settings/domain/models/app_preferences.dart';
import 'package:tutor_app/features/settings/settings_providers.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Тема и язык интерфейса. Изменения применяются сразу.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  Future<void> _save(BuildContext context, Future<void> Function() save) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      await save();
    } on Object catch (error) {
      messenger.showError(error);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final preferences =
        ref.watch(appPreferencesProvider).value ?? const AppPreferences();
    final repository = ref.read(settingsRepositoryProvider);

    Widget section(String title, Widget child) => Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: ContentWidth(
        maxWidth: 640,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            section(
              l10n.settingsTheme,
              SegmentedButton<ThemePreference>(
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(
                    value: ThemePreference.system,
                    icon: const Icon(Icons.brightness_auto_outlined),
                    label: Text(l10n.settingsThemeSystem),
                  ),
                  ButtonSegment(
                    value: ThemePreference.light,
                    icon: const Icon(Icons.light_mode_outlined),
                    label: Text(l10n.settingsThemeLight),
                  ),
                  ButtonSegment(
                    value: ThemePreference.dark,
                    icon: const Icon(Icons.dark_mode_outlined),
                    label: Text(l10n.settingsThemeDark),
                  ),
                ],
                selected: {preferences.theme},
                onSelectionChanged: (selection) =>
                    _save(context, () => repository.setTheme(selection.single)),
              ),
            ),
            section(
              l10n.settingsLanguage,
              SegmentedButton<LanguagePreference>(
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(
                    value: LanguagePreference.system,
                    label: Text(l10n.settingsLanguageSystem),
                  ),
                  ButtonSegment(
                    value: LanguagePreference.ru,
                    label: Text(l10n.languageRussian),
                  ),
                  ButtonSegment(
                    value: LanguagePreference.en,
                    label: Text(l10n.languageEnglish),
                  ),
                ],
                selected: {preferences.language},
                onSelectionChanged: (selection) => _save(
                  context,
                  () => repository.setLanguage(selection.single),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.phone_android_outlined),
              title: Text(l10n.settingsDataNote),
            ),
          ],
        ),
      ),
    );
  }
}

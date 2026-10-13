import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/features/settings/data/repositories/drift_settings_repository.dart';
import 'package:tutor_app/features/settings/domain/models/app_preferences.dart';

import '../../../helpers/seed.dart';

void main() {
  late AppDatabase db;
  late DriftSettingsRepository settings;

  setUp(() {
    db = createTestDatabase();
    settings = DriftSettingsRepository(db);
  });

  tearDown(() => db.close());

  test('по умолчанию — как в системе', () async {
    expect(await settings.watchPreferences().first, const AppPreferences());
  });

  test('тема и язык сохраняются и перезаписываются', () async {
    await settings.setTheme(ThemePreference.dark);
    await settings.setLanguage(LanguagePreference.en);
    await settings.setLanguage(LanguagePreference.ru);

    expect(
      await settings.watchPreferences().first,
      const AppPreferences(
        theme: ThemePreference.dark,
        language: LanguagePreference.ru,
      ),
    );
    expect(await db.select(db.appSettings).get(), hasLength(2));
  });

  test(
    'неизвестное значение (из будущей версии) — значение по умолчанию',
    () async {
      await db
          .into(db.appSettings)
          .insert(AppSettingsCompanion.insert(key: 'theme', value: 'sepia'));

      expect(
        (await settings.watchPreferences().first).theme,
        ThemePreference.system,
      );
    },
  );
}

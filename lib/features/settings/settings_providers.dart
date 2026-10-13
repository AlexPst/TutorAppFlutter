import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/core/database/database_providers.dart';
import 'package:tutor_app/features/settings/data/repositories/drift_settings_repository.dart';
import 'package:tutor_app/features/settings/domain/models/app_preferences.dart';
import 'package:tutor_app/features/settings/domain/repositories/settings_repository.dart';

part 'settings_providers.g.dart';

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(Ref ref) =>
    DriftSettingsRepository(ref.watch(appDatabaseProvider));

/// Настройки внешнего вида; на них подписано всё приложение.
@Riverpod(keepAlive: true)
Stream<AppPreferences> appPreferences(Ref ref) =>
    ref.watch(settingsRepositoryProvider).watchPreferences();

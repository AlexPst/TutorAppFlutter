# Релиз под Android

## Что уже настроено

| | |
|---|---|
| applicationId | `com.dartway.tutor_app` — **после первой публикации не меняется** |
| Версия | `pubspec.yaml` → `version: 1.0.0+1` (`versionName+versionCode`) |
| SDK | min 24 (Android 7.0), target/compile 36 |
| Подпись | upload-ключ из `android/key.properties` (не в git) |
| Разрешения | нет пользовательских (приложение офлайн, `INTERNET` только в debug) |
| Название | «Репетитор» (ru), «Tutor» (остальные языки) — `res/values*/strings.xml` |
| Иконка | adaptive + monochrome (Android 13), legacy для Android 7 |
| Экран запуска | светлый/тёмный, Android 12+ SplashScreen API |

## Ключ подписи

Upload-ключ лежит **вне проекта**: `~/.android-keystores/tutor_app/upload-keystore.jks`
(alias `upload`, RSA 4096, срок 10 000 дней). Пароль — в `android/key.properties`:

```properties
storePassword=…
keyPassword=…
keyAlias=upload
storeFile=/абсолютный/путь/upload-keystore.jks
```

**Сохраните `upload-keystore.jks` и `key.properties` в менеджер паролей или
на зашифрованный носитель.** Без ключа нельзя выпустить обновление в RuStore,
а в Google Play — только через процедуру сброса upload-ключа.

Отпечаток сертификата (SHA-256):
`53:FF:62:0C:96:C8:7E:B7:18:E6:C8:4F:CA:7A:0B:E0:D1:07:03:EC:D4:38:94:02:0A:84:60:0C:1E:40:C6:C6`

Если `key.properties` нет, release подписывается debug-ключом (Gradle выводит
предупреждение) — такую сборку магазины не примут.

Один ключ для обоих магазинов: в Google Play при включении Play App Signing
выберите загрузку **своего** ключа подписи, иначе подписи в Google Play
и RuStore разойдутся и приложение из одного магазина не обновится из другого.

## Сборка

Перед каждым релизом увеличьте `versionCode` (число после `+`) в `pubspec.yaml`.

```bash
flutter analyze && flutter test
V=$(grep '^version:' pubspec.yaml | cut -d' ' -f2)

# Google Play — AAB
flutter build appbundle --release --obfuscate --split-debug-info=build/symbols/$V

# RuStore / раздача вручную — универсальный APK и APK по архитектурам
flutter build apk --release --obfuscate --split-debug-info=build/symbols/$V
flutter build apk --release --split-per-abi --obfuscate --split-debug-info=build/symbols/$V
```

Результаты:

| Файл | Куда |
|---|---|
| `build/app/outputs/bundle/release/app-release.aab` | Google Play |
| `build/app/outputs/flutter-apk/app-release.apk` | RuStore (все архитектуры) |
| `build/app/outputs/flutter-apk/app-arm64-v8a-release.apk` | тестировщикам (большинство телефонов) |

**Каталог `build/symbols/<версия>` сохраните отдельно** (`flutter clean` его
удаляет): без него стек ошибки из обфусцированной сборки не расшифровать —
`flutter symbolize -i <stack.txt> -d build/symbols/<версия>/app.android-arm64.symbols`.

Проверка подписи и манифеста:

```bash
BT=$ANDROID_HOME/build-tools/36.1.0
$BT/apksigner verify --print-certs build/app/outputs/flutter-apk/app-release.apk
$BT/aapt2 dump badging build/app/outputs/flutter-apk/app-release.apk | grep -E 'package|permission'
```

## Иконка и экран запуска

Исходники рисует `tool/brand_assets.py` (Pillow) в `assets/icon/`, `assets/splash/`
и `docs/store/`. После изменения:

```bash
python3 tool/brand_assets.py .
dart run flutter_launcher_icons        # flutter_launcher_icons.yaml
dart run flutter_native_splash:create  # flutter_native_splash.yaml
```

## Материалы для магазинов

- `docs/store/icon-512.png` — иконка 512×512.
- `docs/store/feature-graphic.png` — обложка Google Play 1024×500.
- Скриншоты телефона (2–8 шт., ru и en) — снять с устройства.
- Политика конфиденциальности (URL): данные хранятся только на устройстве,
  не передаются, аналитики нет.
- Google Play Data safety: «данные не собираются и не передаются».

## Перед загрузкой

- [ ] Проверить release-сборку на реальном телефоне (Android 7 и 14+),
      светлая/тёмная тема, ru/en.
- [ ] Установить новую версию поверх предыдущей — данные сохраняются.
- [ ] Схема БД изменилась → миграция + `dart run drift_dev make-migrations`.
- [ ] Google Play, личный аккаунт: закрытое тестирование (12 тестировщиков, 14 дней)
      до выхода в production.

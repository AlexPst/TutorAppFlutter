import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_app/app/app.dart';
import 'package:tutor_app/app/router/app_router.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/database/database_providers.dart';
import 'package:tutor_app/core/providers/clock_provider.dart';

/// «Сейчас» в виджетных тестах: вторник, 13 октября 2026, 12:00.
final testNow = DateTime(2026, 10, 13, 12);

/// Запускает приложение на БД в памяти с экраном размера телефона,
/// фиксированным временем [testNow] и языком устройства [locale]
/// (в тестах по умолчанию был бы en_US).
Future<void> pumpApp(
  WidgetTester tester,
  AppDatabase db, {
  String? location,
  Locale locale = const Locale('ru'),
}) async {
  tester.view
    ..physicalSize = const Size(1200, 2700)
    ..devicePixelRatio = 3;
  addTearDown(tester.view.reset);
  tester.platformDispatcher.localesTestValue = [locale];
  addTearDown(tester.platformDispatcher.clearLocalesTestValue);

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        appDatabaseProvider.overrideWithValue(db),
        clockProvider.overrideWithValue(() => testNow),
      ],
      child: const TutorApp(),
    ),
  );
  if (location != null) {
    final container = ProviderScope.containerOf(
      tester.element(find.byType(TutorApp)),
    );
    container.read(appRouterProvider).go(location);
  }
  await tester.pumpAndSettle();
}

/// Текущий путь роутера.
String currentLocation(WidgetTester tester) {
  final container = ProviderScope.containerOf(
    tester.element(find.byType(TutorApp)),
  );
  return container.read(appRouterProvider).state.uri.toString();
}

/// Строка без неразрывных пробелов, которые ставит русская локаль в суммах.
Finder findTextIgnoringSpaces(String text) => find.byWidgetPredicate(
  (widget) =>
      widget is Text &&
      widget.data?.replaceAll(RegExp(r'[\u00A0\u202F]'), ' ') == text,
);

/// `testWidgets` для экранов с Drift: после теста размонтирует приложение
/// и прокручивает время, чтобы Drift успел закрыть стримы запросов —
/// иначе их таймеры считаются «зависшими», а `db.close()` не завершается.
void testAppWidgets(
  String description,
  Future<void> Function(WidgetTester tester) body,
) {
  testWidgets(description, (tester) async {
    try {
      await body(tester);
    } finally {
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(const Duration(seconds: 1));
    }
  });
}

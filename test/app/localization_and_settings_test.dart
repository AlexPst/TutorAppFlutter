import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/errors/app_error_handling.dart';
import 'package:tutor_app/core/widgets/messages.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/l10n/l10n.dart';

import '../helpers/pump_app.dart';
import '../helpers/seed.dart';

void main() {
  late AppDatabase db;
  late Seed seed;

  setUpAll(() => initializeDateFormatting());

  setUp(() {
    db = createTestDatabase();
    seed = Seed(db);
  });

  tearDown(() => db.close());

  /// Ученик с одним проведённым занятием — долг 1 500 ₽.
  Future<int> studentWithDebt(String name) async {
    final studentId = await seed.student(name);
    final enrollmentId = await seed.enrollment(
      studentId: studentId,
      subjectId: await seed.subject('Math'),
    );
    await seed.lesson(
      enrollmentId,
      startsAt: DateTime(2026, 10, 1, 18),
      status: LessonStatus.completed,
    );
    return studentId;
  }

  group('английский интерфейс', () {
    testAppWidgets('список учеников', (tester) async {
      await studentWithDebt('Anna');
      await pumpApp(
        tester,
        db,
        location: '/students',
        locale: const Locale('en'),
      );

      expect(find.text('Students'), findsWidgets);
      expect(find.text('Anna'), findsOneWidget);
      expect(find.text('Debt ₽1,500'), findsOneWidget);
      expect(find.text('With debt'), findsOneWidget);
    });

    testAppWidgets('форма занятия: подписи и проверка', (tester) async {
      await studentWithDebt('Anna');
      await pumpApp(
        tester,
        db,
        location: '/lessons/new',
        locale: const Locale('en'),
      );

      expect(find.text('New lesson'), findsOneWidget);
      await tester.tap(find.widgetWithText(FilledButton, 'Create lesson'));
      await tester.pumpAndSettle();
      expect(find.text('Select a student'), findsOneWidget);
      expect(find.text('1 h'), findsOneWidget);
    });

    testAppWidgets('неподдерживаемый язык устройства — английский', (
      tester,
    ) async {
      await pumpApp(
        tester,
        db,
        location: '/students',
        locale: const Locale('de'),
      );

      expect(find.text('No students yet'), findsOneWidget);
    });
  });

  group('настройки', () {
    testAppWidgets('язык переключается сразу и сохраняется', (tester) async {
      await pumpApp(tester, db);
      expect(find.text('Главная'), findsWidgets);

      await tester.tap(find.byTooltip('Настройки'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('English'));
      await tester.pumpAndSettle();

      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Language'), findsOneWidget);
      final row = await (db.select(
        db.appSettings,
      )..where((t) => t.key.equals('language'))).getSingle();
      expect(row.value, 'en');

      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();
      expect(find.text('Home'), findsWidgets);
      expect(find.text('Tuesday, October 13'), findsOneWidget);
    });

    testAppWidgets('тёмная тема', (tester) async {
      await pumpApp(tester, db, location: '/settings');
      final context = tester.element(find.text('Тема'));
      expect(Theme.of(context).brightness, Brightness.light);

      await tester.tap(find.text('Тёмная'));
      await tester.pumpAndSettle();

      expect(
        Theme.of(tester.element(find.text('Тема'))).brightness,
        Brightness.dark,
      );
    });
  });

  group('обработка ошибок', () {
    testAppWidgets('непредвиденная ошибка показывается в SnackBar', (
      tester,
    ) async {
      await pumpApp(tester, db);

      appMessengerKey.currentState!.showError(StateError('boom'));
      await tester.pump();

      expect(
        find.text('Что-то пошло не так. Попробуйте ещё раз.'),
        findsOneWidget,
      );
    });

    testWidgets('сломанный виджет заменяется заглушкой', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('ru'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Scaffold(
            body: AppErrorWidget(
              details: FlutterErrorDetails(exception: StateError('boom')),
            ),
          ),
        ),
      );

      expect(find.text('Не удалось показать этот блок'), findsOneWidget);
      expect(find.textContaining('boom'), findsOneWidget, reason: 'debug');
    });

    testWidgets('заглушка без локализаций — английский текст', (tester) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: AppErrorWidget(
            details: FlutterErrorDetails(exception: StateError('boom')),
          ),
        ),
      );

      expect(find.text("This section couldn't be displayed"), findsOneWidget);
    });

    testWidgets('ожидаемые ошибки переводятся по причине', (tester) async {
      late String message;
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('en'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Builder(
            builder: (context) {
              message = errorMessage(context, StateError('internal details'));
              return const SizedBox.shrink();
            },
          ),
        ),
      );

      // Детали внутренних ошибок пользователю не показываются.
      expect(message, 'Something went wrong. Please try again.');
    });
  });
}

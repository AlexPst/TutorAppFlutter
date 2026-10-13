import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';

import '../../../helpers/pump_app.dart';
import '../../../helpers/seed.dart';

void main() {
  late AppDatabase db;
  late Seed seed;

  setUpAll(() => initializeDateFormatting());

  setUp(() {
    db = createTestDatabase();
    seed = Seed(db);
  });

  tearDown(() => db.close());

  group('список учеников', () {
    testAppWidgets('пустое состояние ведёт к созданию ученика', (tester) async {
      await pumpApp(tester, db, location: '/students');

      expect(find.text('Учеников пока нет'), findsOneWidget);
      await tester.tap(find.text('Добавить ученика'));
      await tester.pumpAndSettle();

      expect(find.text('Новый ученик'), findsOneWidget);
    });

    testAppWidgets('индикатор долга, поиск и фильтры', (tester) async {
      final anna = await seed.student('Анна');
      final boris = await seed.student('Борис');
      final vera = await seed.student('Вера');
      final math = await seed.subject('Математика');
      final physics = await seed.subject('Физика');
      final annaMath = await seed.enrollment(studentId: anna, subjectId: math);
      await seed.enrollment(studentId: boris, subjectId: physics);
      await seed.lesson(
        annaMath,
        startsAt: DateTime(2026, 10, 1, 18),
        status: LessonStatus.completed,
      );
      await seed.students.setStudentArchived(vera, archived: true);

      await pumpApp(tester, db, location: '/students');

      expect(find.text('Анна'), findsOneWidget);
      expect(find.text('Борис'), findsOneWidget);
      expect(find.text('Вера'), findsNothing);
      expect(findTextIgnoringSpaces('Долг 1 500 ₽'), findsOneWidget);

      await tester.enterText(find.byType(SearchBar), 'бор');
      await tester.pumpAndSettle();
      expect(find.text('Анна'), findsNothing);
      expect(find.text('Борис'), findsOneWidget);

      await tester.enterText(find.byType(SearchBar), '');
      await tester.tap(find.widgetWithText(FilterChip, 'Должники'));
      await tester.pumpAndSettle();
      expect(find.text('Анна'), findsOneWidget);
      expect(find.text('Борис'), findsNothing);

      final physicsChip = find.widgetWithText(ChoiceChip, 'Физика');
      await tester.ensureVisible(physicsChip);
      await tester.pumpAndSettle();
      await tester.tap(physicsChip);
      await tester.pumpAndSettle();
      expect(find.text('Никого не нашли'), findsOneWidget);

      await tester.tap(find.text('Сбросить фильтры'));
      await tester.pumpAndSettle();
      expect(find.text('Анна'), findsOneWidget);
      expect(find.text('Борис'), findsOneWidget);

      await tester.tap(find.byTooltip('Архив'));
      await tester.pumpAndSettle();
      expect(find.text('Архив учеников'), findsOneWidget);
      expect(find.text('Вера'), findsOneWidget);
      expect(find.text('Анна'), findsNothing);
    });
  });

  group('форма ученика', () {
    testAppWidgets('валидация и создание с нормализацией Telegram', (
      tester,
    ) async {
      await pumpApp(tester, db, location: '/students/new');

      await tester.tap(find.widgetWithText(FilledButton, 'Добавить ученика'));
      await tester.pumpAndSettle();
      expect(find.text('Укажите имя ученика'), findsOneWidget);

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Имя и фамилия *'),
        'Анна Петрова',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Телефон'),
        '123',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Telegram'),
        'https://t.me/anna_p',
      );
      await tester.tap(find.widgetWithText(FilledButton, 'Добавить ученика'));
      await tester.pumpAndSettle();
      expect(find.text('Например, +7 900 123-45-67'), findsOneWidget);

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Телефон'),
        '+7 900 123-45-67',
      );
      await tester.tap(find.widgetWithText(FilledButton, 'Добавить ученика'));
      await tester.pumpAndSettle();

      // В FakeAsync стримы Drift не выдают значения без pump, поэтому
      // данные проверяются обычным запросом.
      final student = await db.select(db.students).getSingle();
      expect(student.telegram, '@anna_p');
      expect(currentLocation(tester), '/students/${student.id}');
      expect(find.text('Анна Петрова'), findsOneWidget);
      expect(find.text('@anna_p'), findsOneWidget);
      expect(find.text('Долгов нет'), findsOneWidget);
    });

    testAppWidgets('своя шкала оценок проверяет диапазон', (tester) async {
      await pumpApp(tester, db, location: '/students/new');

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Имя и фамилия *'),
        'Анна',
      );
      await tester.tap(find.text('Своя'));
      await tester.pumpAndSettle();
      await tester.enterText(find.widgetWithText(TextFormField, 'От'), '10');
      await tester.enterText(find.widgetWithText(TextFormField, 'До'), '3');
      await tester.tap(find.widgetWithText(FilledButton, 'Добавить ученика'));
      await tester.pumpAndSettle();
      expect(find.text('Минимум должен быть меньше максимума'), findsOneWidget);

      await tester.enterText(find.widgetWithText(TextFormField, 'До'), '20');
      await tester.tap(find.widgetWithText(FilledButton, 'Добавить ученика'));
      await tester.pumpAndSettle();

      final student = await db.select(db.students).getSingle();
      expect(student.gradeScaleMin, 10);
      expect(student.gradeScaleMax, 20);
    });

    testAppWidgets('несохранённые изменения требуют подтверждения', (
      tester,
    ) async {
      await pumpApp(tester, db, location: '/students');
      await tester.tap(find.text('Ученик'));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Имя и фамилия *'),
        'Черновик',
      );
      await tester.pump();

      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();
      expect(find.text('Выйти без сохранения?'), findsOneWidget);

      await tester.tap(find.text('Выйти'));
      await tester.pumpAndSettle();
      expect(find.text('Учеников пока нет'), findsOneWidget);
    });

    testAppWidgets('редактирование сохраняет изменения и возвращает назад', (
      tester,
    ) async {
      final id = await seed.student('Анна');
      await pumpApp(tester, db, location: '/students/$id');

      await tester.tap(find.byTooltip('Редактировать'));
      await tester.pumpAndSettle();
      expect(find.text('Редактирование'), findsOneWidget);

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Имя и фамилия *'),
        'Анна Иванова',
      );
      await tester.tap(find.widgetWithText(FilledButton, 'Сохранить'));
      await tester.pumpAndSettle();

      expect(currentLocation(tester), '/students/$id');
      expect(find.text('Анна Иванова'), findsOneWidget);
    });
  });

  group('карточка ученика', () {
    testAppWidgets('шапка и вкладки показывают данные ученика', (tester) async {
      final studentId = await seed.student('Анна');
      final enrollmentId = await seed.enrollment(
        studentId: studentId,
        subjectId: await seed.subject('Математика'),
      );
      await seed.lesson(
        enrollmentId,
        startsAt: DateTime(2026, 10, 1, 18),
        status: LessonStatus.completed,
        topic: 'Квадратные уравнения',
      );
      await seed.payment(studentId, const Money.rubles(1000));

      await pumpApp(tester, db, location: '/students/$studentId');

      expect(find.text('Математика'), findsWidgets);
      expect(findTextIgnoringSpaces('1 500 ₽ за 1 ч'), findsOneWidget);
      expect(findTextIgnoringSpaces('Долг 500 ₽'), findsOneWidget);
      expect(find.textContaining('Квадратные уравнения'), findsOneWidget);

      await tester.tap(find.text('Оплаты'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Перевод на карту'), findsOneWidget);
      expect(find.text('Занятия вне пакетов'), findsOneWidget);

      await tester.tap(find.text('Прогресс'));
      await tester.pumpAndSettle();
      expect(find.text('Оценок пока нет'), findsOneWidget);
    });

    testAppWidgets('заметка редактируется на вкладке «Заметки»', (
      tester,
    ) async {
      final studentId = await seed.student('Анна');
      await pumpApp(tester, db, location: '/students/$studentId');

      await tester.tap(find.text('Заметки'));
      await tester.pumpAndSettle();
      expect(find.text('Заметок пока нет'), findsOneWidget);

      await tester.tap(find.byTooltip('Редактировать заметку'));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.descendant(
          of: find.byType(AlertDialog),
          matching: find.byType(TextFormField),
        ),
        'Готовится к ОГЭ',
      );
      await tester.tap(find.widgetWithText(FilledButton, 'Сохранить'));
      await tester.pumpAndSettle();

      expect(find.text('Готовится к ОГЭ'), findsOneWidget);
      expect(
        (await seed.students.getStudent(studentId))?.note,
        'Готовится к ОГЭ',
      );
    });

    testAppWidgets('архивирование и удаление', (tester) async {
      final studentId = await seed.student('Анна');
      await pumpApp(tester, db, location: '/students/$studentId');

      await tester.tap(find.byTooltip('Ещё'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('В архив'));
      await tester.pumpAndSettle();
      expect(find.text('Ученик в архиве'), findsOneWidget);

      await tester.tap(find.byTooltip('Ещё'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Удалить'));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(FilledButton, 'Удалить'));
      await tester.pumpAndSettle();

      expect(currentLocation(tester), '/students');
      expect(await seed.students.getStudent(studentId), isNull);
    });

    testAppWidgets('несуществующий ученик', (tester) async {
      await pumpApp(tester, db, location: '/students/999');

      expect(find.text('Ученик не найден'), findsOneWidget);
    });
  });

  group('предмет ученика', () {
    testAppWidgets('создание нового предмета прямо из формы', (tester) async {
      final studentId = await seed.student('Анна');
      await pumpApp(tester, db, location: '/students/$studentId');

      await tester.tap(find.text('Добавить'));
      await tester.pumpAndSettle();
      expect(find.text('Новый предмет'), findsOneWidget);

      await tester.tap(find.text('Предмет *'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Новый предмет…').last);
      await tester.pumpAndSettle();
      await tester.enterText(
        find.descendant(
          of: find.byType(AlertDialog),
          matching: find.byType(TextFormField),
        ),
        'Химия',
      );
      await tester.tap(find.widgetWithText(FilledButton, 'Добавить'));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.widgetWithText(TextFormField, 'Стоимость занятия *'),
        '2000',
      );
      await tester.tap(find.widgetWithText(FilledButton, 'Добавить предмет'));
      await tester.pumpAndSettle();

      expect(currentLocation(tester), '/students/$studentId');
      expect(find.text('Химия'), findsOneWidget);
      expect(findTextIgnoringSpaces('2 000 ₽ за 1 ч'), findsOneWidget);
    });

    testAppWidgets('стоимость обязательна', (tester) async {
      final studentId = await seed.student('Анна');
      await seed.subject('Математика');
      await pumpApp(
        tester,
        db,
        location: '/students/$studentId/enrollments/new',
      );

      await tester.tap(find.widgetWithText(FilledButton, 'Добавить предмет'));
      await tester.pumpAndSettle();

      expect(find.text('Выберите предмет'), findsOneWidget);
      expect(find.text('Укажите стоимость занятия'), findsOneWidget);
    });
  });
}

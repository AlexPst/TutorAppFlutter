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

  /// Анна с одним предметом «Математика» по 1 500 ₽.
  Future<({int studentId, int enrollmentId})> anna() async {
    final studentId = await seed.student('Анна');
    final enrollmentId = await seed.enrollment(
      studentId: studentId,
      subjectId: await seed.subject('Математика'),
    );
    return (studentId: studentId, enrollmentId: enrollmentId);
  }

  Future<LessonRow> lessonRow(int id) =>
      (db.select(db.lessons)..where((t) => t.id.equals(id))).getSingle();

  group('расписание', () {
    testAppWidgets('неделя по дням, режим «День» и навигация', (tester) async {
      final (:studentId, :enrollmentId) = await anna();
      // 10:00–11:00 сегодня уже прошло (сейчас 12:00) — нужно отметить.
      await seed.lesson(enrollmentId, startsAt: DateTime(2026, 10, 13, 10));
      await seed.lesson(enrollmentId, startsAt: DateTime(2026, 10, 15, 18));
      await seed.lesson(enrollmentId, startsAt: DateTime(2026, 10, 20, 18));

      await pumpApp(tester, db, location: '/lessons');

      expect(find.text('12–18 октября'), findsOneWidget);
      expect(find.text('Сегодня, 13 октября'), findsOneWidget);
      expect(find.text('Четверг, 15 октября'), findsOneWidget);
      expect(find.text('Нужно отметить'), findsOneWidget);
      expect(find.text('Анна'), findsNWidgets(2));

      await tester.tap(find.text('День'));
      await tester.pumpAndSettle();
      expect(find.text('Анна'), findsOneWidget);

      await tester.tap(find.byTooltip('Вперёд'));
      await tester.pumpAndSettle();
      expect(find.text('Среда, 14 октября'), findsOneWidget);
      expect(find.text('Занятий нет'), findsOneWidget);
    });

    testAppWidgets('месяц: число занятий в сетке и выбор дня', (tester) async {
      final (:studentId, :enrollmentId) = await anna();
      await seed.lesson(enrollmentId, startsAt: DateTime(2026, 10, 22, 10));
      await seed.lesson(enrollmentId, startsAt: DateTime(2026, 10, 22, 18));

      await pumpApp(tester, db, location: '/lessons');
      await tester.tap(find.text('Месяц'));
      await tester.pumpAndSettle();

      expect(find.text('Октябрь 2026'), findsOneWidget);
      expect(find.text('Занятий нет'), findsOneWidget);

      await tester.tap(find.bySemanticsLabel(RegExp('22 октября')));
      await tester.pumpAndSettle();
      expect(find.text('Четверг, 22 октября'), findsOneWidget);
      expect(find.text('Анна'), findsNWidgets(2));
    });
  });

  group('быстрые действия', () {
    testAppWidgets('«Проведено»: тема и оценка, начисление в долг', (
      tester,
    ) async {
      final (:studentId, :enrollmentId) = await anna();
      final id = await seed.lesson(
        enrollmentId,
        startsAt: DateTime(2026, 10, 13, 10),
      );
      await pumpApp(tester, db, location: '/lessons');

      await tester.tap(find.widgetWithText(ActionChip, 'Проведено'));
      await tester.pumpAndSettle();
      expect(find.text('Оценка (2–5)'), findsOneWidget);

      await tester.enterText(
        find.widgetWithText(TextField, 'Тема занятия'),
        'Дроби',
      );
      await tester.tap(find.widgetWithText(ChoiceChip, '5'));
      await tester.tap(find.widgetWithText(FilledButton, 'Сохранить'));
      await tester.pumpAndSettle();

      expect(find.text('Проведено · Дроби'), findsOneWidget);
      expect(findTextIgnoringSpaces('1 500 ₽'), findsOneWidget);
      final lesson = await lessonRow(id);
      expect(lesson.status, LessonStatus.completed.name);
      final entry = await db.select(db.progressEntries).getSingle();
      expect(entry.grade, 5);
    });

    testAppWidgets('«Проведено» при пакете списывает занятие из пакета', (
      tester,
    ) async {
      final (:studentId, :enrollmentId) = await anna();
      final packageId = await seed.package(enrollmentId);
      final id = await seed.lesson(
        enrollmentId,
        startsAt: DateTime(2026, 10, 13, 10),
      );
      await pumpApp(tester, db, location: '/lessons');

      await tester.tap(find.widgetWithText(ActionChip, 'Проведено'));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(FilledButton, 'Сохранить'));
      await tester.pumpAndSettle();

      expect(find.text('Пакет'), findsOneWidget);
      expect((await lessonRow(id)).packageId, packageId);
    });

    testAppWidgets('«Отменено» спрашивает, кто отменил', (tester) async {
      final (:studentId, :enrollmentId) = await anna();
      final id = await seed.lesson(
        enrollmentId,
        startsAt: DateTime(2026, 10, 14, 18),
      );
      await pumpApp(tester, db, location: '/lessons');

      await tester.tap(find.widgetWithText(ActionChip, 'Отменено'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Отменил я'));
      await tester.pumpAndSettle();

      expect(find.text('Отменено мной'), findsOneWidget);
      expect(find.widgetWithText(ActionChip, 'Перенести'), findsNothing);
      expect((await lessonRow(id)).status, LessonStatus.cancelledByTutor.name);
    });

    testAppWidgets('«Перенести» открывает выбор даты', (tester) async {
      final (:studentId, :enrollmentId) = await anna();
      await seed.lesson(enrollmentId, startsAt: DateTime(2026, 10, 14, 18));
      await pumpApp(tester, db, location: '/lessons');

      await tester.tap(find.widgetWithText(ActionChip, 'Перенести'));
      await tester.pumpAndSettle();

      expect(find.byType(DatePickerDialog), findsOneWidget);
    });
  });

  group('форма занятия', () {
    testAppWidgets('создание: предмет и стоимость подставляются', (
      tester,
    ) async {
      await anna();
      await pumpApp(tester, db, location: '/lessons');

      await tester.tap(find.widgetWithText(FloatingActionButton, 'Занятие'));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(FilledButton, 'Создать занятие'));
      await tester.pumpAndSettle();
      expect(find.text('Выберите ученика'), findsOneWidget);

      await tester.tap(find.text('Ученик *'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Анна').last);
      await tester.pumpAndSettle();

      // Единственный предмет выбран автоматически, ставка подставлена.
      expect(findTextIgnoringSpaces('Математика · 1 500 ₽'), findsOneWidget);
      expect(find.widgetWithText(TextFormField, '1500'), findsOneWidget);

      await tester.tap(find.widgetWithText(FilledButton, 'Создать занятие'));
      await tester.pumpAndSettle();

      final lesson = await db.select(db.lessons).getSingle();
      // Сегодня, ближайший целый час после 12:00.
      expect(lesson.startsAt, DateTime(2026, 10, 13, 13));
      expect(lesson.priceKopecks, 150000);
      expect(lesson.status, LessonStatus.planned.name);
      expect(find.text('Расписание'), findsWidgets);
      expect(find.text('13:00–14:00 · Математика'), findsOneWidget);
    });

    testAppWidgets('редактирование: статус «Проведено» начисляет долг', (
      tester,
    ) async {
      final (:studentId, :enrollmentId) = await anna();
      await seed.lesson(enrollmentId, startsAt: DateTime(2026, 10, 14, 18));
      await pumpApp(tester, db, location: '/students/$studentId');

      expect(find.text('Долгов нет'), findsOneWidget);
      await tester.tap(find.text('Математика').last);
      await tester.pumpAndSettle();
      expect(find.text('Анна · Математика'), findsOneWidget);

      await tester.tap(find.text('Запланировано'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Проведено').last);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(FilledButton, 'Сохранить'));
      await tester.pumpAndSettle();

      expect(currentLocation(tester), '/students/$studentId');
      expect(findTextIgnoringSpaces('Долг 1 500 ₽'), findsOneWidget);
    });
  });

  testAppWidgets('из карточки ученика: ученик уже выбран', (tester) async {
    final (:studentId, :enrollmentId) = await anna();
    await seed.payment(studentId, const Money.rubles(500));
    await pumpApp(tester, db, location: '/students/$studentId');

    await tester.tap(find.text('Запланировать занятие'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Создать занятие'));
    await tester.pumpAndSettle();

    expect(currentLocation(tester), '/students/$studentId');
    expect(find.textContaining('Запланировано'), findsOneWidget);
    expect(await db.select(db.lessons).get(), hasLength(1));
  });
}

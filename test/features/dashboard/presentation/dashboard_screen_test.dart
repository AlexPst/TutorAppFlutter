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

  /// Ученик с предметом по 1 500 ₽; [completedLessons] проведённых
  /// занятий в начале октября создают долг.
  Future<int> enrollmentOf(String name, {int completedLessons = 0}) async {
    final studentId = await seed.student(name);
    final enrollmentId = await seed.enrollment(studentId: studentId);
    for (var day = 1; day <= completedLessons; day++) {
      await seed.lesson(
        enrollmentId,
        startsAt: DateTime(2026, 10, day, 18),
        status: LessonStatus.completed,
      );
    }
    return enrollmentId;
  }

  Finder inSection(String title, Finder finder) => find.descendant(
    of: find.ancestor(of: find.text(title), matching: find.byType(Card)),
    matching: finder,
  );

  testAppWidgets('пустое приложение: подсказки вместо данных', (tester) async {
    await pumpApp(tester, db);

    expect(find.text('Главная'), findsWidgets);
    expect(find.text('Вторник, 13 октября'), findsOneWidget);
    expect(find.text('На сегодня больше занятий нет'), findsOneWidget);
    expect(find.text('Долгов нет — все ученики рассчитались'), findsOneWidget);
    expect(find.text('Нужно отметить'), findsNothing);
    expect(
      inSection('Сводка', find.text('0')),
      findsOneWidget,
      reason: 'активных учеников',
    );
  });

  testAppWidgets('ближайшие занятия: сегодня и неделя', (tester) async {
    final anna = await enrollmentOf('Анна');
    // Сейчас 13 октября, 12:00.
    await seed.lesson(anna, startsAt: DateTime(2026, 10, 13, 18));
    await seed.lesson(anna, startsAt: DateTime(2026, 10, 15, 17));
    await seed.lesson(anna, startsAt: DateTime(2026, 10, 25, 17));
    await seed.lesson(
      anna,
      startsAt: DateTime(2026, 10, 13, 15),
      status: LessonStatus.cancelledByTutor,
    );

    await pumpApp(tester, db);

    final upcoming = inSection('Ближайшие занятия', find.text('Анна'));
    expect(upcoming, findsOneWidget);

    await tester.tap(find.text('Неделя'));
    await tester.pumpAndSettle();
    expect(inSection('Ближайшие занятия', find.text('Анна')), findsNWidgets(2));
    // Переключатель и заголовок дня.
    expect(find.text('Сегодня'), findsNWidgets(2));
    expect(find.text('Четверг, 15 октября'), findsOneWidget);
  });

  testAppWidgets('«Нужно отметить» с быстрым действием', (tester) async {
    final anna = await enrollmentOf('Анна');
    await seed.lesson(anna, startsAt: DateTime(2026, 10, 12, 18));
    await pumpApp(tester, db);

    expect(find.text('Нужно отметить'), findsOneWidget);

    await tester.tap(find.widgetWithText(ActionChip, 'Отменено'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Отменил я'));
    await tester.pumpAndSettle();

    expect(find.text('Нужно отметить'), findsNothing);
  });

  testAppWidgets('сводка и топ должников', (tester) async {
    final anna = await enrollmentOf('Анна', completedLessons: 1);
    await enrollmentOf('Борис', completedLessons: 3);
    await enrollmentOf('Вера', completedLessons: 2);
    await enrollmentOf('Глеб', completedLessons: 4);
    await seed.student('Архивный');
    final archived = (await db.select(db.students).get()).last.id;
    await seed.students.setStudentArchived(archived, archived: true);
    final annaStudent = (await seed.students.getEnrollment(anna))!.studentId;
    await seed.payment(
      annaStudent,
      const Money.rubles(1000),
      paidAt: DateTime(2026, 10, 10),
    );

    await pumpApp(tester, db);

    // 4 активных: архивный не считается.
    expect(inSection('Сводка', find.text('4')), findsOneWidget);
    expect(
      inSection('Сводка', findTextIgnoringSpaces('1 000 ₽')),
      findsOneWidget,
    );
    // Долги: 500 + 4 500 + 3 000 + 6 000.
    expect(
      inSection('Сводка', findTextIgnoringSpaces('14 000 ₽')),
      findsOneWidget,
    );

    final debtors = inSection('Должники', find.byType(ListTile));
    expect(debtors, findsNWidgets(3));
    final names = [
      for (final tile in tester.widgetList<ListTile>(debtors))
        (tile.title! as Text).data,
    ];
    expect(names, ['Глеб', 'Борис', 'Вера']);
    expect(find.text('и ещё 1 ученик'), findsOneWidget);

    await tester.ensureVisible(find.text('Все должники'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Все должники'));
    await tester.pumpAndSettle();
    expect(currentLocation(tester), '/finance?tab=debtors');
  });

  group('быстрые действия', () {
    testAppWidgets('ученик, занятие и платёж', (tester) async {
      await enrollmentOf('Анна');
      await pumpApp(tester, db);

      await tester.tap(find.widgetWithText(FilledButton, 'Занятие'));
      await tester.pumpAndSettle();
      expect(find.text('Новое занятие'), findsOneWidget);
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(FilledButton, 'Платёж'));
      await tester.pumpAndSettle();
      expect(find.text('Новый платёж'), findsOneWidget);
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(FilledButton, 'Ученик'));
      await tester.pumpAndSettle();
      expect(currentLocation(tester), '/students/new');
      expect(find.text('Новый ученик'), findsOneWidget);
    });
  });
}

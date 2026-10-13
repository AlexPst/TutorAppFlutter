import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/progress/data/repositories/drift_progress_repository.dart';

import '../../../helpers/pump_app.dart';
import '../../../helpers/seed.dart';

void main() {
  late AppDatabase db;
  late Seed seed;
  late DriftProgressRepository progress;
  late int studentId;
  late int enrollmentId;

  setUpAll(() => initializeDateFormatting());

  setUp(() async {
    db = createTestDatabase();
    seed = Seed(db);
    progress = DriftProgressRepository(db);
  });

  tearDown(() => db.close());

  /// Анна (шкала 2–5), «Математика».
  Future<void> anna() async {
    studentId = await seed.student('Анна');
    enrollmentId = await seed.enrollment(
      studentId: studentId,
      subjectId: await seed.subject('Математика'),
    );
  }

  /// Проведённое занятие [day] октября с темой и оценкой.
  Future<int> gradedLesson(int day, String topic, int? grade) async {
    final lessonId = await seed.lesson(
      enrollmentId,
      startsAt: DateTime(2026, 10, day, 18),
      status: LessonStatus.completed,
      topic: topic,
    );
    if (grade != null) {
      await progress.saveLessonResult(
        lessonId: lessonId,
        enrollmentId: enrollmentId,
        date: DateTime(2026, 10, day, 18),
        grade: grade,
      );
    }
    return lessonId;
  }

  String progressPath() => '/students/$studentId/progress/$enrollmentId';

  testAppWidgets('сводка, график, темы и хронология', (tester) async {
    await anna();
    await gradedLesson(1, 'Дроби', 3);
    await gradedLesson(3, 'Уравнения', 5);
    await gradedLesson(5, 'Дроби', 4);

    await pumpApp(tester, db, location: progressPath());

    expect(find.text('Математика'), findsOneWidget);
    expect(find.text('4 из 5'), findsOneWidget);
    // 3 → 5 → 4: последняя оценка ниже предыдущей.
    expect(find.text('Снижается'), findsOneWidget);
    expect(find.byType(LineChart), findsOneWidget);

    // Темы: сначала с более низкой последней оценкой.
    final fractions = tester.getTopLeft(find.text('Дроби')).dy;
    final equations = tester.getTopLeft(find.text('Уравнения')).dy;
    expect(fractions, lessThan(equations));
    expect(find.textContaining('2 оценки, в среднем 3,5'), findsOneWidget);

    await tester.tap(find.text('Хронология'));
    await tester.pumpAndSettle();
    expect(find.text('Дроби'), findsNWidgets(2));
  });

  testAppWidgets('пустой прогресс', (tester) async {
    await anna();
    await pumpApp(tester, db, location: progressPath());

    expect(find.text('—'), findsOneWidget);
    expect(find.text('График появится после первой оценки'), findsOneWidget);
    expect(
      find.textContaining('Темы появятся, когда вы укажете их'),
      findsOneWidget,
    );
  });

  testAppWidgets('запись вне занятия: проверка и сохранение', (tester) async {
    await anna();
    await pumpApp(tester, db, location: progressPath());

    await tester.tap(find.widgetWithText(FloatingActionButton, 'Запись'));
    await tester.pumpAndSettle();
    expect(find.text('Новая запись'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, 'Добавить запись'));
    await tester.pumpAndSettle();
    expect(find.text('Укажите тему, оценку или заметку'), findsOneWidget);

    await tester.enterText(
      find.widgetWithText(TextField, 'Тема'),
      'Контрольная',
    );
    await tester.tap(find.widgetWithText(ChoiceChip, '4'));
    await tester.tap(find.widgetWithText(FilledButton, 'Добавить запись'));
    await tester.pumpAndSettle();

    expect(currentLocation(tester), progressPath());
    expect(find.text('Контрольная'), findsOneWidget);
    final entry = await db.select(db.progressEntries).getSingle();
    expect(entry.lessonId, isNull);
    expect(entry.grade, 4);
    expect(entry.entryDate, DateTime(2026, 10, 13));
  });

  testAppWidgets('оценка за занятие из хронологии привязывает запись', (
    tester,
  ) async {
    await anna();
    final lessonId = await gradedLesson(5, 'Графики', null);
    await pumpApp(tester, db, location: progressPath());

    await tester.tap(find.text('Хронология'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Графики'));
    await tester.pumpAndSettle();

    expect(find.text('Тема сохранится и в занятии'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Графики'), findsOneWidget);
    await tester.tap(find.widgetWithText(ChoiceChip, '5'));
    await tester.tap(find.widgetWithText(FilledButton, 'Добавить запись'));
    await tester.pumpAndSettle();

    final entry = await db.select(db.progressEntries).getSingle();
    expect(entry.lessonId, lessonId);
    expect(entry.grade, 5);
    expect(find.text('5 из 5'), findsOneWidget);
  });

  testAppWidgets('пропущенное занятие: оценку поставить нельзя', (
    tester,
  ) async {
    await anna();
    await seed.lesson(
      enrollmentId,
      startsAt: DateTime(2026, 10, 6, 18),
      status: LessonStatus.noShow,
    );
    await pumpApp(tester, db, location: progressPath());

    await tester.tap(find.widgetWithText(FloatingActionButton, 'Запись'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Без привязки к занятию'));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('Пропуск').last);
    await tester.pumpAndSettle();

    expect(
      find.text('Оценка ставится только за проведённое занятие'),
      findsOneWidget,
    );
    expect(find.widgetWithText(ChoiceChip, '5'), findsNothing);
  });

  testAppWidgets('редактирование и удаление записи', (tester) async {
    await anna();
    await gradedLesson(2, 'Дроби', 3);
    await pumpApp(tester, db, location: progressPath());

    await tester.tap(find.text('Хронология'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Дроби'));
    await tester.pumpAndSettle();
    expect(find.text('Запись прогресса'), findsOneWidget);

    await tester.tap(find.byTooltip('Удалить запись'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Удалить'));
    await tester.pumpAndSettle();

    expect(await db.select(db.progressEntries).get(), isEmpty);
    // Занятие осталось в хронологии, уже без оценки.
    expect(find.text('Дроби'), findsOneWidget);
    expect(find.text('Оценок пока нет'), findsNothing);
    expect(find.text('—'), findsWidgets);
  });

  testAppWidgets('карточка ученика ведёт на экран прогресса', (tester) async {
    await anna();
    await gradedLesson(1, 'Дроби', 2);
    await gradedLesson(3, 'Уравнения', 5);
    await pumpApp(tester, db, location: '/students/$studentId');

    await tester.tap(find.text('Прогресс'));
    await tester.pumpAndSettle();
    expect(find.text('Повторить: Дроби'), findsOneWidget);

    await tester.tap(find.text('Подробнее'));
    await tester.pumpAndSettle();
    expect(currentLocation(tester), progressPath());
    expect(find.byType(LineChart), findsOneWidget);
  });
}

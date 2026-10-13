import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  /// Ученик с [lessons] проведёнными занятиями по 1 500 ₽.
  Future<int> studentWithDebt(String name, {int lessons = 1}) async {
    final studentId = await seed.student(name);
    final enrollmentId = await seed.enrollment(studentId: studentId);
    for (var day = 1; day <= lessons; day++) {
      await seed.lesson(
        enrollmentId,
        startsAt: DateTime(2026, 10, day, 18),
        status: LessonStatus.completed,
      );
    }
    return studentId;
  }

  group('платежи', () {
    testAppWidgets('фильтр по периоду и ученику', (tester) async {
      final anna = await seed.student('Анна');
      final boris = await seed.student('Борис');
      await seed.payment(
        anna,
        const Money.rubles(1000),
        paidAt: DateTime(2026, 10, 10),
      );
      await seed.payment(
        boris,
        const Money.rubles(2000),
        paidAt: DateTime(2026, 10, 5),
      );
      await seed.payment(
        anna,
        const Money.rubles(500),
        paidAt: DateTime(2026, 9, 30),
      );

      await pumpApp(tester, db, location: '/finance');

      expect(find.text('Октябрь 2026'), findsOneWidget);
      expect(
        findTextIgnoringSpaces('Итого 3 000 ₽ · 2 платежа'),
        findsOneWidget,
      );

      await tester.tap(find.text('Всё'));
      await tester.pumpAndSettle();
      expect(
        findTextIgnoringSpaces('Итого 3 500 ₽ · 3 платежа'),
        findsOneWidget,
      );

      await tester.tap(find.widgetWithText(InputChip, 'Все ученики'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Анна').last);
      await tester.pumpAndSettle();
      expect(
        findTextIgnoringSpaces('Итого 1 500 ₽ · 2 платежа'),
        findsOneWidget,
      );
      expect(find.text('Борис'), findsNothing);

      await tester.tap(find.byTooltip('Все ученики'));
      await tester.pumpAndSettle();
      expect(find.text('Борис'), findsOneWidget);
    });

    testAppWidgets('добавление платежа с подсказкой о долге', (tester) async {
      final anna = await studentWithDebt('Анна');
      await pumpApp(tester, db, location: '/finance');

      await tester.tap(find.widgetWithText(FloatingActionButton, 'Платёж'));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(FilledButton, 'Добавить платёж'));
      await tester.pumpAndSettle();
      expect(find.text('Выберите ученика'), findsOneWidget);
      expect(find.text('Укажите сумму'), findsOneWidget);

      await tester.tap(find.text('Ученик *'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Анна').last);
      await tester.pumpAndSettle();
      expect(findTextIgnoringSpaces('Долг 1 500 ₽'), findsOneWidget);

      await tester.tap(find.text('Вся сумма долга'));
      await tester.tap(find.text('Наличные'));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(FilledButton, 'Добавить платёж'));
      await tester.pumpAndSettle();

      final payment = await db.select(db.payments).getSingle();
      expect(payment.studentId, anna);
      expect(payment.amountKopecks, 150000);
      expect(payment.method, 'cash');
      expect(payment.paidAt, DateTime(2026, 10, 13));
      expect(find.textContaining('Наличные'), findsOneWidget);
    });
  });

  group('должники', () {
    testAppWidgets('сводка, порядок по долгу и «Напомнить»', (tester) async {
      String? copied;
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        (call) async {
          if (call.method == 'Clipboard.setData') {
            copied =
                (call.arguments as Map<Object?, Object?>)['text'] as String?;
          }
          return null;
        },
      );
      addTearDown(
        () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          SystemChannels.platform,
          null,
        ),
      );
      await studentWithDebt('Анна');
      await studentWithDebt('Борис', lessons: 2);
      await seed.student('Без долга');

      await pumpApp(tester, db, location: '/finance?tab=debtors');

      expect(findTextIgnoringSpaces('4 500 ₽'), findsOneWidget);
      expect(find.text('2 ученика'), findsOneWidget);
      expect(find.text('Без долга'), findsNothing);
      final borisTop = tester.getTopLeft(find.text('Борис')).dy;
      final annaTop = tester.getTopLeft(find.text('Анна')).dy;
      expect(borisTop, lessThan(annaTop));

      await tester.tap(find.text('Напомнить').first);
      await tester.pumpAndSettle();
      expect(find.text('Напоминание об оплате'), findsOneWidget);

      await tester.tap(find.text('Скопировать'));
      await tester.pumpAndSettle();
      expect(copied, startsWith('Здравствуйте, Борис!'));
      expect(copied?.replaceAll(' ', ' '), contains('к оплате 3 000 ₽'));
      expect(
        find.text('Текст скопирован — вставьте его в мессенджер'),
        findsOneWidget,
      );
    });

    testAppWidgets('«Внести оплату» погашает долг', (tester) async {
      await studentWithDebt('Анна');
      await pumpApp(tester, db, location: '/finance?tab=debtors');

      await tester.tap(find.text('Внести оплату'));
      await tester.pumpAndSettle();
      expect(find.widgetWithText(TextFormField, '1500'), findsOneWidget);

      await tester.tap(find.widgetWithText(FilledButton, 'Добавить платёж'));
      await tester.pumpAndSettle();

      expect(find.text('Должников нет'), findsOneWidget);
    });
  });

  testAppWidgets('доходы за месяц', (tester) async {
    final anna = await studentWithDebt('Анна', lessons: 2);
    await seed.payment(
      anna,
      const Money.rubles(2000),
      paidAt: DateTime(2026, 10, 12),
    );
    await pumpApp(tester, db, location: '/finance?tab=income');

    expect(find.text('Октябрь 2026'), findsOneWidget);
    expect(findTextIgnoringSpaces('2 000 ₽'), findsWidgets);
    expect(findTextIgnoringSpaces('3 000 ₽'), findsOneWidget);
    expect(find.text('Проведено 2 занятия · 2 ч'), findsOneWidget);

    await tester.tap(find.byTooltip('Назад'));
    await tester.pumpAndSettle();
    expect(find.text('Сентябрь 2026'), findsOneWidget);
    expect(find.text('За этот период нет оплат и начислений'), findsOneWidget);
  });

  testAppWidgets('карточка ученика: платёж, напоминание, удаление платежа', (
    tester,
  ) async {
    final anna = await studentWithDebt('Анна');
    await seed.payment(
      anna,
      const Money.rubles(1000),
      paidAt: DateTime(2026, 10, 10),
    );
    await pumpApp(tester, db, location: '/students/$anna');

    expect(findTextIgnoringSpaces('Долг 500 ₽'), findsOneWidget);
    expect(find.text('Напомнить'), findsOneWidget);

    await tester.tap(find.text('Оплаты'));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('Перевод на карту'));
    await tester.pumpAndSettle();
    expect(find.text('Платёж'), findsOneWidget);

    await tester.tap(find.byTooltip('Удалить платёж'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Удалить'));
    await tester.pumpAndSettle();

    expect(currentLocation(tester), '/students/$anna');
    // В шапке и в разбивке баланса на вкладке «Оплаты».
    expect(findTextIgnoringSpaces('Долг 1 500 ₽'), findsWidgets);
  });

  testAppWidgets('форма открывается, когда построены несколько вкладок', (
    tester,
  ) async {
    // Регрессия: FAB с одинаковым hero-тегом на вкладках оболочки.
    await seed.student('Анна');
    // Старт с вкладки, у которой тоже есть FAB.
    await pumpApp(tester, db, location: '/lessons');
    await tester.tap(find.text('Финансы'));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(FloatingActionButton, 'Платёж'));
    await tester.pumpAndSettle();

    expect(find.text('Новый платёж'), findsOneWidget);
  });
}

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/providers/clock_provider.dart';
import 'package:tutor_app/core/widgets/period_switcher.dart';
import 'package:tutor_app/features/lessons/presentation/providers/lessons_calendar_providers.dart';
import 'package:tutor_app/l10n/l10n.dart';

void main() {
  setUpAll(() => initializeDateFormatting());
  setUp(() => Intl.defaultLocale = 'ru');
  tearDown(() => Intl.defaultLocale = null);

  /// Заголовок периода, как его показывает `PeriodSwitcher`.
  String title(LessonsCalendarState state) => state.mode.titleFor(
    state.selectedDay,
    lookupAppLocalizations(const Locale('ru')),
  );

  late ProviderContainer container;
  LessonsCalendarController controller() =>
      container.read(lessonsCalendarControllerProvider.notifier);
  LessonsCalendarState state() =>
      container.read(lessonsCalendarControllerProvider);

  setUp(() {
    container = ProviderContainer.test(
      overrides: [
        clockProvider.overrideWithValue(() => DateTime(2026, 1, 31, 15, 30)),
      ],
    );
    // Держит autoDispose-провайдер живым между вызовами.
    container.listen(lessonsCalendarControllerProvider, (_, _) {});
  });

  test('по умолчанию — неделя с сегодняшним днём', () {
    expect(state().mode, PeriodKind.week);
    expect(state().selectedDay, DateTime(2026, 1, 31));
    expect(state().period, DatePeriod.week(DateTime(2026, 1, 31)));
    expect(title(state()), '26 января – 1 февраля');
  });

  test('шаг зависит от режима', () {
    controller().next();
    expect(state().selectedDay, DateTime(2026, 2, 7));

    controller()
      ..setMode(PeriodKind.day)
      ..previous();
    expect(state().selectedDay, DateTime(2026, 2, 6));
    expect(title(state()), 'Пятница, 6 февраля');
  });

  test('месяц: 31 января + 1 месяц = 28 февраля', () {
    controller()
      ..setMode(PeriodKind.month)
      ..next();
    expect(state().selectedDay, DateTime(2026, 2, 28));
    expect(title(state()), 'Февраль 2026');
    expect(state().period, DatePeriod.month(DateTime(2026, 2)));
  });

  test('«Сегодня» и открытие дня', () {
    controller()
      ..setMode(PeriodKind.month)
      ..next()
      ..showToday();
    expect(state().selectedDay, DateTime(2026, 1, 31));

    controller().openDay(DateTime(2026, 1, 28, 18));
    expect(state().mode, PeriodKind.day);
    expect(state().selectedDay, DateTime(2026, 1, 28));
  });
}

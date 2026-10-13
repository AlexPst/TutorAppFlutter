import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/core/utils/formatters.dart';

/// Убирает неразрывные пробелы, которые ставят локали в суммах и датах.
String _plain(String text) => text.replaceAll(RegExp(r'[  ]'), ' ');

void main() {
  setUpAll(() => initializeDateFormatting());
  tearDown(() => Intl.defaultLocale = null);

  final now = DateTime(2026, 10, 13);

  test('Money.tryParse понимает разные варианты ввода', () {
    expect(Money.tryParse('1500'), const Money.rubles(1500));
    expect(Money.tryParse('1 500'), const Money.rubles(1500));
    expect(Money.tryParse('1500,5'), const Money(150050));
    expect(Money.tryParse('1500.05 ₽'), const Money(150005));
    expect(Money.tryParse('0'), Money.zero);
    expect(Money.tryParse(''), isNull);
    expect(Money.tryParse('-100'), isNull);
    expect(Money.tryParse('10,123'), isNull);
    expect(Money.tryParse('abc'), isNull);
  });

  group('русская локаль', () {
    setUp(() => Intl.defaultLocale = 'ru');

    test('рубли, копейки только при необходимости', () {
      expect(_plain(Formatters.money(const Money.rubles(1500))), '1 500 ₽');
      expect(_plain(Formatters.money(const Money(150050))), '1 500,50 ₽');
      expect(Formatters.moneyInput(const Money(150050)), '1500,50');
    });

    test('даты и время', () {
      expect(Formatters.date(DateTime(2026, 10, 13), now: now), '13 октября');
      expect(
        _plain(Formatters.date(DateTime(2025, 3, 1), now: now)),
        startsWith('1 марта 2025'),
      );
      expect(
        Formatters.lessonDateTime(DateTime(2026, 10, 13, 18), now: now),
        'вт, 13 октября, 18:00',
      );
      expect(
        Formatters.dayHeader(DateTime(2026, 10, 13)),
        'Вторник, 13 октября',
      );
      expect(Formatters.monthTitle(DateTime(2026, 10)), 'Октябрь 2026');
      expect(Formatters.decimal(4.25), '4,3');
    });
  });

  group('английская локаль', () {
    setUp(() => Intl.defaultLocale = 'en');

    test('рубли по правилам английской локали', () {
      expect(Formatters.money(const Money.rubles(1500)), '₽1,500');
      expect(Formatters.money(const Money(150050)), '₽1,500.50');
      expect(Formatters.moneyInput(const Money(150050)), '1500.50');
      // Ввод в английском формате тоже разбирается.
      expect(
        Money.tryParse(Formatters.moneyInput(const Money(150050))),
        const Money(150050),
      );
    });

    test('даты и 12-часовое время', () {
      expect(Formatters.date(DateTime(2026, 10, 13), now: now), 'October 13');
      expect(
        _plain(Formatters.lessonDateTime(DateTime(2026, 10, 13, 18), now: now)),
        'Tue, October 13, 6:00 PM',
      );
      expect(
        Formatters.dayHeader(DateTime(2026, 10, 13)),
        'Tuesday, October 13',
      );
      expect(Formatters.monthTitle(DateTime(2026, 10)), 'October 2026');
      expect(Formatters.decimal(4.25), '4.3');
    });
  });
}

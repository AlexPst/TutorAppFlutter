import 'package:intl/intl.dart';
import 'package:tutor_app/core/domain/money.dart';

/// Форматирование дат, времени и сумм по текущей локали
/// (`Intl.defaultLocale`, её выставляет приложение при выборе языка).
/// Данные локалей загружаются `initializeDateFormatting()` в `bootstrap`.
///
/// Тексты с переводом (длительность, склонения) — в `AppLocalizations`.
abstract final class Formatters {
  static final _cache = <String, Object>{};

  static String get _locale => Intl.getCurrentLocale();

  /// Форматтеры дорогие в создании: кешируются на пару «локаль + вид».
  static T _cached<T extends Object>(String kind, T Function(String) create) =>
      _cache.putIfAbsent('$_locale/$kind', () => create(_locale)) as T;

  /// Рубли по правилам локали: `1 500 ₽`, `1 500,50 ₽` / `₽1,500`.
  static String money(Money money) {
    final withKopecks = money.kopecks % 100 != 0;
    final format = _cached(
      withKopecks ? 'money2' : 'money0',
      (locale) => NumberFormat.currency(
        locale: locale,
        symbol: '₽',
        decimalDigits: withKopecks ? 2 : 0,
      ),
    );
    return format.format(money.kopecks / 100);
  }

  /// Сумма для поля ввода без разделителей тысяч и символа валюты:
  /// `1500`, `1500,50` / `1500.50` — `Money.tryParse` разбирает её обратно.
  static String moneyInput(Money money) {
    final rubles = money.kopecks ~/ 100;
    final kopecks = money.kopecks % 100;
    if (kopecks == 0) return '$rubles';
    final separator = _cached(
      'decimalSeparator',
      (locale) => NumberFormat.decimalPattern(locale).symbols.DECIMAL_SEP,
    );
    return '$rubles$separator${kopecks.toString().padLeft(2, '0')}';
  }

  /// Число с одним знаком после запятой: `4,3` / `4.3`.
  static String decimal(double value) => _cached(
    'decimal1',
    (locale) => NumberFormat('0.#', locale),
  ).format(value);

  /// `13 октября` / `October 13`; год добавляется, если он не текущий.
  static String date(DateTime date, {DateTime? now}) {
    final sameYear = date.year == (now ?? DateTime.now()).year;
    return sameYear
        ? _cached('MMMMd', DateFormat.MMMMd).format(date)
        : _cached('yMMMMd', DateFormat.yMMMMd).format(date);
  }

  /// `вт, 13 октября, 18:00` / `Tue, October 13, 6:00 PM`.
  static String lessonDateTime(DateTime dateTime, {DateTime? now}) =>
      '${_cached('E', DateFormat.E).format(dateTime)}, '
      '${date(dateTime, now: now)}, ${time(dateTime)}';

  /// `18:00` / `6:00 PM`.
  static String time(DateTime dateTime) =>
      _cached('jm', DateFormat.jm).format(dateTime);

  /// `18:00–19:30`.
  static String timeRange(DateTime start, DateTime end) =>
      '${time(start)}–${time(end)}';

  /// `Вторник, 13 октября` / `Tuesday, October 13`.
  static String dayHeader(DateTime date) =>
      capitalize(_cached('MMMMEEEEd', DateFormat.MMMMEEEEd).format(date));

  /// `Октябрь 2026` / `October 2026`.
  static String monthTitle(DateTime date) => capitalize(
    _cached('LLLLy', (locale) => DateFormat('LLLL y', locale)).format(date),
  );

  /// `Пн` / `Mon`.
  static String shortWeekday(DateTime date) =>
      capitalize(_cached('E', DateFormat.E).format(date));

  /// `13.10` / `10/13` — для подписей осей графиков.
  static String shortDate(DateTime date) =>
      _cached('Md', DateFormat.Md).format(date);

  static String capitalize(String text) =>
      text.isEmpty ? text : text[0].toUpperCase() + text.substring(1);
}

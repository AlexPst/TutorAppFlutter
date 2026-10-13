import 'package:json_annotation/json_annotation.dart';

/// Денежная сумма в рублях. Хранится в копейках, чтобы избежать ошибок
/// округления чисел с плавающей точкой.
final class Money implements Comparable<Money> {
  const Money(this.kopecks);

  const Money.rubles(int rubles) : kopecks = rubles * 100;

  static const zero = Money(0);

  static final _inputSeparators = RegExp(r'[\s\u00A0₽]');
  static final _inputPattern = RegExp(r'^(\d{1,9})(?:\.(\d{1,2}))?$');

  /// Разбирает пользовательский ввод: `1500`, `1 500`, `1500,5`, `1500.50 ₽`.
  /// Возвращает `null`, если строка не является неотрицательной суммой.
  static Money? tryParse(String input) {
    final normalized = input
        .replaceAll(_inputSeparators, '')
        .replaceAll(',', '.');
    final match = _inputPattern.firstMatch(normalized);
    if (match == null) return null;
    final rubles = int.parse(match.group(1)!);
    final kopecks = int.parse((match.group(2) ?? '').padRight(2, '0'));
    return Money(rubles * 100 + kopecks);
  }

  final int kopecks;

  bool get isZero => kopecks == 0;

  bool get isNegative => kopecks < 0;

  bool get isPositive => kopecks > 0;

  Money abs() => Money(kopecks.abs());

  Money operator +(Money other) => Money(kopecks + other.kopecks);

  Money operator -(Money other) => Money(kopecks - other.kopecks);

  Money operator -() => Money(-kopecks);

  Money operator *(int factor) => Money(kopecks * factor);

  bool operator <(Money other) => kopecks < other.kopecks;

  bool operator <=(Money other) => kopecks <= other.kopecks;

  bool operator >(Money other) => kopecks > other.kopecks;

  bool operator >=(Money other) => kopecks >= other.kopecks;

  @override
  int compareTo(Money other) => kopecks.compareTo(other.kopecks);

  @override
  bool operator ==(Object other) => other is Money && other.kopecks == kopecks;

  @override
  int get hashCode => kopecks.hashCode;

  @override
  String toString() => 'Money($kopecks kopecks)';
}

/// Сериализует [Money] в JSON как целое число копеек.
class MoneyConverter implements JsonConverter<Money, int> {
  const MoneyConverter();

  @override
  Money fromJson(int json) => Money(json);

  @override
  int toJson(Money object) => object.kopecks;
}

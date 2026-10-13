import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_app/core/domain/date_period.dart';

void main() {
  test('день: полуоткрытый интервал', () {
    final day = DatePeriod.day(DateTime(2026, 10, 13, 18, 30));

    expect(day.start, DateTime(2026, 10, 13));
    expect(day.end, DateTime(2026, 10, 14));
    expect(day.contains(DateTime(2026, 10, 13)), isTrue);
    expect(day.contains(DateTime(2026, 10, 14)), isFalse);
  });

  test('неделя начинается с понедельника, в том числе от воскресенья', () {
    final week = DatePeriod.week(DateTime(2026, 10, 18));

    expect(week.start, DateTime(2026, 10, 12));
    expect(week.end, DateTime(2026, 10, 19));
  });

  test('месяц переходит через год', () {
    final month = DatePeriod.month(DateTime(2026, 12, 31));

    expect(month.start, DateTime(2026, 12));
    expect(month.end, DateTime(2027));
  });

  test('PeriodKind: период вокруг даты и сдвиг', () {
    final date = DateTime(2026, 1, 31);

    expect(PeriodKind.week.around(date), DatePeriod.week(date));
    expect(PeriodKind.day.shift(date, 1), DateTime(2026, 2, 1));
    expect(PeriodKind.week.shift(date, -1), DateTime(2026, 1, 24));
    expect(PeriodKind.month.shift(date, 1), DateTime(2026, 2, 28));
    expect(
      PeriodKind.month.shift(DateTime(2024, 1, 31), 1),
      DateTime(2024, 2, 29),
    );
    expect(PeriodKind.month.shift(date, -2), DateTime(2025, 11, 30));
  });
}

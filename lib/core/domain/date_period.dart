/// Полуоткрытый интервал `[start, end)` в локальном времени.
final class DatePeriod {
  DatePeriod(this.start, this.end)
    : assert(start.isBefore(end), 'Period start must be before its end');

  /// Сутки, содержащие [date].
  factory DatePeriod.day(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    return DatePeriod(start, DateTime(date.year, date.month, date.day + 1));
  }

  /// Неделя с понедельника, содержащая [date].
  factory DatePeriod.week(DateTime date) {
    final monday = date.day - (date.weekday - DateTime.monday);
    return DatePeriod(
      DateTime(date.year, date.month, monday),
      DateTime(date.year, date.month, monday + 7),
    );
  }

  /// Календарный месяц, содержащий [date].
  factory DatePeriod.month(DateTime date) => DatePeriod(
    DateTime(date.year, date.month),
    DateTime(date.year, date.month + 1),
  );

  final DateTime start;
  final DateTime end;

  bool contains(DateTime moment) =>
      !moment.isBefore(start) && moment.isBefore(end);

  @override
  bool operator ==(Object other) =>
      other is DatePeriod && other.start == start && other.end == end;

  @override
  int get hashCode => Object.hash(start, end);

  @override
  String toString() => 'DatePeriod($start — $end)';
}

/// Длина периода для отчётов и календаря.
enum PeriodKind {
  day,
  week,
  month;

  /// Период этого вида, содержащий [date].
  DatePeriod around(DateTime date) => switch (this) {
    PeriodKind.day => DatePeriod.day(date),
    PeriodKind.week => DatePeriod.week(date),
    PeriodKind.month => DatePeriod.month(date),
  };

  /// Сдвигает [date] на [steps] периодов. При сдвиге на месяц день
  /// не выходит за конец месяца: 31 января + 1 месяц → 28 (29) февраля.
  DateTime shift(DateTime date, int steps) => switch (this) {
    PeriodKind.day => DateTime(date.year, date.month, date.day + steps),
    PeriodKind.week => DateTime(date.year, date.month, date.day + 7 * steps),
    PeriodKind.month => _addMonths(date, steps),
  };

  static DateTime _addMonths(DateTime date, int months) {
    final firstOfTarget = DateTime(date.year, date.month + months);
    final daysInTarget = DateTime(
      firstOfTarget.year,
      firstOfTarget.month + 1,
      0,
    ).day;
    return DateTime(
      firstOfTarget.year,
      firstOfTarget.month,
      date.day < daysInTarget ? date.day : daysInTarget,
    );
  }
}

/// Полночь дня, содержащего [moment].
DateTime dateOnly(DateTime moment) =>
    DateTime(moment.year, moment.month, moment.day);

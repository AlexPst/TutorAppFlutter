import 'package:tutor_app/core/domain/date_period.dart';

/// Горизонт «ближайших занятий» на главном экране.
enum UpcomingRange {
  /// С текущей минуты до конца дня.
  today,

  /// Семь суток с текущей минуты — а не до воскресенья, чтобы в конце
  /// недели список не пустел.
  week;

  /// Период поиска запланированных занятий относительно [now].
  /// Уже идущее занятие сюда не попадает — оно в блоке «Нужно отметить»
  /// после окончания.
  DatePeriod periodFrom(DateTime now) {
    final start = DateTime(now.year, now.month, now.day, now.hour, now.minute);
    return switch (this) {
      UpcomingRange.today => DatePeriod(
        start,
        DateTime(now.year, now.month, now.day + 1),
      ),
      UpcomingRange.week => DatePeriod(
        start,
        DateTime(now.year, now.month, now.day + 7, now.hour, now.minute),
      ),
    };
  }
}

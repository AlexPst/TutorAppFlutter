import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/features/dashboard/domain/models/upcoming_range.dart';

void main() {
  final now = DateTime(2026, 10, 18, 21, 30, 45);

  test('сегодня — с текущей минуты до конца дня', () {
    expect(
      UpcomingRange.today.periodFrom(now),
      DatePeriod(DateTime(2026, 10, 18, 21, 30), DateTime(2026, 10, 19)),
    );
  });

  test('неделя — семь суток вперёд, даже в воскресенье вечером', () {
    expect(
      UpcomingRange.week.periodFrom(now),
      DatePeriod(
        DateTime(2026, 10, 18, 21, 30),
        DateTime(2026, 10, 25, 21, 30),
      ),
    );
  });

  test('в последнюю минуту дня период не вырождается', () {
    final period = UpcomingRange.today.periodFrom(
      DateTime(2026, 10, 18, 23, 59),
    );
    expect(period.start.isBefore(period.end), isTrue);
  });
}

import 'package:flutter/material.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Сетка месяца с понедельника. Под числом — количество занятий в этот
/// день. Дни соседних месяцев показаны бледно и тоже кликабельны.
class MonthGrid extends StatelessWidget {
  const MonthGrid({
    super.key,
    required this.month,
    required this.selectedDay,
    required this.today,
    required this.lessonCounts,
    required this.onDaySelected,
  });

  /// Любой день показываемого месяца.
  final DateTime month;
  final DateTime selectedDay;
  final DateTime today;

  /// Число занятий по дням (ключ — полночь дня).
  final Map<DateTime, int> lessonCounts;
  final ValueChanged<DateTime> onDaySelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final firstOfMonth = DateTime(month.year, month.month);
    final gridStart = DatePeriod.week(firstOfMonth).start;
    final lastOfMonth = DateTime(month.year, month.month + 1, 0);
    final gridEnd = DatePeriod.week(lastOfMonth).end;
    final days = [
      for (
        var day = gridStart;
        day.isBefore(gridEnd);
        day = DateTime(day.year, day.month, day.day + 1)
      )
        day,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Row(
            children: [
              for (final day in days.take(7))
                Expanded(
                  child: Center(
                    child: Text(
                      Formatters.shortWeekday(day),
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          for (var week = 0; week < days.length ~/ 7; week++)
            Row(
              children: [
                for (final day in days.skip(week * 7).take(7))
                  Expanded(
                    child: _DayCell(
                      day: day,
                      inMonth: day.month == month.month,
                      isToday: day == today,
                      isSelected: day == selectedDay,
                      lessons: lessonCounts[day] ?? 0,
                      onTap: () => onDaySelected(day),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class _DayCell extends StatelessWidget {
  const _DayCell({
    required this.day,
    required this.inMonth,
    required this.isToday,
    required this.isSelected,
    required this.lessons,
    required this.onTap,
  });

  final DateTime day;
  final bool inMonth;
  final bool isToday;
  final bool isSelected;
  final int lessons;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final foreground = isSelected
        ? colorScheme.onPrimary
        : inMonth
        ? colorScheme.onSurface
        : colorScheme.outline;

    return Semantics(
      button: true,
      selected: isSelected,
      label: context.l10n.monthDaySemantics(Formatters.dayHeader(day), lessons),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          height: 52,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: isSelected ? colorScheme.primary : null,
            borderRadius: BorderRadius.circular(12),
            border: isToday && !isSelected
                ? Border.all(color: colorScheme.primary)
                : null,
          ),
          child: ExcludeSemantics(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${day.day}',
                  style: textTheme.bodyMedium?.copyWith(
                    color: foreground,
                    fontWeight: isToday ? FontWeight.bold : null,
                  ),
                ),
                const SizedBox(height: 2),
                SizedBox(
                  height: 14,
                  child: lessons == 0
                      ? null
                      : Text(
                          '$lessons',
                          style: textTheme.labelSmall?.copyWith(
                            color: isSelected
                                ? colorScheme.onPrimary
                                : colorScheme.primary,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

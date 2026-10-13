import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/providers/clock_provider.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/core/widgets/async_value_view.dart';
import 'package:tutor_app/core/widgets/content_width.dart';
import 'package:tutor_app/core/widgets/empty_state.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_details.dart';
import 'package:tutor_app/features/lessons/presentation/providers/lessons_calendar_providers.dart';
import 'package:tutor_app/features/lessons/presentation/widgets/calendar_header.dart';
import 'package:tutor_app/features/lessons/presentation/widgets/lesson_tile.dart';
import 'package:tutor_app/features/lessons/presentation/widgets/month_grid.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Расписание: занятия за день, неделю или месяц.
class LessonsScreen extends ConsumerWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(lessonsCalendarControllerProvider);
    final lessons = ref.watch(lessonsInPeriodProvider(state.period));

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.navSchedule)),
      floatingActionButton: FloatingActionButton.extended(
        // Экраны вкладок живут в одном поддереве оболочки — теги кнопок
        // должны различаться, иначе конфликт Hero при открытии формы.
        heroTag: 'lessons-fab',
        onPressed: () =>
            context.push(AppRoutes.newLesson(date: state.selectedDay)),
        icon: const Icon(Icons.add),
        label: Text(context.l10n.lessonsFab),
      ),
      body: ContentWidth(
        child: Column(
          children: [
            const CalendarHeader(),
            Expanded(
              child: AsyncValueView(
                value: lessons,
                onRetry: () =>
                    ref.invalidate(lessonsInPeriodProvider(state.period)),
                data: (lessons) => switch (state.mode) {
                  PeriodKind.day => _DayView(
                    day: state.selectedDay,
                    lessons: lessons,
                  ),
                  PeriodKind.week => _WeekView(lessons: lessons),
                  PeriodKind.month => _MonthView(
                    state: state,
                    lessons: lessons,
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Отступ снизу, чтобы кнопка «Занятие» не перекрывала последнюю строку.
const _listPadding = EdgeInsets.only(bottom: 88);

class _DayView extends StatelessWidget {
  const _DayView({required this.day, required this.lessons});

  final DateTime day;
  final List<LessonDetails> lessons;

  @override
  Widget build(BuildContext context) {
    if (lessons.isEmpty) {
      return _NoLessons(day: day, title: context.l10n.noLessons);
    }
    return ListView(
      padding: _listPadding,
      children: [for (final details in lessons) _tile(details)],
    );
  }
}

class _WeekView extends ConsumerWidget {
  const _WeekView({required this.lessons});

  final List<LessonDetails> lessons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (lessons.isEmpty) {
      return _NoLessons(title: context.l10n.noLessonsThisWeek);
    }
    final byDay = _groupByDay(lessons);
    final today = dateOnly(ref.watch(clockProvider)());
    return ListView(
      padding: _listPadding,
      children: [
        for (final MapEntry(key: day, value: dayLessons) in byDay.entries) ...[
          _DayHeader(
            day: day,
            isToday: day == today,
            onTap: () => ref
                .read(lessonsCalendarControllerProvider.notifier)
                .openDay(day),
          ),
          for (final details in dayLessons) _tile(details),
        ],
      ],
    );
  }
}

class _MonthView extends ConsumerWidget {
  const _MonthView({required this.state, required this.lessons});

  final LessonsCalendarState state;
  final List<LessonDetails> lessons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final byDay = _groupByDay(lessons);
    final dayLessons = byDay[state.selectedDay] ?? const [];
    return ListView(
      padding: _listPadding,
      children: [
        MonthGrid(
          month: state.selectedDay,
          selectedDay: state.selectedDay,
          today: dateOnly(ref.watch(clockProvider)()),
          lessonCounts: {
            for (final MapEntry(:key, :value) in byDay.entries)
              key: value.length,
          },
          onDaySelected: ref
              .read(lessonsCalendarControllerProvider.notifier)
              .selectDay,
        ),
        const Divider(height: 24),
        _DayHeader(day: state.selectedDay),
        if (dayLessons.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(context.l10n.noLessons),
          )
        else
          for (final details in dayLessons) _tile(details),
      ],
    );
  }
}

Widget _tile(LessonDetails details) =>
    LessonTile(key: ValueKey(details.lesson.id), details: details);

/// Занятия по дням в хронологическом порядке (входной список уже
/// отсортирован по времени начала).
Map<DateTime, List<LessonDetails>> _groupByDay(List<LessonDetails> lessons) {
  final byDay = <DateTime, List<LessonDetails>>{};
  for (final details in lessons) {
    byDay.putIfAbsent(dateOnly(details.lesson.startsAt), () => []).add(details);
  }
  return byDay;
}

class _DayHeader extends StatelessWidget {
  const _DayHeader({required this.day, this.isToday = false, this.onTap});

  final DateTime day;
  final bool isToday;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
        child: Text(
          isToday
              ? context.l10n.todayWithDate(Formatters.date(day))
              : Formatters.dayHeader(day),
          style: theme.textTheme.titleSmall?.copyWith(
            color: isToday ? theme.colorScheme.primary : null,
          ),
        ),
      ),
    );
  }
}

class _NoLessons extends StatelessWidget {
  const _NoLessons({required this.title, this.day});

  final String title;
  final DateTime? day;

  @override
  Widget build(BuildContext context) => EmptyState(
    icon: Icons.event_available_outlined,
    title: title,
    message: context.l10n.noLessonsMessage,
    actionLabel: context.l10n.planLesson,
    onAction: () => context.push(AppRoutes.newLesson(date: day)),
  );
}

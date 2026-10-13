import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/providers/clock_provider.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/features/dashboard/domain/models/upcoming_range.dart';
import 'package:tutor_app/features/dashboard/presentation/providers/dashboard_screen_providers.dart';
import 'package:tutor_app/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_details.dart';
import 'package:tutor_app/features/lessons/presentation/widgets/lesson_tile.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Ближайшие запланированные занятия на сегодня или на неделю.
class UpcomingLessonsCard extends ConsumerWidget {
  const UpcomingLessonsCard({super.key});

  static const _maxVisible = 5;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final range = ref.watch(upcomingRangeControllerProvider);
    return DashboardSection(
      title: context.l10n.upcomingTitle,
      trailing: SegmentedButton<UpcomingRange>(
        showSelectedIcon: false,
        style: const ButtonStyle(visualDensity: VisualDensity.compact),
        segments: [
          for (final option in UpcomingRange.values)
            ButtonSegment(
              value: option,
              label: Text(switch (option) {
                UpcomingRange.today => context.l10n.commonToday,
                UpcomingRange.week => context.l10n.periodWeek,
              }),
            ),
        ],
        selected: {range},
        onSelectionChanged: (selection) => ref
            .read(upcomingRangeControllerProvider.notifier)
            .set(selection.single),
      ),
      actionLabel: context.l10n.navSchedule,
      onAction: () => context.go(AppRoutes.lessons),
      child: SectionAsync(
        value: ref.watch(upcomingLessonsProvider),
        data: (lessons) => lessons.isEmpty
            ? _Empty(range: range)
            : _List(
                lessons: lessons,
                range: range,
                maxVisible: _maxVisible,
                today: dateOnly(ref.watch(clockProvider)()),
              ),
      ),
    );
  }
}

class _List extends StatelessWidget {
  const _List({
    required this.lessons,
    required this.range,
    required this.maxVisible,
    required this.today,
  });

  final List<LessonDetails> lessons;
  final UpcomingRange range;
  final int maxVisible;
  final DateTime today;

  @override
  Widget build(BuildContext context) {
    final visible = lessons.take(maxVisible).toList();
    final hidden = lessons.length - visible.length;
    DateTime? previousDay;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final details in visible) ...[
          // На неделю — заголовок перед первым занятием каждого дня.
          if (range == UpcomingRange.week &&
              dateOnly(details.lesson.startsAt) != previousDay)
            _DayLabel(
              day: previousDay = dateOnly(details.lesson.startsAt),
              today: today,
            ),
          LessonTile(key: ValueKey(details.lesson.id), details: details),
        ],
        if (hidden > 0)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              context.l10n.andMore(context.l10n.lessonsCount(hidden)),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
      ],
    );
  }
}

class _DayLabel extends StatelessWidget {
  const _DayLabel({required this.day, required this.today});

  final DateTime day;
  final DateTime today;

  @override
  Widget build(BuildContext context) {
    final tomorrow = DateTime(today.year, today.month, today.day + 1);
    final label = switch (day) {
      _ when day == today => context.l10n.commonToday,
      _ when day == tomorrow => context.l10n.commonTomorrow,
      _ => Formatters.dayHeader(day),
    };
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(label, style: Theme.of(context).textTheme.labelLarge),
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty({required this.range});

  final UpcomingRange range;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: SectionHint(
          range == UpcomingRange.today
              ? context.l10n.noMoreLessonsToday
              : context.l10n.noLessonsNextWeek,
        ),
      ),
      TextButton.icon(
        onPressed: () => context.push(AppRoutes.newLesson()),
        icon: const Icon(Icons.add),
        label: Text(context.l10n.planShort),
      ),
    ],
  );
}

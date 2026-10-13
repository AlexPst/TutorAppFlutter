import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_app/app/theme/finance_colors.dart';
import 'package:tutor_app/features/dashboard/presentation/providers/dashboard_screen_providers.dart';
import 'package:tutor_app/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:tutor_app/features/lessons/presentation/widgets/lesson_tile.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Прошедшие занятия, которые ещё не отмечены, с быстрыми действиями.
/// Показывается, только если такие есть.
class UnmarkedLessonsCard extends ConsumerWidget {
  const UnmarkedLessonsCard({super.key});

  static const _maxVisible = 3;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessons = ref.watch(unmarkedLessonsProvider).value;
    if (lessons == null || lessons.isEmpty) return const SizedBox.shrink();

    final hidden = lessons.length - _maxVisible;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DashboardSection(
        title: context.l10n.needsMarking,
        trailing: Badge.count(
          count: lessons.length,
          backgroundColor: FinanceColors.of(context).debt,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final details in lessons.take(_maxVisible))
              LessonTile(
                key: ValueKey(details.lesson.id),
                details: details,
                showDate: true,
                showMarkingHint: false,
              ),
            if (hidden > 0)
              Text(
                context.l10n.unmarkedMore(context.l10n.lessonsCount(hidden)),
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ],
        ),
      ),
    );
  }
}

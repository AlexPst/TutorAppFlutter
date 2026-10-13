import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/core/providers/clock_provider.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_details.dart';
import 'package:tutor_app/features/lessons/presentation/lesson_status_ui.dart';
import 'package:tutor_app/features/lessons/presentation/widgets/lesson_actions.dart';
import 'package:tutor_app/l10n/l10n.dart';

enum _MenuAction { editOutcome, reschedule, returnToPlanned, edit, delete }

/// Строка занятия с быстрыми действиями. Используется в расписании
/// и в карточке ученика.
class LessonTile extends ConsumerWidget {
  const LessonTile({
    super.key,
    required this.details,
    this.showStudent = true,
    this.showDate = false,
    this.showMarkingHint = true,
  });

  final LessonDetails details;

  /// В карточке ученика имя не нужно — вместо него показывается предмет.
  final bool showStudent;

  /// В расписании дата видна из заголовка дня, в карточке — нет.
  final bool showDate;

  /// Подпись «Нужно отметить» у прошедшего неотмеченного занятия. Лишняя
  /// там, где весь список — такие занятия.
  final bool showMarkingHint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final lesson = details.lesson;
    final status = lesson.status;
    final now = ref.watch(clockProvider)();
    final needsMarking =
        showMarkingHint && status.isPlanned && !lesson.endsAt.isAfter(now);

    final when = showDate
        ? Formatters.lessonDateTime(lesson.startsAt, now: now)
        : Formatters.timeRange(lesson.startsAt, lesson.endsAt);
    final String? charge = switch (lesson) {
      _ when !status.isBillable => null,
      _ when lesson.isPaidByPackage => context.l10n.commonPackage,
      _ => Formatters.money(lesson.price),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(left: 4, right: 0),
          leading: Icon(status.icon, color: status.color(context)),
          title: Text(showStudent ? details.studentName : details.subjectName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text([when, if (showStudent) details.subjectName].join(' · ')),
              Text(
                needsMarking
                    ? context.l10n.needsMarking
                    : [status.label(context.l10n), ?lesson.topic].join(' · '),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: needsMarking
                    ? TextStyle(color: theme.colorScheme.error)
                    : null,
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (charge != null) Text(charge),
              _LessonMenu(details: details),
            ],
          ),
          onTap: () => context.push(AppRoutes.editLesson(lesson.id)),
        ),
        if (status.isPlanned)
          Padding(
            padding: const EdgeInsets.fromLTRB(52, 0, 8, 8),
            child: Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                ActionChip(
                  avatar: const Icon(Icons.check, size: 18),
                  label: Text(context.l10n.statusCompleted),
                  onPressed: () => LessonActions.complete(context, details),
                ),
                ActionChip(
                  avatar: const Icon(Icons.close, size: 18),
                  label: Text(context.l10n.actionCancelled),
                  onPressed: () => LessonActions.cancel(context, ref, details),
                ),
                ActionChip(
                  avatar: const Icon(Icons.update, size: 18),
                  label: Text(context.l10n.actionReschedule),
                  onPressed: () =>
                      LessonActions.reschedule(context, ref, details),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _LessonMenu extends ConsumerWidget {
  const _LessonMenu({required this.details});

  final LessonDetails details;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlanned = details.lesson.status.isPlanned;
    final l10n = context.l10n;
    return PopupMenuButton<_MenuAction>(
      tooltip: l10n.lessonActionsTooltip,
      onSelected: (action) => switch (action) {
        _MenuAction.editOutcome => LessonActions.editOutcome(context, details),
        _MenuAction.reschedule => LessonActions.reschedule(
          context,
          ref,
          details,
        ),
        _MenuAction.returnToPlanned => LessonActions.returnToPlanned(
          context,
          ref,
          details,
        ),
        _MenuAction.edit => context.push(
          AppRoutes.editLesson(details.lesson.id),
        ),
        _MenuAction.delete => LessonActions.delete(context, ref, details),
      },
      itemBuilder: (_) => [
        PopupMenuItem(
          value: _MenuAction.editOutcome,
          child: Text(isPlanned ? l10n.markOutcome : l10n.editOutcome),
        ),
        if (isPlanned)
          PopupMenuItem(
            value: _MenuAction.reschedule,
            child: Text(l10n.actionReschedule),
          )
        else
          PopupMenuItem(
            value: _MenuAction.returnToPlanned,
            child: Text(l10n.returnToPlanned),
          ),
        PopupMenuItem(value: _MenuAction.edit, child: Text(l10n.commonEdit)),
        PopupMenuItem(
          value: _MenuAction.delete,
          child: Text(l10n.commonDelete),
        ),
      ],
    );
  }
}

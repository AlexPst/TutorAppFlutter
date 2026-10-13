import 'package:flutter/material.dart';
import 'package:tutor_app/app/theme/finance_colors.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Подписи, иконки и цвета статусов занятия для UI.
extension LessonStatusUi on LessonStatus {
  String label(AppLocalizations l10n) => switch (this) {
    LessonStatus.planned => l10n.statusPlanned,
    LessonStatus.completed => l10n.statusCompleted,
    LessonStatus.cancelledByStudent => l10n.statusCancelledByStudent,
    LessonStatus.cancelledByTutor => l10n.statusCancelledByTutor,
    LessonStatus.noShow => l10n.statusNoShow,
  };

  IconData get icon => switch (this) {
    LessonStatus.planned => Icons.schedule,
    LessonStatus.completed => Icons.check_circle_outline,
    LessonStatus.cancelledByStudent => Icons.event_busy,
    LessonStatus.cancelledByTutor => Icons.event_busy_outlined,
    LessonStatus.noShow => Icons.person_off_outlined,
  };

  Color color(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return switch (this) {
      LessonStatus.planned => colorScheme.primary,
      LessonStatus.completed => FinanceColors.of(context).advance,
      LessonStatus.cancelledByStudent ||
      LessonStatus.noShow => colorScheme.error,
      LessonStatus.cancelledByTutor => colorScheme.outline,
    };
  }
}

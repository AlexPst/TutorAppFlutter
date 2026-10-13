import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/core/widgets/messages.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_details.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/lessons/lessons_providers.dart';
import 'package:tutor_app/features/lessons/presentation/lesson_status_ui.dart';
import 'package:tutor_app/features/lessons/presentation/widgets/mark_lesson_sheet.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Быстрые действия с занятием из списков: отметить, отменить, перенести,
/// вернуть в план, удалить. Бизнес-правила — в use cases; здесь только
/// диалоги и сообщения.
///
/// Use case берётся из `ref` до `await`, а messenger — из `context`:
/// после переноса строка занятия может исчезнуть из списка, и её `ref`
/// и `context` станут недействительны.
abstract final class LessonActions {
  /// «Проведено»: панель с темой, оценкой и комментарием.
  static Future<void> complete(BuildContext context, LessonDetails details) =>
      showMarkLessonSheet(
        context,
        details: details,
        initialStatus: LessonStatus.completed,
      );

  /// Изменить итог уже отмеченного занятия.
  static Future<void> editOutcome(
    BuildContext context,
    LessonDetails details,
  ) => showMarkLessonSheet(
    context,
    details: details,
    initialStatus: details.lesson.status.isPlanned
        ? LessonStatus.completed
        : details.lesson.status,
  );

  /// «Отменено»: спрашивает, кто отменил, — от этого зависит оплата.
  static Future<void> cancel(
    BuildContext context,
    WidgetRef ref,
    LessonDetails details,
  ) async {
    final markLesson = ref.read(markLessonUseCaseProvider);
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    final status = await _askCancelReason(context);
    if (status == null) return;
    await _run(
      messenger,
      () => markLesson(lessonId: details.lesson.id, status: status),
      success: l10n.markedAs(status.label(l10n).toLowerCase()),
    );
  }

  /// «Перенести»: выбор новой даты и времени.
  static Future<void> reschedule(
    BuildContext context,
    WidgetRef ref,
    LessonDetails details,
  ) async {
    final rescheduleLesson = ref.read(rescheduleLessonUseCaseProvider);
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    final startsAt = await pickDateTime(context, details.lesson.startsAt);
    if (startsAt == null) return;
    await _run(
      messenger,
      () => rescheduleLesson(lessonId: details.lesson.id, startsAt: startsAt),
      success: l10n.rescheduledTo(Formatters.lessonDateTime(startsAt)),
    );
  }

  static Future<void> returnToPlanned(
    BuildContext context,
    WidgetRef ref,
    LessonDetails details,
  ) {
    final markLesson = ref.read(markLessonUseCaseProvider);
    return _run(
      ScaffoldMessenger.of(context),
      () =>
          markLesson(lessonId: details.lesson.id, status: LessonStatus.planned),
      success: context.l10n.lessonPlannedAgain,
    );
  }

  static Future<void> delete(
    BuildContext context,
    WidgetRef ref,
    LessonDetails details,
  ) async {
    final repository = ref.read(lessonRepositoryProvider);
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    final confirmed = await showConfirmDialog(
      context,
      title: l10n.deleteLessonTitle,
      message: l10n.deleteLessonMessage,
      confirmLabel: l10n.commonDelete,
      destructive: true,
    );
    if (!confirmed) return;
    await _run(
      messenger,
      () => repository.deleteLesson(details.lesson.id),
      success: l10n.lessonDeleted,
    );
  }

  /// Выбор даты, затем времени. `null`, если пользователь отменил выбор.
  static Future<DateTime?> pickDateTime(
    BuildContext context,
    DateTime initial,
  ) async {
    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(initial.year - 1),
      lastDate: DateTime(initial.year + 2),
    );
    if (date == null || !context.mounted) return null;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initial),
    );
    if (time == null) return null;
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  static Future<LessonStatus?> _askCancelReason(BuildContext context) =>
      showModalBottomSheet<LessonStatus>(
        context: context,
        showDragHandle: true,
        builder: (context) => SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final (status, title, subtitle) in [
                (
                  LessonStatus.cancelledByStudent,
                  context.l10n.cancelByStudent,
                  context.l10n.billable,
                ),
                (
                  LessonStatus.noShow,
                  context.l10n.cancelNoShow,
                  context.l10n.billable,
                ),
                (
                  LessonStatus.cancelledByTutor,
                  context.l10n.cancelByTutor,
                  context.l10n.notBillable,
                ),
              ])
                ListTile(
                  leading: Icon(status.icon, color: status.color(context)),
                  title: Text(title),
                  subtitle: Text(subtitle),
                  onTap: () => Navigator.of(context).pop(status),
                ),
            ],
          ),
        ),
      );

  static Future<void> _run(
    ScaffoldMessengerState messenger,
    Future<void> Function() action, {
    required String success,
  }) async {
    try {
      await action();
      messenger.showInfo(success);
    } on Object catch (error) {
      messenger.showError(error);
    }
  }
}

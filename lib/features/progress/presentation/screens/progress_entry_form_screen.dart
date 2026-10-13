import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/providers/clock_provider.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/core/widgets/async_value_view.dart';
import 'package:tutor_app/core/widgets/content_width.dart';
import 'package:tutor_app/core/widgets/empty_state.dart';
import 'package:tutor_app/core/widgets/messages.dart';
import 'package:tutor_app/core/widgets/picker_field.dart';
import 'package:tutor_app/core/widgets/unsaved_changes_scope.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_details.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/lessons/presentation/lesson_status_ui.dart';
import 'package:tutor_app/features/progress/domain/models/progress_entry.dart';
import 'package:tutor_app/features/progress/presentation/controllers/progress_entry_form_controller.dart';
import 'package:tutor_app/features/progress/presentation/providers/progress_screen_providers.dart';
import 'package:tutor_app/features/progress/presentation/widgets/grade_picker.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Новая запись прогресса (по [enrollmentId], при [lessonId] — сразу
/// привязанная к занятию) или редактирование записи [entryId].
class ProgressEntryFormScreen extends ConsumerWidget {
  const ProgressEntryFormScreen({
    super.key,
    this.entryId,
    this.enrollmentId,
    this.lessonId,
  }) : assert(entryId != null || enrollmentId != null);

  final int? entryId;
  final int? enrollmentId;
  final int? lessonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = entryId;
    final AsyncValue<ProgressEntry?> entryValue = id == null
        ? const AsyncData(null)
        : ref.watch(progressEntryForEditProvider(id));
    final entry = entryValue.value;
    final resolvedEnrollmentId = entry?.enrollmentId ?? enrollmentId;

    if (resolvedEnrollmentId != null && (id == null || entry != null)) {
      final contextValue = ref.watch(
        progressContextProvider(resolvedEnrollmentId),
      );
      final lessonsValue = ref.watch(pastLessonsProvider(resolvedEnrollmentId));
      final progressValue = ref.watch(
        subjectProgressProvider(resolvedEnrollmentId),
      );
      if ((contextValue.value, lessonsValue.value, progressValue.value) case (
        final progressContext?,
        final lessons?,
        final progress?,
      )) {
        // Занятия, к которым уже привязаны другие записи, недоступны.
        final takenLessonIds = {
          for (final item in progress.items)
            if (item.entryId != null && item.entryId != entry?.id)
              ?item.lessonId,
        };
        return _EntryForm(
          progressContext: progressContext,
          existing: entry,
          initialLessonId: lessonId,
          lessons: [
            for (final details in lessons)
              if (!takenLessonIds.contains(details.lesson.id)) details,
          ],
        );
      }
      return _placeholder(
        context,
        AsyncValue<Object?>.loading(),
        error: contextValue.error ?? lessonsValue.error ?? progressValue.error,
        notFound: contextValue.hasValue && contextValue.value == null,
      );
    }
    return _placeholder(
      context,
      entryValue,
      error: entryValue.error,
      notFound: entryValue.hasValue,
    );
  }

  Widget _placeholder(
    BuildContext context,
    AsyncValue<Object?> value, {
    required Object? error,
    required bool notFound,
  }) => Scaffold(
    appBar: AppBar(title: Text(context.l10n.progressEntryTitle)),
    body: notFound
        ? EmptyState(
            icon: Icons.search_off,
            title: context.l10n.failureProgressEntryNotFound,
            message: context.l10n.commonNotFoundMaybeDeleted,
          )
        : AsyncValueView(
            value: error == null
                ? value
                : AsyncValue<Object?>.error(error, StackTrace.current),
            data: (_) => const SizedBox.shrink(),
          ),
  );
}

class _EntryForm extends ConsumerStatefulWidget {
  const _EntryForm({
    required this.progressContext,
    required this.existing,
    required this.initialLessonId,
    required this.lessons,
  });

  final ProgressContext progressContext;
  final ProgressEntry? existing;
  final int? initialLessonId;

  /// Прошедшие занятия, к которым можно привязать запись.
  final List<LessonDetails> lessons;

  @override
  ConsumerState<_EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends ConsumerState<_EntryForm> {
  final _topic = TextEditingController();
  final _note = TextEditingController();
  int? _lessonId;
  int? _grade;
  late DateTime _date;
  var _hasChanges = false;

  bool get _isEditing => widget.existing != null;

  LessonDetails? get _lesson => widget.lessons
      .where((details) => details.lesson.id == _lessonId)
      .firstOrNull;

  /// Оценка ставится только за проведённое занятие (или запись вне занятия).
  bool get _canGrade =>
      _lesson == null || _lesson!.lesson.status == LessonStatus.completed;

  @override
  void initState() {
    super.initState();
    final today = dateOnly(ref.read(clockProvider)());
    if (widget.existing case final entry?) {
      _lessonId = entry.lessonId;
      _grade = entry.grade;
      _date = entry.date;
      _note.text = entry.note ?? '';
      _topic.text = entry.topic ?? _lesson?.lesson.topic ?? '';
    } else {
      _date = today;
      if (widget.lessons.any((d) => d.lesson.id == widget.initialLessonId)) {
        _selectLesson(widget.initialLessonId);
      }
    }
  }

  @override
  void dispose() {
    _topic.dispose();
    _note.dispose();
    super.dispose();
  }

  void _markChanged() {
    if (!_hasChanges) setState(() => _hasChanges = true);
  }

  /// Подставляет дату и тему выбранного занятия.
  void _selectLesson(int? lessonId) {
    _lessonId = lessonId;
    final lesson = _lesson?.lesson;
    if (lesson == null) return;
    _date = lesson.startsAt;
    if (_topic.text.trim().isEmpty) _topic.text = lesson.topic ?? '';
    if (lesson.status != LessonStatus.completed) _grade = null;
  }

  Future<void> _pickDate() async {
    final today = dateOnly(ref.read(clockProvider)());
    final date = await showDatePicker(
      context: context,
      initialDate: _date.isAfter(today) ? today : _date,
      firstDate: DateTime(today.year - 2),
      lastDate: today,
    );
    if (date == null) return;
    setState(() => _date = date);
    _markChanged();
  }

  Future<void> _save() async {
    final messenger = ScaffoldMessenger.of(context);
    final savedMessage = context.l10n.entrySaved;
    final controller = ref.read(progressEntryFormControllerProvider.notifier);
    final grade = _canGrade ? _grade : null;
    final saved = switch (widget.existing) {
      final entry? => await controller.updateEntry(
        entry.copyWith(
          lessonId: _lessonId,
          date: _date,
          topic: _topic.text,
          grade: grade,
          note: _note.text,
        ),
      ),
      null => await controller.createEntry(
        ProgressEntryDraft(
          enrollmentId: widget.progressContext.enrollment.enrollment.id,
          lessonId: _lessonId,
          date: _date,
          topic: _topic.text,
          grade: grade,
          note: _note.text,
        ),
      ),
    };
    if (!saved || !mounted) return;
    setState(() => _hasChanges = false);
    context.pop();
    messenger.showInfo(savedMessage);
  }

  Future<void> _delete() async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    final confirmed = await showConfirmDialog(
      context,
      title: l10n.deleteEntryTitle,
      message: l10n.deleteEntryMessage,
      confirmLabel: l10n.commonDelete,
      destructive: true,
    );
    if (!confirmed) return;
    final deleted = await ref
        .read(progressEntryFormControllerProvider.notifier)
        .deleteEntry(widget.existing!.id);
    if (!deleted || !mounted) return;
    setState(() => _hasChanges = false);
    context.pop();
    messenger.showInfo(l10n.entryDeleted);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(progressEntryFormControllerProvider, (_, state) {
      if (state case AsyncError(:final error)) {
        showErrorSnackBar(context, error);
      }
    });
    final isSaving = ref.watch(progressEntryFormControllerProvider).isLoading;
    final (:student, :enrollment) = widget.progressContext;
    final scale = student.gradeScale;
    final theme = Theme.of(context);

    return UnsavedChangesScope(
      hasChanges: _hasChanges,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _isEditing
                ? context.l10n.progressEntryTitle
                : context.l10n.progressEntryNewTitle,
          ),
          actions: [
            if (_isEditing)
              IconButton(
                tooltip: context.l10n.deleteEntryTooltip,
                icon: const Icon(Icons.delete_outline),
                onPressed: isSaving ? null : _delete,
              ),
          ],
        ),
        body: ContentWidth(
          maxWidth: 640,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                '${student.fullName} · ${enrollment.subject.name}',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<int?>(
                isExpanded: true,
                initialValue: _lessonId,
                decoration: InputDecoration(
                  labelText: context.l10n.lessonTitle,
                  helperText: context.l10n.linkLessonHelper,
                  helperMaxLines: 2,
                ),
                items: [
                  DropdownMenuItem(
                    value: null,
                    child: Text(context.l10n.noLessonLink),
                  ),
                  for (final details in widget.lessons)
                    DropdownMenuItem(
                      value: details.lesson.id,
                      child: Text(
                        [
                          Formatters.lessonDateTime(details.lesson.startsAt),
                          details.lesson.status.label(context.l10n),
                          ?details.lesson.topic,
                        ].join(' · '),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
                onChanged: (lessonId) {
                  setState(() => _selectLesson(lessonId));
                  _markChanged();
                },
              ),
              const SizedBox(height: 16),
              if (_lesson == null)
                PickerField(
                  label: context.l10n.commonDate,
                  value: Formatters.date(_date),
                  icon: Icons.calendar_today_outlined,
                  onTap: _pickDate,
                )
              else
                InputDecorator(
                  decoration: InputDecoration(
                    labelText: context.l10n.commonDate,
                    helperText: context.l10n.lessonDateHelper,
                  ),
                  child: Text(Formatters.date(_date)),
                ),
              const SizedBox(height: 16),
              TextField(
                controller: _topic,
                decoration: InputDecoration(
                  labelText: context.l10n.commonTopic,
                  helperText: _lesson == null
                      ? null
                      : context.l10n.topicSavedToLesson,
                ),
                textCapitalization: TextCapitalization.sentences,
                onChanged: (_) => _markChanged(),
              ),
              const SizedBox(height: 16),
              Text(
                context.l10n.gradeWithScale(scale.min, scale.max),
                style: theme.textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              if (_canGrade)
                GradePicker(
                  scale: scale,
                  value: _grade,
                  onChanged: (grade) {
                    setState(() => _grade = grade);
                    _markChanged();
                  },
                )
              else
                Text(
                  context.l10n.gradeOnlyCompletedHint,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              const SizedBox(height: 16),
              TextField(
                controller: _note,
                decoration: InputDecoration(
                  labelText: context.l10n.commonNote,
                  hintText: context.l10n.commentHint,
                  alignLabelWithHint: true,
                ),
                textCapitalization: TextCapitalization.sentences,
                minLines: 2,
                maxLines: 5,
                onChanged: (_) => _markChanged(),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: isSaving ? null : _save,
                icon: isSaving
                    ? const SizedBox.square(
                        dimension: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.check),
                label: Text(
                  _isEditing ? context.l10n.commonSave : context.l10n.addEntry,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

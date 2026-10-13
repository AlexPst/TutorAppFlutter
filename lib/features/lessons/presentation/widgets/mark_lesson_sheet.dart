import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/core/widgets/error_view.dart';
import 'package:tutor_app/core/widgets/messages.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_details.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/lessons/domain/usecases/mark_lesson.dart';
import 'package:tutor_app/features/lessons/lessons_providers.dart';
import 'package:tutor_app/features/lessons/presentation/lesson_status_ui.dart';
import 'package:tutor_app/features/lessons/presentation/providers/lesson_form_providers.dart';
import 'package:tutor_app/features/progress/domain/models/progress_entry.dart';
import 'package:tutor_app/features/progress/presentation/widgets/grade_picker.dart';
import 'package:tutor_app/l10n/l10n.dart';

Future<void> showMarkLessonSheet(
  BuildContext context, {
  required LessonDetails details,
  required LessonStatus initialStatus,
}) => showModalBottomSheet<void>(
  context: context,
  isScrollControlled: true,
  useSafeArea: true,
  showDragHandle: true,
  builder: (_) =>
      _MarkLessonSheet(details: details, initialStatus: initialStatus),
);

/// Отметка итога занятия: статус, тема, оценка по шкале ученика,
/// комментарий.
class _MarkLessonSheet extends ConsumerWidget {
  const _MarkLessonSheet({required this.details, required this.initialStatus});

  final LessonDetails details;
  final LessonStatus initialStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entry = ref.watch(lessonProgressEntryProvider(details.lesson.id));
    if (entry.hasValue) {
      return _MarkLessonForm(
        details: details,
        initialStatus: initialStatus,
        entry: entry.value,
      );
    }
    return SizedBox(
      height: 200,
      child: entry.hasError
          ? ErrorView(error: entry.error!)
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class _MarkLessonForm extends ConsumerStatefulWidget {
  const _MarkLessonForm({
    required this.details,
    required this.initialStatus,
    required this.entry,
  });

  final LessonDetails details;
  final LessonStatus initialStatus;
  final ProgressEntry? entry;

  @override
  ConsumerState<_MarkLessonForm> createState() => _MarkLessonFormState();
}

class _MarkLessonFormState extends ConsumerState<_MarkLessonForm> {
  static const _outcomes = [
    LessonStatus.completed,
    LessonStatus.noShow,
    LessonStatus.cancelledByStudent,
    LessonStatus.cancelledByTutor,
  ];

  late var _status = widget.initialStatus;
  late int? _grade = widget.entry?.grade;
  late final _topic = TextEditingController(text: widget.details.lesson.topic);
  late final _comment = TextEditingController(text: widget.entry?.note);
  var _isSaving = false;

  @override
  void dispose() {
    _topic.dispose();
    _comment.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final markLesson = ref.read(markLessonUseCaseProvider);
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final l10n = context.l10n;
    setState(() => _isSaving = true);
    try {
      await markLesson(
        lessonId: widget.details.lesson.id,
        status: _status,
        topic: _topic.text,
        result: LessonResult(
          grade: _status == LessonStatus.completed ? _grade : null,
          comment: _comment.text,
        ),
      );
      navigator.pop();
      messenger.showInfo(l10n.markedAs(_status.label(l10n).toLowerCase()));
    } on Object catch (error) {
      messenger.showError(error);
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final details = widget.details;
    final scale = details.gradeScale;

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '${details.studentName} · ${details.subjectName}',
              style: theme.textTheme.titleLarge,
            ),
            Text(
              Formatters.lessonDateTime(details.lesson.startsAt),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final status in _outcomes)
                  ChoiceChip(
                    avatar: Icon(status.icon, size: 18),
                    label: Text(status.label(context.l10n)),
                    selected: _status == status,
                    onSelected: (_) => setState(() => _status = status),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              _status.isBillable
                  ? context.l10n.billableHint
                  : context.l10n.notBillable,
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _topic,
              decoration: InputDecoration(labelText: context.l10n.lessonTopic),
              textCapitalization: TextCapitalization.sentences,
            ),
            if (_status == LessonStatus.completed) ...[
              const SizedBox(height: 16),
              Text(
                context.l10n.gradeWithScale(scale.min, scale.max),
                style: theme.textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              GradePicker(
                scale: scale,
                value: _grade,
                onChanged: (grade) => setState(() => _grade = grade),
              ),
            ],
            const SizedBox(height: 16),
            TextField(
              controller: _comment,
              decoration: InputDecoration(
                labelText: context.l10n.comment,
                hintText: context.l10n.commentHint,
              ),
              textCapitalization: TextCapitalization.sentences,
              minLines: 2,
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _isSaving ? null : _save,
              icon: _isSaving
                  ? const SizedBox.square(
                      dimension: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.check),
              label: Text(context.l10n.commonSave),
            ),
          ],
        ),
      ),
    );
  }
}

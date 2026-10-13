import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_app/core/widgets/messages.dart';
import 'package:tutor_app/core/widgets/text_input_dialog.dart';
import 'package:tutor_app/features/students/domain/models/enrollment_with_subject.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';
import 'package:tutor_app/features/students/presentation/controllers/student_actions_controller.dart';
import 'package:tutor_app/features/students/presentation/providers/student_details_providers.dart';
import 'package:tutor_app/features/students/presentation/widgets/tabs/student_tab_view.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Общая заметка об ученике и заметки по каждому предмету (цели, слабые
/// места). Редактируются прямо здесь.
class StudentNotesTab extends ConsumerWidget {
  const StudentNotesTab({super.key, required this.student});

  final Student student;

  Future<void> _edit(
    BuildContext context,
    WidgetRef ref, {
    required String title,
    required String? current,
    required Future<bool> Function(StudentActionsController actions, String)
    save,
  }) async {
    final text = await showTextInputDialog(
      context,
      title: title,
      label: context.l10n.commonNote,
      initialValue: current ?? '',
      multiline: true,
    );
    if (text == null) return;
    final actions = ref.read(
      studentActionsControllerProvider(student.id).notifier,
    );
    if (await save(actions, text) && context.mounted) {
      showInfoSnackBar(context, context.l10n.notesSaved);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      StudentTabView<List<EnrollmentWithSubject>>(
        storageKey: 'notes',
        value: ref
            .watch(studentEnrollmentsProvider(student.id))
            .whenData(
              (items) =>
                  items.where((item) => !item.enrollment.isArchived).toList(),
            ),
        onRetry: () => ref.invalidate(studentEnrollmentsProvider(student.id)),
        // Общая заметка есть всегда, поэтому вкладка не бывает пустой.
        isEmpty: (_) => false,
        empty: const SizedBox.shrink(),
        slivers: (enrollments) => [
          SliverList.list(
            children: [
              _NoteCard(
                title: context.l10n.notesAboutStudent,
                note: student.note,
                onEdit: () => _edit(
                  context,
                  ref,
                  title: context.l10n.notesStudentNoteTitle,
                  current: student.note,
                  save: (actions, text) => actions.saveNote(text),
                ),
              ),
              for (final item in enrollments) ...[
                const SizedBox(height: 12),
                _NoteCard(
                  title: item.subject.name,
                  subtitle: context.l10n.notesSubjectHint,
                  note: item.enrollment.note,
                  onEdit: () => _edit(
                    context,
                    ref,
                    title: item.subject.name,
                    current: item.enrollment.note,
                    save: (actions, text) =>
                        actions.saveEnrollmentNote(item.enrollment.id, text),
                  ),
                ),
              ],
            ],
          ),
        ],
      );
}

class _NoteCard extends StatelessWidget {
  const _NoteCard({
    required this.title,
    required this.note,
    required this.onEdit,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final String? note;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: theme.textTheme.titleMedium),
                      if (subtitle != null)
                        Text(subtitle!, style: theme.textTheme.bodySmall),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: context.l10n.notesEditTooltip,
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: onEdit,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              note ?? context.l10n.notesEmpty,
              style: note == null
                  ? theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontStyle: FontStyle.italic,
                    )
                  : theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

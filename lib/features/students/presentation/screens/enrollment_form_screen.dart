import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/not_found_screen.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/core/widgets/content_width.dart';
import 'package:tutor_app/core/widgets/error_view.dart';
import 'package:tutor_app/core/widgets/messages.dart';
import 'package:tutor_app/core/widgets/text_input_dialog.dart';
import 'package:tutor_app/core/widgets/unsaved_changes_scope.dart';
import 'package:tutor_app/features/students/domain/models/enrollment_with_subject.dart';
import 'package:tutor_app/features/students/domain/student_validator.dart';
import 'package:tutor_app/features/students/presentation/controllers/enrollment_form_controller.dart';
import 'package:tutor_app/features/students/presentation/providers/student_details_providers.dart';
import 'package:tutor_app/features/subjects/domain/models/subject.dart';
import 'package:tutor_app/features/subjects/presentation/subjects_list_provider.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Добавление предмета ученику (без [enrollmentId]) или изменение ставки,
/// длительности, заметки и архивности существующего направления.
class EnrollmentFormScreen extends ConsumerWidget {
  const EnrollmentFormScreen({
    super.key,
    required this.studentId,
    this.enrollmentId,
  });

  final int studentId;
  final int? enrollmentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enrollmentsValue = ref.watch(studentEnrollmentsProvider(studentId));
    final subjectsValue = ref.watch(subjectsListProvider);
    final title = enrollmentId == null
        ? context.l10n.enrollmentNewTitle
        : context.l10n.enrollmentTitle;

    if (enrollmentsValue.value case final enrollments?) {
      if (subjectsValue.value case final subjects?) {
        final existing = enrollments
            .where((item) => item.enrollment.id == enrollmentId)
            .firstOrNull;
        if (enrollmentId != null && existing == null) {
          return NotFoundScreen(title: context.l10n.failureEnrollmentNotFound);
        }
        final takenSubjectIds = {
          for (final item in enrollments) item.subject.id,
        };
        return _EnrollmentForm(
          title: title,
          studentId: studentId,
          existing: existing,
          availableSubjects: [
            for (final subject in subjects)
              if (!takenSubjectIds.contains(subject.id)) subject,
          ],
        );
      }
    }

    final error = enrollmentsValue.error ?? subjectsValue.error;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: error != null
          ? ErrorView(
              error: error,
              onRetry: () => ref
                ..invalidate(studentEnrollmentsProvider(studentId))
                ..invalidate(subjectsListProvider),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class _EnrollmentForm extends ConsumerStatefulWidget {
  const _EnrollmentForm({
    required this.title,
    required this.studentId,
    required this.existing,
    required this.availableSubjects,
  });

  final String title;
  final int studentId;
  final EnrollmentWithSubject? existing;

  /// Предметы, по которым у ученика ещё нет направления.
  final List<Subject> availableSubjects;

  @override
  ConsumerState<_EnrollmentForm> createState() => _EnrollmentFormState();
}

class _EnrollmentFormState extends ConsumerState<_EnrollmentForm> {
  /// Пункт «Новый предмет…» в списке предметов.
  static const _newSubject = -1;
  static const _durationOptions = [30, 45, 60, 75, 90, 120, 150, 180];

  final _formKey = GlobalKey<FormState>();
  late int? _subjectId = widget.existing?.subject.id;
  late final _rate = TextEditingController(
    text: switch (widget.existing?.enrollment.rate) {
      final rate? => Formatters.moneyInput(rate),
      null => '',
    },
  );
  late int _durationMinutes =
      widget.existing?.enrollment.defaultDuration.inMinutes ?? 60;
  late final _note = TextEditingController(
    text: widget.existing?.enrollment.note,
  );
  late bool _isArchived = widget.existing?.enrollment.isArchived ?? false;
  var _hasChanges = false;

  /// Пересоздаёт выпадающий список, когда выбор меняется программно.
  var _subjectFieldGeneration = 0;

  bool get _isEditing => widget.existing != null;

  @override
  void dispose() {
    _rate.dispose();
    _note.dispose();
    super.dispose();
  }

  void _markChanged() {
    if (!_hasChanges) setState(() => _hasChanges = true);
  }

  Future<void> _onSubjectChanged(int? value) async {
    if (value != _newSubject) {
      setState(() => _subjectId = value);
      _markChanged();
      return;
    }

    final name = await showTextInputDialog(
      context,
      title: context.l10n.enrollmentNewTitle,
      label: context.l10n.subjectNameLabel,
      confirmLabel: context.l10n.commonAdd,
      validator: (text) =>
          (text?.trim().isEmpty ?? true) ? context.l10n.enterName : null,
    );
    final id = name == null
        ? null
        : await ref
              .read(enrollmentFormControllerProvider.notifier)
              .createSubject(name);
    if (!mounted) return;
    setState(() {
      if (id != null) _subjectId = id;
      _subjectFieldGeneration++;
    });
    if (id != null) _markChanged();
  }

  Future<void> _save() async {
    final subjectId = _subjectId;
    if (!_formKey.currentState!.validate() || subjectId == null) return;

    final saved = await ref
        .read(enrollmentFormControllerProvider.notifier)
        .save(
          studentId: widget.studentId,
          initial: widget.existing?.enrollment,
          subjectId: subjectId,
          rate: Money.tryParse(_rate.text)!,
          defaultDuration: Duration(minutes: _durationMinutes),
          note: _note.text,
          isArchived: _isArchived,
        );
    if (!saved || !mounted) return;
    setState(() => _hasChanges = false);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(enrollmentFormControllerProvider, (_, state) {
      if (state case AsyncError(:final error)) {
        showErrorSnackBar(context, error);
      }
    });
    final isSaving = ref.watch(enrollmentFormControllerProvider).isLoading;
    final durations = {..._durationOptions, _durationMinutes}.toList()..sort();

    return UnsavedChangesScope(
      hasChanges: _hasChanges,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: ContentWidth(
          maxWidth: 640,
          child: Form(
            key: _formKey,
            onChanged: _markChanged,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (widget.existing case final existing?)
                  InputDecorator(
                    decoration: InputDecoration(
                      labelText: context.l10n.commonSubject,
                    ),
                    child: Text(existing.subject.name),
                  )
                else
                  _subjectField(),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _rate,
                  decoration: InputDecoration(
                    labelText: context.l10n.enrollmentPrice,
                    suffixText: '₽',
                    helperText: context.l10n.enrollmentPriceHelper,
                    helperMaxLines: 2,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  validator: localizedValidator(context, StudentValidator.rate),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<int>(
                  isExpanded: true,
                  initialValue: _durationMinutes,
                  decoration: InputDecoration(
                    labelText: context.l10n.defaultDuration,
                  ),
                  items: [
                    for (final minutes in durations)
                      DropdownMenuItem(
                        value: minutes,
                        child: Text(
                          context.l10n.duration(Duration(minutes: minutes)),
                        ),
                      ),
                  ],
                  onChanged: (minutes) {
                    if (minutes != null) _durationMinutes = minutes;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _note,
                  decoration: InputDecoration(
                    labelText: context.l10n.enrollmentNote,
                    hintText: context.l10n.notesSubjectHint,
                    alignLabelWithHint: true,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  minLines: 3,
                  maxLines: 6,
                ),
                if (_isEditing) ...[
                  const SizedBox(height: 8),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(context.l10n.archivedSwitch),
                    subtitle: Text(context.l10n.enrollmentArchivedHint),
                    value: _isArchived,
                    onChanged: (value) {
                      setState(() => _isArchived = value);
                      _markChanged();
                    },
                  ),
                ],
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
                    _isEditing
                        ? context.l10n.commonSave
                        : context.l10n.addSubject,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _subjectField() {
    final subjects = widget.availableSubjects;
    // Только что созданный предмет может ещё не прийти из стрима.
    final selected = subjects.any((subject) => subject.id == _subjectId)
        ? _subjectId
        : null;
    return DropdownButtonFormField<int>(
      isExpanded: true,
      key: ValueKey('subject-$_subjectFieldGeneration-${subjects.length}'),
      initialValue: selected,
      decoration: InputDecoration(
        labelText: context.l10n.commonSubjectRequired,
        helperText: subjects.isEmpty ? context.l10n.addSubjectHint : null,
      ),
      items: [
        for (final subject in subjects)
          DropdownMenuItem(value: subject.id, child: Text(subject.name)),
        DropdownMenuItem(
          value: _newSubject,
          child: Row(
            children: [
              const Icon(Icons.add, size: 20),
              const SizedBox(width: 8),
              Text(context.l10n.newSubjectOption),
            ],
          ),
        ),
      ],
      onChanged: _onSubjectChanged,
      validator: (value) => value == null || value == _newSubject
          ? context.l10n.commonSelectSubject
          : null,
    );
  }
}

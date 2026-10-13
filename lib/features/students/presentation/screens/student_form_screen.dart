import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/core/widgets/async_value_view.dart';
import 'package:tutor_app/core/widgets/content_width.dart';
import 'package:tutor_app/core/widgets/empty_state.dart';
import 'package:tutor_app/core/widgets/messages.dart';
import 'package:tutor_app/core/widgets/unsaved_changes_scope.dart';
import 'package:tutor_app/features/students/domain/models/grade_scale.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';
import 'package:tutor_app/features/students/domain/student_validator.dart';
import 'package:tutor_app/features/students/presentation/controllers/student_form_controller.dart';
import 'package:tutor_app/features/students/presentation/providers/student_details_providers.dart';
import 'package:tutor_app/features/students/presentation/widgets/grade_scale_field.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Создание ученика (без [studentId]) или редактирование существующего.
class StudentFormScreen extends ConsumerWidget {
  const StudentFormScreen({super.key, this.studentId});

  final int? studentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = studentId;
    if (id == null) return const _StudentForm(initial: null);

    final student = ref.watch(studentProvider(id));
    if (student.value case final loaded?) return _StudentForm(initial: loaded);
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.studentEditTitle)),
      body: AsyncValueView(
        value: student,
        onRetry: () => ref.invalidate(studentProvider(id)),
        data: (_) => EmptyState(
          icon: Icons.person_off_outlined,
          title: context.l10n.failureStudentNotFound,
          message: context.l10n.commonNotFoundMaybeDeleted,
        ),
      ),
    );
  }
}

class _StudentForm extends ConsumerStatefulWidget {
  const _StudentForm({required this.initial});

  final Student? initial;

  @override
  ConsumerState<_StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends ConsumerState<_StudentForm> {
  final _formKey = GlobalKey<FormState>();
  late final _fullName = TextEditingController(text: widget.initial?.fullName);
  late final _phone = TextEditingController(text: widget.initial?.phone);
  late final _telegram = TextEditingController(text: widget.initial?.telegram);
  late final _note = TextEditingController(text: widget.initial?.note);
  late GradeScale? _gradeScale =
      widget.initial?.gradeScale ?? GradeScale.fivePoint;
  var _hasChanges = false;

  bool get _isEditing => widget.initial != null;

  @override
  void dispose() {
    _fullName.dispose();
    _phone.dispose();
    _telegram.dispose();
    _note.dispose();
    super.dispose();
  }

  void _markChanged() {
    if (!_hasChanges) setState(() => _hasChanges = true);
  }

  Future<void> _save() async {
    final gradeScale = _gradeScale;
    if (!_formKey.currentState!.validate() || gradeScale == null) return;

    final id = await ref
        .read(studentFormControllerProvider.notifier)
        .save(
          initial: widget.initial,
          data: StudentFormData(
            fullName: _fullName.text,
            phone: _phone.text,
            telegram: _telegram.text,
            note: _note.text,
            gradeScale: gradeScale,
          ),
        );
    if (id == null || !mounted) return;

    setState(() => _hasChanges = false);
    if (_isEditing) {
      context.pop();
    } else {
      context.go(AppRoutes.student(id));
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(studentFormControllerProvider, (_, state) {
      if (state case AsyncError(:final error)) {
        showErrorSnackBar(context, error);
      }
    });
    final isSaving = ref.watch(studentFormControllerProvider).isLoading;

    return UnsavedChangesScope(
      hasChanges: _hasChanges,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _isEditing
                ? context.l10n.studentEditTitle
                : context.l10n.studentNewTitle,
          ),
        ),
        body: ContentWidth(
          maxWidth: 640,
          child: Form(
            key: _formKey,
            onChanged: _markChanged,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: _fullName,
                  autofocus: !_isEditing,
                  decoration: InputDecoration(
                    labelText: context.l10n.fieldFullName,
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  validator: localizedValidator(
                    context,
                    StudentValidator.fullName,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phone,
                  decoration: InputDecoration(
                    labelText: context.l10n.fieldPhone,
                    hintText: '+7 900 123-45-67',
                    prefixIcon: Icon(Icons.phone_outlined),
                  ),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  validator: localizedValidator(
                    context,
                    StudentValidator.phone,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _telegram,
                  decoration: InputDecoration(
                    labelText: 'Telegram',
                    hintText: context.l10n.fieldTelegramHint,
                    prefixIcon: Icon(Icons.send_outlined),
                  ),
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  validator: localizedValidator(
                    context,
                    StudentValidator.telegram,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  context.l10n.gradeScaleTitle,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                GradeScaleField(
                  initial: widget.initial?.gradeScale ?? GradeScale.fivePoint,
                  onChanged: (gradeScale) {
                    _gradeScale = gradeScale;
                    _markChanged();
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _note,
                  decoration: InputDecoration(
                    labelText: context.l10n.commonNote,
                    hintText: context.l10n.studentNoteHint,
                    alignLabelWithHint: true,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  minLines: 3,
                  maxLines: 6,
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
                    _isEditing
                        ? context.l10n.commonSave
                        : context.l10n.commonAddStudent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

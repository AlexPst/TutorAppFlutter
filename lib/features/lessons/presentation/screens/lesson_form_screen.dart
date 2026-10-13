import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/core/providers/clock_provider.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/core/widgets/async_value_view.dart';
import 'package:tutor_app/core/widgets/content_width.dart';
import 'package:tutor_app/core/widgets/empty_state.dart';
import 'package:tutor_app/core/widgets/messages.dart';
import 'package:tutor_app/core/widgets/picker_field.dart';
import 'package:tutor_app/core/widgets/unsaved_changes_scope.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_details.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/lessons/presentation/controllers/lesson_form_controller.dart';
import 'package:tutor_app/features/lessons/presentation/lesson_status_ui.dart';
import 'package:tutor_app/features/lessons/presentation/providers/lesson_form_providers.dart';
import 'package:tutor_app/features/students/domain/models/enrollment_with_subject.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';
import 'package:tutor_app/features/students/domain/student_validator.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Создание занятия (без [lessonId]) или его редактирование.
/// [studentId] и [date] предзаполняют новое занятие.
class LessonFormScreen extends ConsumerWidget {
  const LessonFormScreen({super.key, this.lessonId, this.studentId, this.date});

  final int? lessonId;
  final int? studentId;
  final DateTime? date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = lessonId;
    if (id != null) {
      final details = ref.watch(lessonDetailsProvider(id));
      if (details.value case final loaded?) {
        return _LessonForm(existing: loaded, students: const []);
      }
      return _Placeholder(
        title: context.l10n.lessonTitle,
        value: details,
        onRetry: () => ref.invalidate(lessonDetailsProvider(id)),
        empty: EmptyState(
          icon: Icons.event_busy_outlined,
          title: context.l10n.failureLessonNotFound,
          message: context.l10n.commonNotFoundMaybeDeleted,
        ),
      );
    }

    final students = ref.watch(lessonFormStudentsProvider);
    if (students.value case final list? when list.isNotEmpty) {
      return _LessonForm(
        existing: null,
        students: list,
        initialStudentId: studentId,
        initialDate: date,
      );
    }
    return _Placeholder(
      title: context.l10n.lessonNewTitle,
      value: students,
      onRetry: () => ref.invalidate(lessonFormStudentsProvider),
      empty: EmptyState(
        icon: Icons.school_outlined,
        title: context.l10n.commonAddStudentFirst,
        message: context.l10n.lessonNeedsStudentMessage,
        actionLabel: context.l10n.commonAddStudent,
        onAction: () => context.go(AppRoutes.newStudent),
      ),
    );
  }
}

/// Загрузка, ошибка или пустое состояние до появления формы.
class _Placeholder extends StatelessWidget {
  const _Placeholder({
    required this.title,
    required this.value,
    required this.onRetry,
    required this.empty,
  });

  final String title;
  final AsyncValue<Object?> value;
  final VoidCallback onRetry;
  final Widget empty;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: AsyncValueView(value: value, onRetry: onRetry, data: (_) => empty),
  );
}

class _LessonForm extends ConsumerStatefulWidget {
  const _LessonForm({
    required this.existing,
    required this.students,
    this.initialStudentId,
    this.initialDate,
  });

  final LessonDetails? existing;
  final List<Student> students;
  final int? initialStudentId;
  final DateTime? initialDate;

  @override
  ConsumerState<_LessonForm> createState() => _LessonFormState();
}

class _LessonFormState extends ConsumerState<_LessonForm> {
  static const _durationOptions = [30, 45, 60, 75, 90, 120, 150, 180];

  final _formKey = GlobalKey<FormState>();
  final _price = TextEditingController();
  final _topic = TextEditingController();
  final _note = TextEditingController();

  int? _studentId;
  int? _enrollmentId;
  List<EnrollmentWithSubject>? _enrollments;
  late DateTime _date;
  late TimeOfDay _time;
  var _durationMinutes = 60;
  var _status = LessonStatus.planned;
  var _hasChanges = false;
  var _isInitialized = false;

  /// Пересоздаёт выпадающие списки, когда их значение меняется программно.
  var _fieldsGeneration = 0;

  ProviderSubscription<AsyncValue<List<EnrollmentWithSubject>>>?
  _enrollmentsSubscription;

  bool get _isEditing => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final now = ref.read(clockProvider)();
    if (widget.existing case final existing?) {
      final lesson = existing.lesson;
      _studentId = existing.studentId;
      _enrollmentId = lesson.enrollmentId;
      _date = dateOnly(lesson.startsAt);
      _time = TimeOfDay.fromDateTime(lesson.startsAt);
      _durationMinutes = lesson.duration.inMinutes;
      _status = lesson.status;
      _price.text = Formatters.moneyInput(lesson.price);
      _topic.text = lesson.topic ?? '';
      _note.text = lesson.note ?? '';
    } else {
      _date = dateOnly(widget.initialDate ?? now);
      _time = _defaultTime(now);
      final initialStudent = widget.initialStudentId;
      if (widget.students.any((student) => student.id == initialStudent)) {
        _studentId = initialStudent;
        _listenEnrollments(initialStudent!);
      }
    }
    _isInitialized = true;
  }

  @override
  void dispose() {
    _price.dispose();
    _topic.dispose();
    _note.dispose();
    super.dispose();
  }

  /// Сегодня — ближайший целый час, в другие дни — 16:00.
  TimeOfDay _defaultTime(DateTime now) => _date == dateOnly(now)
      ? TimeOfDay(hour: (now.hour + 1).clamp(0, 23), minute: 0)
      : const TimeOfDay(hour: 16, minute: 0);

  /// Внутри `initState` нельзя вызывать `setState`.
  void _update(VoidCallback change) =>
      _isInitialized ? setState(change) : change();

  void _markChanged() {
    if (!_hasChanges) setState(() => _hasChanges = true);
  }

  void _listenEnrollments(int studentId) {
    _enrollmentsSubscription?.close();
    _enrollmentsSubscription = ref.listenManual(
      lessonFormEnrollmentsProvider(studentId),
      fireImmediately: true,
      (_, next) {
        final enrollments = next.value;
        if (enrollments == null) return;
        _update(() {
          _enrollments = enrollments;
          // Единственный предмет выбирается сразу.
          if (_enrollmentId == null && enrollments.length == 1) {
            _applyEnrollment(enrollments.single);
          }
        });
      },
    );
  }

  /// Подставляет длительность и ставку выбранного предмета.
  void _applyEnrollment(EnrollmentWithSubject item) {
    _enrollmentId = item.enrollment.id;
    _durationMinutes = item.enrollment.defaultDuration.inMinutes;
    _price.text = Formatters.moneyInput(item.enrollment.rate);
    _fieldsGeneration++;
  }

  void _onStudentChanged(int? studentId) {
    setState(() {
      _studentId = studentId;
      _enrollmentId = null;
      _enrollments = null;
      _fieldsGeneration++;
    });
    if (studentId != null) _listenEnrollments(studentId);
    _markChanged();
  }

  void _onEnrollmentChanged(int? enrollmentId) {
    final item = _enrollments
        ?.where((item) => item.enrollment.id == enrollmentId)
        .firstOrNull;
    if (item == null) return;
    setState(() => _applyEnrollment(item));
    _markChanged();
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(_date.year - 1),
      lastDate: DateTime(_date.year + 2),
    );
    if (date == null) return;
    setState(() => _date = date);
    _markChanged();
  }

  Future<void> _pickTime() async {
    final time = await showTimePicker(context: context, initialTime: _time);
    if (time == null) return;
    setState(() => _time = time);
    _markChanged();
  }

  Future<void> _save() async {
    final enrollmentId = _enrollmentId;
    if (!_formKey.currentState!.validate() || enrollmentId == null) return;

    final startsAt = DateTime(
      _date.year,
      _date.month,
      _date.day,
      _time.hour,
      _time.minute,
    );
    final duration = Duration(minutes: _durationMinutes);
    final price = Money.tryParse(_price.text)!;
    final topic = StudentValidator.optionalText(_topic.text);
    final note = StudentValidator.optionalText(_note.text);
    final controller = ref.read(lessonFormControllerProvider.notifier);

    final saved = switch (widget.existing) {
      final existing? => await controller.updateLesson(
        existing.lesson.copyWith(
          startsAt: startsAt,
          duration: duration,
          price: price,
          status: _status,
          topic: topic,
          note: note,
        ),
      ),
      null => await controller.createLesson(
        LessonDraft(
          enrollmentId: enrollmentId,
          startsAt: startsAt,
          duration: duration,
          price: price,
          topic: topic,
          note: note,
        ),
        _status,
      ),
    };
    if (!saved || !mounted) return;
    setState(() => _hasChanges = false);
    context.pop();
  }

  Future<void> _delete() async {
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
    final deleted = await ref
        .read(lessonFormControllerProvider.notifier)
        .deleteLesson(widget.existing!.lesson.id);
    if (!deleted || !mounted) return;
    setState(() => _hasChanges = false);
    context.pop();
    messenger.showInfo(l10n.lessonDeleted);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(lessonFormControllerProvider, (_, state) {
      if (state case AsyncError(:final error)) {
        showErrorSnackBar(context, error);
      }
    });
    final isSaving = ref.watch(lessonFormControllerProvider).isLoading;
    final durations = {..._durationOptions, _durationMinutes}.toList()..sort();
    final existing = widget.existing;

    return UnsavedChangesScope(
      hasChanges: _hasChanges,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _isEditing ? context.l10n.lessonTitle : context.l10n.lessonNewTitle,
          ),
          actions: [
            if (_isEditing)
              IconButton(
                tooltip: context.l10n.deleteLessonTooltip,
                icon: const Icon(Icons.delete_outline),
                onPressed: isSaving ? null : _delete,
              ),
          ],
        ),
        body: ContentWidth(
          maxWidth: 640,
          child: Form(
            key: _formKey,
            onChanged: _markChanged,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (existing != null)
                  InputDecorator(
                    decoration: InputDecoration(
                      labelText: context.l10n.studentAndSubject,
                    ),
                    child: Text(
                      '${existing.studentName} · ${existing.subjectName}',
                    ),
                  )
                else ...[
                  DropdownButtonFormField<int>(
                    isExpanded: true,
                    initialValue: _studentId,
                    decoration: InputDecoration(
                      labelText: context.l10n.commonStudentRequired,
                    ),
                    items: [
                      for (final student in widget.students)
                        DropdownMenuItem(
                          value: student.id,
                          child: Text(student.fullName),
                        ),
                    ],
                    onChanged: _onStudentChanged,
                    validator: (value) =>
                        value == null ? context.l10n.commonSelectStudent : null,
                  ),
                  const SizedBox(height: 16),
                  _enrollmentField(),
                ],
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: PickerField(
                        label: context.l10n.commonDate,
                        value: Formatters.date(_date),
                        icon: Icons.calendar_today_outlined,
                        onTap: _pickDate,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: PickerField(
                        label: context.l10n.commonTime,
                        value: _time.format(context),
                        icon: Icons.schedule,
                        onTap: _pickTime,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<int>(
                        isExpanded: true,
                        key: ValueKey('duration-$_fieldsGeneration'),
                        initialValue: _durationMinutes,
                        decoration: InputDecoration(
                          labelText: context.l10n.commonDuration,
                        ),
                        items: [
                          for (final minutes in durations)
                            DropdownMenuItem(
                              value: minutes,
                              child: Text(
                                context.l10n.duration(
                                  Duration(minutes: minutes),
                                ),
                              ),
                            ),
                        ],
                        onChanged: (minutes) {
                          if (minutes != null) _durationMinutes = minutes;
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: _price,
                        decoration: InputDecoration(
                          labelText: context.l10n.priceRequired,
                          suffixText: '₽',
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        validator: localizedValidator(
                          context,
                          StudentValidator.rate,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<LessonStatus>(
                  isExpanded: true,
                  initialValue: _status,
                  decoration: InputDecoration(
                    labelText: context.l10n.statusLabel,
                    helperText: _statusHint(existing),
                  ),
                  items: [
                    for (final status in LessonStatus.values)
                      DropdownMenuItem(
                        value: status,
                        child: Row(
                          children: [
                            Icon(
                              status.icon,
                              size: 20,
                              color: status.color(context),
                            ),
                            const SizedBox(width: 8),
                            Text(status.label(context.l10n)),
                          ],
                        ),
                      ),
                  ],
                  onChanged: (status) {
                    if (status != null) setState(() => _status = status);
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _topic,
                  decoration: InputDecoration(
                    labelText: context.l10n.commonTopic,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _note,
                  decoration: InputDecoration(
                    labelText: context.l10n.lessonNote,
                    hintText: context.l10n.lessonNoteHint,
                    alignLabelWithHint: true,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  minLines: 2,
                  maxLines: 5,
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
                        : context.l10n.createLesson,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _statusHint(LessonDetails? existing) {
    if (!_status.isBillable) return context.l10n.notBillable;
    final keepsPackage =
        existing != null &&
        existing.lesson.isPaidByPackage &&
        existing.lesson.status.isBillable;
    return keepsPackage
        ? context.l10n.paidFromPackage
        : context.l10n.billableFormHint;
  }

  Widget _enrollmentField() {
    final enrollments = _enrollments;
    final String? hint = switch (enrollments) {
      _ when _studentId == null => context.l10n.selectStudentFirst,
      null => context.l10n.commonLoading,
      [] => context.l10n.studentHasNoSubjects,
      _ => null,
    };
    return DropdownButtonFormField<int>(
      isExpanded: true,
      key: ValueKey(
        'enrollment-$_studentId-$_fieldsGeneration-${enrollments?.length}',
      ),
      initialValue: _enrollmentId,
      decoration: InputDecoration(
        labelText: context.l10n.commonSubjectRequired,
        helperText: hint,
        helperMaxLines: 2,
      ),
      items: [
        for (final item in enrollments ?? const <EnrollmentWithSubject>[])
          DropdownMenuItem(
            value: item.enrollment.id,
            child: Text(
              '${item.subject.name} · '
              '${Formatters.money(item.enrollment.rate)}',
            ),
          ),
      ],
      onChanged: (enrollments?.isNotEmpty ?? false)
          ? _onEnrollmentChanged
          : null,
      validator: (value) =>
          value == null ? context.l10n.commonSelectSubject : null,
    );
  }
}

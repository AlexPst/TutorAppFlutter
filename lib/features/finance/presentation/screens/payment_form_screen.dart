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
import 'package:tutor_app/features/finance/domain/models/payment.dart';
import 'package:tutor_app/features/finance/domain/models/payment_method.dart';
import 'package:tutor_app/features/finance/domain/payment_validator.dart';
import 'package:tutor_app/features/finance/presentation/controllers/payment_form_controller.dart';
import 'package:tutor_app/features/finance/presentation/payment_method_ui.dart';
import 'package:tutor_app/features/finance/presentation/providers/payment_form_providers.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Добавление платежа (без [paymentId]) или его редактирование.
/// [studentId] и [amount] предзаполняют новый платёж.
class PaymentFormScreen extends ConsumerWidget {
  const PaymentFormScreen({
    super.key,
    this.paymentId,
    this.studentId,
    this.amount,
  });

  final int? paymentId;
  final int? studentId;
  final Money? amount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = paymentId;
    if (id != null) {
      final existing = ref.watch(paymentForEditProvider(id));
      if (existing.value case final loaded?) {
        return _PaymentForm(
          existing: loaded.payment,
          existingStudentName: loaded.studentName,
          students: const [],
        );
      }
      return _Placeholder(
        title: context.l10n.paymentShort,
        value: existing,
        onRetry: () => ref.invalidate(paymentForEditProvider(id)),
        empty: EmptyState(
          icon: Icons.money_off_outlined,
          title: context.l10n.failurePaymentNotFound,
          message: context.l10n.commonNotFoundMaybeDeleted,
        ),
      );
    }

    final students = ref.watch(paymentFormStudentsProvider);
    if (students.value case final list? when list.isNotEmpty) {
      return _PaymentForm(
        students: list,
        initialStudentId: studentId,
        initialAmount: amount,
      );
    }
    return _Placeholder(
      title: context.l10n.paymentNewTitle,
      value: students,
      onRetry: () => ref.invalidate(paymentFormStudentsProvider),
      empty: EmptyState(
        icon: Icons.school_outlined,
        title: context.l10n.commonAddStudentFirst,
        actionLabel: context.l10n.commonAddStudent,
        onAction: () => context.go(AppRoutes.newStudent),
      ),
    );
  }
}

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

class _PaymentForm extends ConsumerStatefulWidget {
  const _PaymentForm({
    required this.students,
    this.existing,
    this.existingStudentName,
    this.initialStudentId,
    this.initialAmount,
  });

  final List<Student> students;
  final Payment? existing;
  final String? existingStudentName;
  final int? initialStudentId;
  final Money? initialAmount;

  @override
  ConsumerState<_PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends ConsumerState<_PaymentForm> {
  final _formKey = GlobalKey<FormState>();
  final _amount = TextEditingController();
  final _comment = TextEditingController();
  int? _studentId;
  late DateTime _paidAt;
  var _method = PaymentMethod.cardTransfer;
  var _hasChanges = false;

  bool get _isEditing => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final today = dateOnly(ref.read(clockProvider)());
    if (widget.existing case final payment?) {
      _studentId = payment.studentId;
      _amount.text = Formatters.moneyInput(payment.amount);
      _paidAt = payment.paidAt;
      _method = payment.method;
      _comment.text = payment.comment ?? '';
    } else {
      _paidAt = today;
      final initialStudent = widget.initialStudentId;
      if (widget.students.any((student) => student.id == initialStudent)) {
        _studentId = initialStudent;
      }
      if (widget.initialAmount case final amount? when amount.isPositive) {
        _amount.text = Formatters.moneyInput(amount);
      }
    }
  }

  @override
  void dispose() {
    _amount.dispose();
    _comment.dispose();
    super.dispose();
  }

  void _markChanged() {
    if (!_hasChanges) setState(() => _hasChanges = true);
  }

  Future<void> _pickDate() async {
    final today = dateOnly(ref.read(clockProvider)());
    final date = await showDatePicker(
      context: context,
      initialDate: _paidAt.isAfter(today) ? today : _paidAt,
      firstDate: DateTime(today.year - 2),
      lastDate: today,
    );
    if (date == null) return;
    setState(() => _paidAt = date);
    _markChanged();
  }

  Future<void> _save() async {
    final studentId = _studentId;
    if (!_formKey.currentState!.validate() || studentId == null) return;

    final messenger = ScaffoldMessenger.of(context);
    final amount = Money.tryParse(_amount.text)!;
    final savedMessage = context.l10n.paymentSaved(Formatters.money(amount));
    final controller = ref.read(paymentFormControllerProvider.notifier);
    final saved = switch (widget.existing) {
      final payment? => await controller.updatePayment(
        payment.copyWith(
          amount: amount,
          paidAt: _paidAt,
          method: _method,
          comment: _comment.text,
        ),
      ),
      null => await controller.createPayment(
        PaymentDraft(
          studentId: studentId,
          amount: amount,
          paidAt: _paidAt,
          method: _method,
          comment: _comment.text,
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
      title: l10n.deletePaymentTitle,
      message: l10n.deletePaymentMessage,
      confirmLabel: l10n.commonDelete,
      destructive: true,
    );
    if (!confirmed) return;
    final deleted = await ref
        .read(paymentFormControllerProvider.notifier)
        .deletePayment(widget.existing!.id);
    if (!deleted || !mounted) return;
    setState(() => _hasChanges = false);
    context.pop();
    messenger.showInfo(l10n.paymentDeleted);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(paymentFormControllerProvider, (_, state) {
      if (state case AsyncError(:final error)) {
        showErrorSnackBar(context, error);
      }
    });
    final isSaving = ref.watch(paymentFormControllerProvider).isLoading;

    return UnsavedChangesScope(
      hasChanges: _hasChanges,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _isEditing
                ? context.l10n.paymentShort
                : context.l10n.paymentNewTitle,
          ),
          actions: [
            if (_isEditing)
              IconButton(
                tooltip: context.l10n.deletePaymentTooltip,
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
                if (_isEditing)
                  InputDecorator(
                    decoration: InputDecoration(
                      labelText: context.l10n.commonStudent,
                    ),
                    child: Text(widget.existingStudentName ?? ''),
                  )
                else
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
                    onChanged: (studentId) {
                      setState(() => _studentId = studentId);
                      _markChanged();
                    },
                    validator: (value) =>
                        value == null ? context.l10n.commonSelectStudent : null,
                  ),
                if (_studentId case final studentId? when !_isEditing)
                  _BalanceHint(
                    studentId: studentId,
                    onPayDebt: (debt) {
                      _amount.text = Formatters.moneyInput(debt);
                      _markChanged();
                    },
                  ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _amount,
                  autofocus: _studentId != null && !_isEditing,
                  decoration: InputDecoration(
                    labelText: context.l10n.amountRequiredLabel,
                    suffixText: '₽',
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  validator: localizedValidator(
                    context,
                    PaymentValidator.amount,
                  ),
                ),
                const SizedBox(height: 16),
                PickerField(
                  label: context.l10n.paymentDate,
                  value: Formatters.date(_paidAt),
                  icon: Icons.calendar_today_outlined,
                  onTap: _pickDate,
                ),
                const SizedBox(height: 16),
                Text(
                  context.l10n.paymentMethod,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                SegmentedButton<PaymentMethod>(
                  showSelectedIcon: false,
                  segments: [
                    for (final method in PaymentMethod.values)
                      ButtonSegment(
                        value: method,
                        label: Text(method.label(context.l10n)),
                      ),
                  ],
                  selected: {_method},
                  onSelectionChanged: (selection) {
                    setState(() => _method = selection.single);
                    _markChanged();
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _comment,
                  decoration: InputDecoration(
                    labelText: context.l10n.comment,
                    hintText: context.l10n.paymentCommentHint,
                  ),
                  textCapitalization: TextCapitalization.sentences,
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
                        : context.l10n.addPayment,
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

/// Подсказка под учеником: текущий долг (с кнопкой «Вся сумма») или аванс.
class _BalanceHint extends ConsumerWidget {
  const _BalanceHint({required this.studentId, required this.onPayDebt});

  final int studentId;
  final ValueChanged<Money> onPayDebt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(paymentFormBalanceProvider(studentId)).value;
    if (balance == null || balance.balance.isZero) {
      return const SizedBox.shrink();
    }
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              balance.hasDebt
                  ? context.l10n.balanceDebt(Formatters.money(balance.debt))
                  : context.l10n.balanceAdvance(
                      Formatters.money(balance.balance),
                    ),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          if (balance.hasDebt)
            ActionChip(
              label: Text(context.l10n.payWholeDebt),
              onPressed: () => onPayDebt(balance.debt),
            ),
        ],
      ),
    );
  }
}

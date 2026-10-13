import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/app/theme/finance_colors.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/core/widgets/messages.dart';
import 'package:tutor_app/features/finance/presentation/widgets/debt_reminder_dialog.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';
import 'package:tutor_app/features/students/presentation/controllers/student_actions_controller.dart';
import 'package:tutor_app/features/students/presentation/providers/student_details_providers.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Верх карточки ученика: архив, контакты, баланс и предметы со ставками.
class StudentHeader extends StatelessWidget {
  const StudentHeader({super.key, required this.student});

  final Student student;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (student.isArchived) ...[
          _ArchivedBanner(studentId: student.id),
          const SizedBox(height: 12),
        ],
        _Contacts(student: student),
        const SizedBox(height: 12),
        _BalanceCard(studentId: student.id),
        const SizedBox(height: 12),
        _EnrollmentsCard(studentId: student.id),
      ],
    ),
  );
}

class _ArchivedBanner extends ConsumerWidget {
  const _ArchivedBanner({required this.studentId});

  final int studentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      color: colorScheme.secondaryContainer,
      child: ListTile(
        leading: const Icon(Icons.inventory_2_outlined),
        title: Text(context.l10n.studentArchivedBanner),
        trailing: TextButton(
          onPressed: () => ref
              .read(studentActionsControllerProvider(studentId).notifier)
              .setArchived(archived: false),
          child: Text(context.l10n.restore),
        ),
      ),
    );
  }
}

class _Contacts extends StatelessWidget {
  const _Contacts({required this.student});

  final Student student;

  Future<void> _copy(BuildContext context, String value) async {
    await Clipboard.setData(ClipboardData(text: value));
    if (context.mounted) {
      showInfoSnackBar(context, context.l10n.commonCopiedValue(value));
    }
  }

  @override
  Widget build(BuildContext context) {
    final contacts = [
      if (student.phone case final phone?) (Icons.phone_outlined, phone),
      if (student.telegram case final telegram?)
        (Icons.send_outlined, telegram),
    ];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final (icon, value) in contacts)
          ActionChip(
            avatar: Icon(icon, size: 18),
            label: Text(value),
            tooltip: context.l10n.commonCopyTooltip,
            onPressed: () => _copy(context, value),
          ),
        if (contacts.isEmpty)
          ActionChip(
            avatar: const Icon(Icons.add, size: 18),
            label: Text(context.l10n.addContacts),
            onPressed: () => context.go(AppRoutes.editStudent(student.id)),
          ),
      ],
    );
  }
}

class _BalanceCard extends ConsumerWidget {
  const _BalanceCard({required this.studentId});

  final int studentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balanceValue = ref.watch(studentBalanceProvider(studentId));
    final theme = Theme.of(context);
    final colors = FinanceColors.of(context);

    final Widget content;
    if (balanceValue.value case final balance?) {
      final (title, color) = switch (balance.balance) {
        final amount when amount.isNegative => (
          context.l10n.balanceDebt(Formatters.money(amount.abs())),
          colors.debt,
        ),
        final amount when amount.isPositive => (
          context.l10n.balanceAdvance(Formatters.money(amount)),
          colors.advance,
        ),
        _ => (context.l10n.balanceNoDebt, theme.colorScheme.onSurface),
      };
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.headlineSmall?.copyWith(color: color),
                ),
              ),
              if (balance.hasDebt)
                TextButton.icon(
                  onPressed: () => showDebtReminderDialog(context, balance),
                  icon: const Icon(Icons.sms_outlined),
                  label: Text(context.l10n.remind),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            context.l10n.balanceChargedPaid(
              Formatters.money(balance.charged),
              Formatters.money(balance.paid),
            ),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      );
    } else if (balanceValue.hasError) {
      content = Text(errorMessage(context, balanceValue.error!));
    } else {
      content = const LinearProgressIndicator();
    }

    return Card.filled(
      child: Padding(padding: const EdgeInsets.all(16), child: content),
    );
  }
}

class _EnrollmentsCard extends ConsumerWidget {
  const _EnrollmentsCard({required this.studentId});

  final int studentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final enrollmentsValue = ref.watch(studentEnrollmentsProvider(studentId));
    final enrollments = enrollmentsValue.value;

    return Card.outlined(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 8, 0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    context.l10n.subjectsTitle,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                TextButton.icon(
                  onPressed: () =>
                      context.go(AppRoutes.newEnrollment(studentId)),
                  icon: const Icon(Icons.add),
                  label: Text(context.l10n.commonAdd),
                ),
              ],
            ),
          ),
          if (enrollments == null && enrollmentsValue.hasError)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(errorMessage(context, enrollmentsValue.error!)),
            )
          else if (enrollments == null)
            const Padding(
              padding: EdgeInsets.all(16),
              child: LinearProgressIndicator(),
            )
          else if (enrollments.isEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                context.l10n.subjectsEmptyHint,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            )
          else
            for (final item in enrollments)
              Opacity(
                opacity: item.enrollment.isArchived ? 0.6 : 1,
                child: ListTile(
                  title: Text(
                    item.enrollment.isArchived
                        ? context.l10n.subjectArchived(item.subject.name)
                        : item.subject.name,
                  ),
                  subtitle: Text(
                    context.l10n.rateForDuration(
                      Formatters.money(item.enrollment.rate),
                      context.l10n.duration(item.enrollment.defaultDuration),
                    ),
                  ),
                  trailing: const Icon(Icons.edit_outlined),
                  onTap: () => context.go(
                    AppRoutes.editEnrollment(studentId, item.enrollment.id),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/app/theme/finance_colors.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/core/widgets/async_value_view.dart';
import 'package:tutor_app/core/widgets/balance_badge.dart';
import 'package:tutor_app/core/widgets/empty_state.dart';
import 'package:tutor_app/features/finance/domain/models/finance_summary.dart';
import 'package:tutor_app/features/finance/domain/models/student_balance.dart';
import 'package:tutor_app/features/finance/presentation/providers/finance_screen_providers.dart';
import 'package:tutor_app/features/finance/presentation/widgets/debt_reminder_dialog.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Ученики с долгом, по убыванию суммы, с кнопками «Напомнить»
/// и «Внести оплату».
class DebtorsTab extends ConsumerWidget {
  const DebtorsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(financeSummaryProvider).value;
    return AsyncValueView(
      value: ref.watch(debtorsProvider),
      onRetry: () => ref.invalidate(debtorsProvider),
      data: (debtors) => debtors.isEmpty
          ? EmptyState(
              icon: Icons.verified_outlined,
              title: context.l10n.noDebtorsTitle,
              message: context.l10n.noDebtorsMessage,
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 88),
              children: [
                if (summary != null) _SummaryCard(summary: summary),
                for (final debtor in debtors) ...[
                  const SizedBox(height: 12),
                  _DebtorCard(key: ValueKey(debtor.studentId), balance: debtor),
                ],
              ],
            ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.summary});

  final FinanceSummary summary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = summary.debtorsCount;
    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.l10n.totalDebt, style: theme.textTheme.labelLarge),
            Text(
              Formatters.money(summary.totalDebt),
              style: theme.textTheme.headlineSmall?.copyWith(
                color: FinanceColors.of(context).debt,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              summary.totalAdvance.isPositive
                  ? context.l10n.debtorsWithAdvances(
                      context.l10n.studentsCount(count),
                      Formatters.money(summary.totalAdvance),
                    )
                  : context.l10n.studentsCount(count),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DebtorCard extends StatelessWidget {
  const _DebtorCard({super.key, required this.balance});

  final StudentBalance balance;

  @override
  Widget build(BuildContext context) {
    final lastPayment = balance.lastPaymentAt;
    return Card.outlined(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: Text(balance.studentName),
            subtitle: Text(
              lastPayment == null
                  ? context.l10n.lastPaymentNone
                  : context.l10n.lastPayment(Formatters.date(lastPayment)),
            ),
            trailing: BalanceBadge(balance: balance.balance),
            onTap: () => context.go(AppRoutes.student(balance.studentId)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Wrap(
              spacing: 8,
              children: [
                TextButton.icon(
                  onPressed: () => showDebtReminderDialog(context, balance),
                  icon: const Icon(Icons.sms_outlined),
                  label: Text(context.l10n.remind),
                ),
                TextButton.icon(
                  onPressed: () => context.push(
                    AppRoutes.newPayment(
                      studentId: balance.studentId,
                      amount: balance.debt,
                    ),
                  ),
                  icon: const Icon(Icons.add),
                  label: Text(context.l10n.recordPayment),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

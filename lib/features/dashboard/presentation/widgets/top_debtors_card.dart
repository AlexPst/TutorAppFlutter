import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/core/widgets/balance_badge.dart';
import 'package:tutor_app/features/dashboard/presentation/providers/dashboard_screen_providers.dart';
import 'package:tutor_app/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:tutor_app/features/finance/presentation/widgets/debt_reminder_dialog.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Три самых крупных долга с кнопкой «Напомнить».
class TopDebtorsCard extends ConsumerWidget {
  const TopDebtorsCard({super.key});

  static const _maxVisible = 3;

  @override
  Widget build(BuildContext context, WidgetRef ref) => DashboardSection(
    title: context.l10n.financeTabDebtors,
    actionLabel: context.l10n.allDebtors,
    onAction: () => context.go(AppRoutes.financeTab('debtors')),
    child: SectionAsync(
      value: ref.watch(dashboardDebtorsProvider),
      data: (debtors) {
        if (debtors.isEmpty) {
          return SectionHint(context.l10n.noDebtsHint);
        }
        final hidden = debtors.length - _maxVisible;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final debtor in debtors.take(_maxVisible))
              ListTile(
                key: ValueKey(debtor.studentId),
                contentPadding: EdgeInsets.zero,
                title: Text(debtor.studentName),
                subtitle: Text(
                  debtor.lastPaymentAt == null
                      ? context.l10n.lastPaymentNone
                      : context.l10n.lastPayment(
                          Formatters.date(debtor.lastPaymentAt!),
                        ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BalanceBadge(balance: debtor.balance),
                    IconButton(
                      tooltip: context.l10n.remind,
                      icon: const Icon(Icons.sms_outlined),
                      onPressed: () => showDebtReminderDialog(context, debtor),
                    ),
                  ],
                ),
                onTap: () => context.go(AppRoutes.student(debtor.studentId)),
              ),
            if (hidden > 0)
              Text(
                context.l10n.andMore(context.l10n.studentsCount(hidden)),
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ],
        );
      },
    ),
  );
}

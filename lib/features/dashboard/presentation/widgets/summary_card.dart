import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/app/theme/finance_colors.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/core/providers/clock_provider.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/features/dashboard/presentation/providers/dashboard_screen_providers.dart';
import 'package:tutor_app/features/dashboard/presentation/widgets/dashboard_section.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Сводка: активные ученики, доход за текущий месяц, общий долг.
class SummaryCard extends ConsumerWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final month = Formatters.monthTitle(ref.watch(clockProvider)());
    final debtors = ref.watch(dashboardDebtorsProvider);
    return DashboardSection(
      title: context.l10n.summaryTitle,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Три плитки в ряд на широком экране, на узком — столбиком.
          final tiles = [
            SectionAsync(
              value: ref.watch(activeStudentsCountProvider),
              data: (count) => _StatTile(
                icon: Icons.people_outline,
                label: context.l10n.activeStudents,
                value: '$count',
                onTap: () => context.go(AppRoutes.students),
              ),
            ),
            SectionAsync(
              value: ref.watch(currentMonthStatsProvider),
              data: (stats) => _StatTile(
                icon: Icons.account_balance_wallet_outlined,
                label: context.l10n.receivedInMonth(month),
                value: Formatters.money(stats.received),
                caption: context.l10n.monthCaption(
                  Formatters.money(stats.charged),
                  stats.completedLessons,
                ),
                onTap: () => context.go(AppRoutes.financeTab('income')),
              ),
            ),
            SectionAsync(
              value: debtors.whenData(
                (list) => list.fold(Money.zero, (sum, b) => sum + b.debt),
              ),
              data: (totalDebt) => _StatTile(
                icon: Icons.warning_amber_outlined,
                label: context.l10n.totalDebt,
                value: Formatters.money(totalDebt),
                valueColor: totalDebt.isPositive
                    ? FinanceColors.of(context).debt
                    : null,
                onTap: () => context.go(AppRoutes.financeTab('debtors')),
              ),
            ),
          ];
          if (constraints.maxWidth >= 560) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [for (final tile in tiles) Expanded(child: tile)],
            );
          }
          return Column(children: tiles);
        },
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
    this.caption,
    this.valueColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final String? caption;
  final Color? valueColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: theme.colorScheme.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: theme.textTheme.labelMedium),
                  Text(
                    value,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: valueColor,
                    ),
                  ),
                  if (caption != null)
                    Text(
                      caption!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/core/providers/clock_provider.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/core/widgets/async_value_view.dart';
import 'package:tutor_app/core/widgets/period_switcher.dart';
import 'package:tutor_app/features/finance/domain/models/income_report.dart';
import 'package:tutor_app/features/finance/presentation/providers/finance_screen_providers.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Отчёт о доходах за день, неделю или месяц.
class IncomeTab extends ConsumerWidget {
  const IncomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selection = ref.watch(incomePeriodControllerProvider);
    final controller = ref.read(incomePeriodControllerProvider.notifier);
    final period = selection.kind.around(selection.date);

    return Column(
      children: [
        PeriodSwitcher(
          kind: selection.kind,
          date: selection.date,
          today: dateOnly(ref.watch(clockProvider)()),
          onKindChanged: (kind) {
            if (kind != null) controller.setKind(kind);
          },
          onDateChanged: controller.setDate,
        ),
        Expanded(
          child: AsyncValueView(
            value: ref.watch(incomeReportProvider(period)),
            onRetry: () => ref.invalidate(incomeReportProvider(period)),
            data: (report) => ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 88),
              children: [
                _Totals(report: report),
                const SizedBox(height: 16),
                if (report.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      context.l10n.incomeEmpty,
                      textAlign: TextAlign.center,
                    ),
                  )
                else ...[
                  Text(
                    context.l10n.byStudents,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  for (final income in report.students)
                    _StudentIncomeTile(income: income),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Totals extends StatelessWidget {
  const _Totals({required this.report});

  final IncomeReport report;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lessons = report.completedLessons;

    Widget metric(String label, Money amount) => Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: theme.textTheme.labelLarge),
          Text(Formatters.money(amount), style: theme.textTheme.headlineSmall),
        ],
      ),
    );

    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                metric(context.l10n.incomeReceived, report.received),
                metric(context.l10n.incomeCharged, report.charged),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              context.l10n.incomeBreakdown(
                Formatters.money(report.lessonsCharged),
                Formatters.money(report.packagesSold),
              ),
            ),
            Text(
              lessons > 0
                  ? context.l10n.incomeCompletedWithDuration(
                      context.l10n.lessonsCount(lessons),
                      context.l10n.duration(report.completedDuration),
                    )
                  : context.l10n.incomeCompleted(
                      context.l10n.lessonsCount(lessons),
                    ),
            ),
            const SizedBox(height: 8),
            Text(
              context.l10n.incomeExplanation,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StudentIncomeTile extends StatelessWidget {
  const _StudentIncomeTile({required this.income});

  final StudentIncome income;

  @override
  Widget build(BuildContext context) {
    final lessons = income.completedLessons;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(income.studentName),
      subtitle: Text(
        context.l10n.studentIncomeSubtitle(
          Formatters.money(income.charged),
          context.l10n.lessonsCount(lessons),
        ),
      ),
      trailing: Text(
        Formatters.money(income.received),
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}

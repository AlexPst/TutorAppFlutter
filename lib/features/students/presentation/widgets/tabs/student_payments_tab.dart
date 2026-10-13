import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/core/widgets/balance_badge.dart';
import 'package:tutor_app/core/widgets/empty_state.dart';
import 'package:tutor_app/features/finance/domain/models/lesson_package.dart';
import 'package:tutor_app/features/finance/domain/models/payment.dart';
import 'package:tutor_app/features/finance/domain/models/student_balance.dart';
import 'package:tutor_app/features/finance/presentation/widgets/debt_reminder_dialog.dart';
import 'package:tutor_app/features/finance/presentation/widgets/payment_tile.dart';
import 'package:tutor_app/features/students/domain/models/enrollment_with_subject.dart';
import 'package:tutor_app/features/students/presentation/providers/student_details_providers.dart';
import 'package:tutor_app/features/students/presentation/widgets/tabs/student_tab_view.dart';
import 'package:tutor_app/l10n/l10n.dart';

class StudentPaymentsTab extends ConsumerWidget {
  const StudentPaymentsTab({super.key, required this.studentId});

  final int studentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packages =
        ref.watch(studentPackagesProvider(studentId)).value ?? const [];
    final balance = ref.watch(studentBalanceProvider(studentId)).value;
    final enrollments =
        ref.watch(studentEnrollmentsProvider(studentId)).value ??
        const <EnrollmentWithSubject>[];
    final subjectNames = {
      for (final item in enrollments) item.enrollment.id: item.subject.name,
    };

    return StudentTabView<List<PaymentDetails>>(
      storageKey: 'payments',
      value: ref.watch(studentPaymentsProvider(studentId)),
      onRetry: () => ref.invalidate(studentPaymentsProvider(studentId)),
      isEmpty: (payments) =>
          payments.isEmpty &&
          packages.isEmpty &&
          (balance == null || balance.charged.isZero),
      empty: EmptyState(
        icon: Icons.payments_outlined,
        title: context.l10n.studentPaymentsEmptyTitle,
        message: context.l10n.studentPaymentsEmptyMessage,
        actionLabel: context.l10n.addPayment,
        onAction: () =>
            context.push(AppRoutes.newPayment(studentId: studentId)),
      ),
      slivers: (payments) => [
        SliverToBoxAdapter(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilledButton.tonalIcon(
                onPressed: () => context.push(
                  AppRoutes.newPayment(
                    studentId: studentId,
                    amount: balance?.debt,
                  ),
                ),
                icon: const Icon(Icons.add),
                label: Text(context.l10n.paymentShort),
              ),
              if (balance != null && balance.hasDebt)
                OutlinedButton.icon(
                  onPressed: () => showDebtReminderDialog(context, balance),
                  icon: const Icon(Icons.sms_outlined),
                  label: Text(context.l10n.remind),
                ),
            ],
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        if (balance != null)
          SliverToBoxAdapter(child: _BalanceBreakdown(balance: balance)),
        if (packages.isNotEmpty) ...[
          TabSectionTitle(context.l10n.packagesSection),
          SliverList.list(
            children: [
              for (final package in packages)
                _PackageTile(
                  package: package,
                  subjectName: subjectNames[package.package.enrollmentId],
                ),
            ],
          ),
        ],
        TabSectionTitle(context.l10n.paymentsSection),
        if (payments.isEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(context.l10n.noPaymentsYet),
            ),
          )
        else
          SliverList.separated(
            itemCount: payments.length,
            itemBuilder: (context, index) => PaymentTile(
              key: ValueKey(payments[index].payment.id),
              payment: payments[index].payment,
              contentPadding: const EdgeInsets.symmetric(horizontal: 4),
            ),
            separatorBuilder: (_, _) => const Divider(height: 1),
          ),
      ],
    );
  }
}

class _BalanceBreakdown extends StatelessWidget {
  const _BalanceBreakdown({required this.balance});

  final StudentBalance balance;

  @override
  Widget build(BuildContext context) {
    Widget row(String label, Money amount) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(Formatters.money(amount)),
        ],
      ),
    );

    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            row(
              context.l10n.balanceLessonsOutsidePackages,
              balance.lessonsCharged,
            ),
            row(context.l10n.packagesSection, balance.packagesCharged),
            row(context.l10n.balancePaid, balance.paid),
            const Divider(height: 24),
            Row(
              children: [
                Expanded(
                  child: Text(
                    context.l10n.balanceTitle,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                if (balance.balance.isZero)
                  const Text('0 ₽')
                else
                  BalanceBadge(balance: balance.balance),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PackageTile extends StatelessWidget {
  const _PackageTile({required this.package, required this.subjectName});

  final PackageWithUsage package;
  final String? subjectName;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final count = package.package.lessonsCount;
    final usage = package.isExhausted
        ? l10n.packageUsedUp
        : l10n.packageRemaining(package.remainingLessons, count);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
      leading: const Icon(Icons.inventory_outlined),
      title: Text([l10n.lessonsCount(count), ?subjectName].join(' · ')),
      subtitle: Text(
        l10n.packageUsageSince(
          usage,
          Formatters.date(package.package.purchasedAt),
        ),
      ),
      trailing: Text(Formatters.money(package.package.price)),
    );
  }
}

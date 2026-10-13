import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/core/providers/clock_provider.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/core/widgets/async_value_view.dart';
import 'package:tutor_app/core/widgets/empty_state.dart';
import 'package:tutor_app/core/widgets/period_switcher.dart';
import 'package:tutor_app/features/finance/domain/models/payment.dart';
import 'package:tutor_app/features/finance/domain/models/student_balance.dart';
import 'package:tutor_app/features/finance/presentation/providers/finance_screen_providers.dart';
import 'package:tutor_app/features/finance/presentation/widgets/payment_tile.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Список платежей с фильтром по ученику и периоду.
class PaymentsTab extends ConsumerWidget {
  const PaymentsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(paymentsFilterControllerProvider);
    final controller = ref.read(paymentsFilterControllerProvider.notifier);
    final students =
        ref.watch(allBalancesProvider).value ?? const <StudentBalance>[];
    final selectedName = students
        .where((student) => student.studentId == filter.studentId)
        .firstOrNull
        ?.studentName;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: InputChip(
              avatar: const Icon(Icons.person_outline, size: 18),
              label: Text(selectedName ?? context.l10n.allStudents),
              selected: filter.studentId != null,
              showCheckmark: false,
              onPressed: () async {
                final picked = await _pickStudent(context, students);
                if (picked != null) controller.setStudent(picked.studentId);
              },
              onDeleted: filter.studentId == null
                  ? null
                  : () => controller.setStudent(null),
              deleteButtonTooltipMessage: context.l10n.allStudents,
            ),
          ),
        ),
        PeriodSwitcher(
          kind: filter.kind,
          date: filter.date,
          today: dateOnly(ref.watch(clockProvider)()),
          allowAllTime: true,
          onKindChanged: controller.setKind,
          onDateChanged: controller.setDate,
        ),
        Expanded(
          child: AsyncValueView(
            value: ref.watch(filteredPaymentsProvider),
            onRetry: () => ref.invalidate(filteredPaymentsProvider),
            data: (payments) => payments.isEmpty
                ? EmptyState(
                    icon: Icons.payments_outlined,
                    title: context.l10n.noPaymentsTitle,
                    message: context.l10n.noPaymentsMessage,
                  )
                : _PaymentsList(payments: payments),
          ),
        ),
      ],
    );
  }

  /// Возвращает выбор в обёртке, чтобы отличить «Все ученики» (`null`
  /// внутри) от закрытия листа без выбора (`null` снаружи).
  static Future<({int? studentId})?> _pickStudent(
    BuildContext context,
    List<StudentBalance> students,
  ) {
    final sorted = [...students]
      ..sort(
        (a, b) =>
            a.studentName.toLowerCase().compareTo(b.studentName.toLowerCase()),
      );
    return showModalBottomSheet<({int? studentId})>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              leading: const Icon(Icons.people_outline),
              title: Text(context.l10n.allStudents),
              onTap: () => Navigator.of(context).pop((studentId: null)),
            ),
            for (final student in sorted)
              ListTile(
                title: Text(student.studentName),
                subtitle: student.isArchived
                    ? Text(context.l10n.archivedSwitch)
                    : null,
                onTap: () =>
                    Navigator.of(context).pop((studentId: student.studentId)),
              ),
          ],
        ),
      ),
    );
  }
}

class _PaymentsList extends StatelessWidget {
  const _PaymentsList({required this.payments});

  final List<PaymentDetails> payments;

  @override
  Widget build(BuildContext context) {
    final total = payments.fold(
      Money.zero,
      (sum, details) => sum + details.payment.amount,
    );
    final count = payments.length;
    return ListView(
      padding: const EdgeInsets.only(bottom: 88),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
          child: Text(
            context.l10n.paymentsTotal(
              Formatters.money(total),
              context.l10n.paymentsCount(count),
            ),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        for (final details in payments)
          PaymentTile(
            key: ValueKey(details.payment.id),
            payment: details.payment,
            studentName: details.studentName,
          ),
      ],
    );
  }
}

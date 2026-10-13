import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/finance/domain/models/student_balance.dart';

/// Итоги по всем ученикам: сколько должны, сколько внесено авансом.
///
/// Долги и авансы считаются отдельно, а не взаимозачётом: аванс одного
/// ученика не уменьшает долг другого.
final class FinanceSummary {
  FinanceSummary.fromBalances(Iterable<StudentBalance> balances)
    : this._(balances.toList(growable: false));

  FinanceSummary._(List<StudentBalance> balances)
    : totalDebt = balances.fold(Money.zero, (sum, b) => sum + b.debt),
      totalAdvance = balances.fold(
        Money.zero,
        (sum, b) => b.balance.isPositive ? sum + b.balance : sum,
      ),
      totalCharged = balances.fold(Money.zero, (sum, b) => sum + b.charged),
      totalPaid = balances.fold(Money.zero, (sum, b) => sum + b.paid),
      debtorsCount = balances.where((b) => b.hasDebt).length;

  final Money totalDebt;
  final Money totalAdvance;
  final Money totalCharged;
  final Money totalPaid;
  final int debtorsCount;
}

import 'package:flutter/material.dart';
import 'package:tutor_app/app/theme/finance_colors.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Индикатор баланса: «Долг 1 500 ₽» на красной плашке, аванс зелёным
/// текстом, при нулевом балансе ничего не показывает.
class BalanceBadge extends StatelessWidget {
  const BalanceBadge({super.key, required this.balance});

  /// Оплачено минус начислено.
  final Money balance;

  @override
  Widget build(BuildContext context) {
    final colors = FinanceColors.of(context);
    final textTheme = Theme.of(context).textTheme;

    if (balance.isNegative) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: colors.debtContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          context.l10n.balanceDebt(Formatters.money(balance.abs())),
          style: textTheme.labelMedium?.copyWith(
            color: colors.onDebtContainer,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }
    if (balance.isPositive) {
      return Text(
        '+${Formatters.money(balance)}',
        style: textTheme.labelMedium?.copyWith(color: colors.advance),
      );
    }
    return const SizedBox.shrink();
  }
}

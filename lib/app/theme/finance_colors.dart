import 'package:flutter/material.dart';

/// Цвета денежных состояний: долг и аванс. В Material 3 нет «успешного»
/// цвета, поэтому они заданы расширением темы.
@immutable
class FinanceColors extends ThemeExtension<FinanceColors> {
  const FinanceColors({
    required this.debt,
    required this.onDebtContainer,
    required this.debtContainer,
    required this.advance,
  });

  static const light = FinanceColors(
    debt: Color(0xFFB3261E),
    debtContainer: Color(0xFFF9DEDC),
    onDebtContainer: Color(0xFF410E0B),
    advance: Color(0xFF2E7D32),
  );

  static const dark = FinanceColors(
    debt: Color(0xFFF2B8B5),
    debtContainer: Color(0xFF8C1D18),
    onDebtContainer: Color(0xFFF9DEDC),
    advance: Color(0xFF81C784),
  );

  final Color debt;
  final Color debtContainer;
  final Color onDebtContainer;
  final Color advance;

  static FinanceColors of(BuildContext context) =>
      Theme.of(context).extension<FinanceColors>() ?? light;

  @override
  FinanceColors copyWith({
    Color? debt,
    Color? debtContainer,
    Color? onDebtContainer,
    Color? advance,
  }) => FinanceColors(
    debt: debt ?? this.debt,
    debtContainer: debtContainer ?? this.debtContainer,
    onDebtContainer: onDebtContainer ?? this.onDebtContainer,
    advance: advance ?? this.advance,
  );

  @override
  FinanceColors lerp(FinanceColors? other, double t) {
    if (other == null) return this;
    return FinanceColors(
      debt: Color.lerp(debt, other.debt, t)!,
      debtContainer: Color.lerp(debtContainer, other.debtContainer, t)!,
      onDebtContainer: Color.lerp(onDebtContainer, other.onDebtContainer, t)!,
      advance: Color.lerp(advance, other.advance, t)!,
    );
  }
}

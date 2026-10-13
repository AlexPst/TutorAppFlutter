import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/core/domain/field_error.dart';
import 'package:tutor_app/core/domain/money.dart';

/// Правила платежа. Проверка поля формы возвращает [FieldError] или `null`;
/// `ensureValid` бросает `ValidationFailure`.
abstract final class PaymentValidator {
  static const maxAmount = Money.rubles(1000000);

  static FieldError? amount(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return FieldError.amountRequired;
    final amount = Money.tryParse(text);
    if (amount == null) return FieldError.moneyFormat;
    if (!amount.isPositive) return FieldError.amountNotPositive;
    if (amount > maxAmount) return FieldError.amountTooLarge;
    return null;
  }

  static void ensureValid({
    required Money amount,
    required DateTime paidAt,
    required DateTime now,
  }) {
    if (!amount.isPositive || amount > maxAmount) {
      throw const ValidationFailure(FailureReason.paymentAmountInvalid);
    }
    // Дата без времени: платёж «сегодня» допустим в любой час.
    final endOfToday = DateTime(now.year, now.month, now.day + 1);
    if (!paidAt.isBefore(endOfToday)) {
      throw const ValidationFailure(FailureReason.paymentDateInFuture);
    }
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/finance/domain/models/payment_method.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

/// Поступление денег от ученика. Не привязано к предмету: баланс ведётся
/// по ученику в целом.
///
/// Фабрика не `const`: проверка суммы обращается к полю [Money], а это
/// недопустимо в константном конструкторе.
@freezed
abstract class Payment with _$Payment {
  @Assert('amount.kopecks > 0', 'Payment amount must be positive')
  factory Payment({
    required int id,
    required int studentId,
    @MoneyConverter() required Money amount,
    required DateTime paidAt,
    @Default(PaymentMethod.cardTransfer) PaymentMethod method,
    String? comment,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}

/// Данные для создания платежа.
@freezed
abstract class PaymentDraft with _$PaymentDraft {
  @Assert('amount.kopecks > 0', 'Payment amount must be positive')
  factory PaymentDraft({
    required int studentId,
    required Money amount,
    required DateTime paidAt,
    @Default(PaymentMethod.cardTransfer) PaymentMethod method,
    String? comment,
  }) = _PaymentDraft;
}

/// Платёж вместе с именем ученика — для общей истории платежей.
@freezed
abstract class PaymentDetails with _$PaymentDetails {
  const factory PaymentDetails({
    required Payment payment,
    required String studentName,
  }) = _PaymentDetails;
}

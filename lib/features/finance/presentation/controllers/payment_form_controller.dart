import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/features/finance/domain/models/payment.dart';
import 'package:tutor_app/features/finance/finance_providers.dart';

part 'payment_form_controller.g.dart';

/// Сохранение и удаление платежа из формы. Методы возвращают `true`
/// при успехе; ошибка попадает в состояние и показывается экраном.
@riverpod
class PaymentFormController extends _$PaymentFormController {
  @override
  FutureOr<void> build() {}

  Future<bool> createPayment(PaymentDraft draft) =>
      _run(() => ref.read(savePaymentUseCaseProvider).create(draft));

  Future<bool> updatePayment(Payment payment) =>
      _run(() => ref.read(savePaymentUseCaseProvider).update(payment));

  Future<bool> deletePayment(int paymentId) =>
      _run(() => ref.read(paymentRepositoryProvider).deletePayment(paymentId));

  Future<bool> _run(Future<void> Function() action) async {
    state = const AsyncLoading();
    try {
      await action();
      if (ref.mounted) state = const AsyncData(null);
      return true;
    } on Object catch (error, stackTrace) {
      if (ref.mounted) state = AsyncError(error, stackTrace);
      return false;
    }
  }
}

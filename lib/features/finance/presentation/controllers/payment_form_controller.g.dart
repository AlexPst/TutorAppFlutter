// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Сохранение и удаление платежа из формы. Методы возвращают `true`
/// при успехе; ошибка попадает в состояние и показывается экраном.

@ProviderFor(PaymentFormController)
final paymentFormControllerProvider = PaymentFormControllerProvider._();

/// Сохранение и удаление платежа из формы. Методы возвращают `true`
/// при успехе; ошибка попадает в состояние и показывается экраном.
final class PaymentFormControllerProvider
    extends $AsyncNotifierProvider<PaymentFormController, void> {
  /// Сохранение и удаление платежа из формы. Методы возвращают `true`
  /// при успехе; ошибка попадает в состояние и показывается экраном.
  PaymentFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentFormControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentFormControllerHash();

  @$internal
  @override
  PaymentFormController create() => PaymentFormController();
}

String _$paymentFormControllerHash() =>
    r'9cb93d881beb53e68ed76a627dc3fecb2c8c9cd1';

/// Сохранение и удаление платежа из формы. Методы возвращают `true`
/// при успехе; ошибка попадает в состояние и показывается экраном.

abstract class _$PaymentFormController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

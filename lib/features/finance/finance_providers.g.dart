// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(paymentRepository)
final paymentRepositoryProvider = PaymentRepositoryProvider._();

final class PaymentRepositoryProvider
    extends
        $FunctionalProvider<
          PaymentRepository,
          PaymentRepository,
          PaymentRepository
        >
    with $Provider<PaymentRepository> {
  PaymentRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentRepositoryHash();

  @$internal
  @override
  $ProviderElement<PaymentRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PaymentRepository create(Ref ref) {
    return paymentRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaymentRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaymentRepository>(value),
    );
  }
}

String _$paymentRepositoryHash() => r'1251d4490008bdd5f07505e19df928b26f0e0089';

@ProviderFor(packageRepository)
final packageRepositoryProvider = PackageRepositoryProvider._();

final class PackageRepositoryProvider
    extends
        $FunctionalProvider<
          PackageRepository,
          PackageRepository,
          PackageRepository
        >
    with $Provider<PackageRepository> {
  PackageRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'packageRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$packageRepositoryHash();

  @$internal
  @override
  $ProviderElement<PackageRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PackageRepository create(Ref ref) {
    return packageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PackageRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PackageRepository>(value),
    );
  }
}

String _$packageRepositoryHash() => r'5a01c16d91c0e4bbdf673c801b885293a157b4d4';

@ProviderFor(savePaymentUseCase)
final savePaymentUseCaseProvider = SavePaymentUseCaseProvider._();

final class SavePaymentUseCaseProvider
    extends
        $FunctionalProvider<
          SavePaymentUseCase,
          SavePaymentUseCase,
          SavePaymentUseCase
        >
    with $Provider<SavePaymentUseCase> {
  SavePaymentUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savePaymentUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savePaymentUseCaseHash();

  @$internal
  @override
  $ProviderElement<SavePaymentUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SavePaymentUseCase create(Ref ref) {
    return savePaymentUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SavePaymentUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SavePaymentUseCase>(value),
    );
  }
}

String _$savePaymentUseCaseHash() =>
    r'22b56d0c6fc59208d8da9a2606ee9705f3ee7618';

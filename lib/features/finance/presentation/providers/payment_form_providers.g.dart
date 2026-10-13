// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_form_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Ученики, от которых можно записать платёж.

@ProviderFor(paymentFormStudents)
final paymentFormStudentsProvider = PaymentFormStudentsProvider._();

/// Ученики, от которых можно записать платёж.

final class PaymentFormStudentsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Student>>,
          List<Student>,
          Stream<List<Student>>
        >
    with $FutureModifier<List<Student>>, $StreamProvider<List<Student>> {
  /// Ученики, от которых можно записать платёж.
  PaymentFormStudentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentFormStudentsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentFormStudentsHash();

  @$internal
  @override
  $StreamProviderElement<List<Student>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Student>> create(Ref ref) {
    return paymentFormStudents(ref);
  }
}

String _$paymentFormStudentsHash() =>
    r'83b586ea8b1785b1771f75f61d8700b22aef2f55';

/// Баланс выбранного ученика — подсказка с суммой долга.

@ProviderFor(paymentFormBalance)
final paymentFormBalanceProvider = PaymentFormBalanceFamily._();

/// Баланс выбранного ученика — подсказка с суммой долга.

final class PaymentFormBalanceProvider
    extends
        $FunctionalProvider<
          AsyncValue<StudentBalance?>,
          StudentBalance?,
          Stream<StudentBalance?>
        >
    with $FutureModifier<StudentBalance?>, $StreamProvider<StudentBalance?> {
  /// Баланс выбранного ученика — подсказка с суммой долга.
  PaymentFormBalanceProvider._({
    required PaymentFormBalanceFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'paymentFormBalanceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$paymentFormBalanceHash();

  @override
  String toString() {
    return r'paymentFormBalanceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<StudentBalance?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<StudentBalance?> create(Ref ref) {
    final argument = this.argument as int;
    return paymentFormBalance(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PaymentFormBalanceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paymentFormBalanceHash() =>
    r'11d38c488dbfae44d1e19af5d9f5d53e91c2a4d1';

/// Баланс выбранного ученика — подсказка с суммой долга.

final class PaymentFormBalanceFamily extends $Family
    with $FunctionalFamilyOverride<Stream<StudentBalance?>, int> {
  PaymentFormBalanceFamily._()
    : super(
        retry: null,
        name: r'paymentFormBalanceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Баланс выбранного ученика — подсказка с суммой долга.

  PaymentFormBalanceProvider call(int studentId) =>
      PaymentFormBalanceProvider._(argument: studentId, from: this);

  @override
  String toString() => r'paymentFormBalanceProvider';
}

/// Платёж для редактирования вместе с именем ученика.

@ProviderFor(paymentForEdit)
final paymentForEditProvider = PaymentForEditFamily._();

/// Платёж для редактирования вместе с именем ученика.

final class PaymentForEditProvider
    extends
        $FunctionalProvider<
          AsyncValue<({Payment payment, String studentName})?>,
          ({Payment payment, String studentName})?,
          FutureOr<({Payment payment, String studentName})?>
        >
    with
        $FutureModifier<({Payment payment, String studentName})?>,
        $FutureProvider<({Payment payment, String studentName})?> {
  /// Платёж для редактирования вместе с именем ученика.
  PaymentForEditProvider._({
    required PaymentForEditFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'paymentForEditProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$paymentForEditHash();

  @override
  String toString() {
    return r'paymentForEditProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<({Payment payment, String studentName})?>
  $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<({Payment payment, String studentName})?> create(Ref ref) {
    final argument = this.argument as int;
    return paymentForEdit(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PaymentForEditProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paymentForEditHash() => r'a242739421318c5c824f9bfa84b80fc89a0ae9b5';

/// Платёж для редактирования вместе с именем ученика.

final class PaymentForEditFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<({Payment payment, String studentName})?>,
          int
        > {
  PaymentForEditFamily._()
    : super(
        retry: null,
        name: r'paymentForEditProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Платёж для редактирования вместе с именем ученика.

  PaymentForEditProvider call(int paymentId) =>
      PaymentForEditProvider._(argument: paymentId, from: this);

  @override
  String toString() => r'paymentForEditProvider';
}

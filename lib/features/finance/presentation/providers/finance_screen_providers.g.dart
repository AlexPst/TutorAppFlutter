// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_screen_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaymentsFilterController)
final paymentsFilterControllerProvider = PaymentsFilterControllerProvider._();

final class PaymentsFilterControllerProvider
    extends $NotifierProvider<PaymentsFilterController, PaymentsFilter> {
  PaymentsFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentsFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentsFilterControllerHash();

  @$internal
  @override
  PaymentsFilterController create() => PaymentsFilterController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaymentsFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaymentsFilter>(value),
    );
  }
}

String _$paymentsFilterControllerHash() =>
    r'257ea69f39d031c36a21b0637e960355e5728c9a';

abstract class _$PaymentsFilterController extends $Notifier<PaymentsFilter> {
  PaymentsFilter build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PaymentsFilter, PaymentsFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PaymentsFilter, PaymentsFilter>,
              PaymentsFilter,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(filteredPayments)
final filteredPaymentsProvider = FilteredPaymentsProvider._();

final class FilteredPaymentsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PaymentDetails>>,
          List<PaymentDetails>,
          Stream<List<PaymentDetails>>
        >
    with
        $FutureModifier<List<PaymentDetails>>,
        $StreamProvider<List<PaymentDetails>> {
  FilteredPaymentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredPaymentsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredPaymentsHash();

  @$internal
  @override
  $StreamProviderElement<List<PaymentDetails>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<PaymentDetails>> create(Ref ref) {
    return filteredPayments(ref);
  }
}

String _$filteredPaymentsHash() => r'aca9d1db32aacb7ffd4334b0316784396aad818b';

/// Балансы всех учеников. Служат и списком учеников для фильтра:
/// в нём есть и архивные, у которых могли быть платежи.

@ProviderFor(allBalances)
final allBalancesProvider = AllBalancesProvider._();

/// Балансы всех учеников. Служат и списком учеников для фильтра:
/// в нём есть и архивные, у которых могли быть платежи.

final class AllBalancesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<StudentBalance>>,
          List<StudentBalance>,
          Stream<List<StudentBalance>>
        >
    with
        $FutureModifier<List<StudentBalance>>,
        $StreamProvider<List<StudentBalance>> {
  /// Балансы всех учеников. Служат и списком учеников для фильтра:
  /// в нём есть и архивные, у которых могли быть платежи.
  AllBalancesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allBalancesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allBalancesHash();

  @$internal
  @override
  $StreamProviderElement<List<StudentBalance>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<StudentBalance>> create(Ref ref) {
    return allBalances(ref);
  }
}

String _$allBalancesHash() => r'3918491836d3cab3f3dc74446cfe385b0e397ec9';

@ProviderFor(debtors)
final debtorsProvider = DebtorsProvider._();

final class DebtorsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<StudentBalance>>,
          List<StudentBalance>,
          Stream<List<StudentBalance>>
        >
    with
        $FutureModifier<List<StudentBalance>>,
        $StreamProvider<List<StudentBalance>> {
  DebtorsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'debtorsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$debtorsHash();

  @$internal
  @override
  $StreamProviderElement<List<StudentBalance>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<StudentBalance>> create(Ref ref) {
    return debtors(ref);
  }
}

String _$debtorsHash() => r'ead64a0252db9b81a1034e7aa3ecff51420d82a5';

@ProviderFor(financeSummary)
final financeSummaryProvider = FinanceSummaryProvider._();

final class FinanceSummaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<FinanceSummary>,
          FinanceSummary,
          FutureOr<FinanceSummary>
        >
    with $FutureModifier<FinanceSummary>, $FutureProvider<FinanceSummary> {
  FinanceSummaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'financeSummaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$financeSummaryHash();

  @$internal
  @override
  $FutureProviderElement<FinanceSummary> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<FinanceSummary> create(Ref ref) {
    return financeSummary(ref);
  }
}

String _$financeSummaryHash() => r'7a6c604b2646d03391c3bc87c3bb8115fff02fd6';

/// Период отчёта о доходах.

@ProviderFor(IncomePeriodController)
final incomePeriodControllerProvider = IncomePeriodControllerProvider._();

/// Период отчёта о доходах.
final class IncomePeriodControllerProvider
    extends
        $NotifierProvider<
          IncomePeriodController,
          ({DateTime date, PeriodKind kind})
        > {
  /// Период отчёта о доходах.
  IncomePeriodControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'incomePeriodControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$incomePeriodControllerHash();

  @$internal
  @override
  IncomePeriodController create() => IncomePeriodController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(({DateTime date, PeriodKind kind}) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<({DateTime date, PeriodKind kind})>(
        value,
      ),
    );
  }
}

String _$incomePeriodControllerHash() =>
    r'90d45a2c58b642cbb8e1b6c59b83afe9d812bb5d';

/// Период отчёта о доходах.

abstract class _$IncomePeriodController
    extends $Notifier<({DateTime date, PeriodKind kind})> {
  ({DateTime date, PeriodKind kind}) build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              ({DateTime date, PeriodKind kind}),
              ({DateTime date, PeriodKind kind})
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ({DateTime date, PeriodKind kind}),
                ({DateTime date, PeriodKind kind})
              >,
              ({DateTime date, PeriodKind kind}),
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(incomeReport)
final incomeReportProvider = IncomeReportFamily._();

final class IncomeReportProvider
    extends
        $FunctionalProvider<
          AsyncValue<IncomeReport>,
          IncomeReport,
          Stream<IncomeReport>
        >
    with $FutureModifier<IncomeReport>, $StreamProvider<IncomeReport> {
  IncomeReportProvider._({
    required IncomeReportFamily super.from,
    required DatePeriod super.argument,
  }) : super(
         retry: null,
         name: r'incomeReportProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$incomeReportHash();

  @override
  String toString() {
    return r'incomeReportProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<IncomeReport> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<IncomeReport> create(Ref ref) {
    final argument = this.argument as DatePeriod;
    return incomeReport(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is IncomeReportProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$incomeReportHash() => r'f2b8287768ec1bb230a605efa0faeb4ff249b603';

final class IncomeReportFamily extends $Family
    with $FunctionalFamilyOverride<Stream<IncomeReport>, DatePeriod> {
  IncomeReportFamily._()
    : super(
        retry: null,
        name: r'incomeReportProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IncomeReportProvider call(DatePeriod period) =>
      IncomeReportProvider._(argument: period, from: this);

  @override
  String toString() => r'incomeReportProvider';
}

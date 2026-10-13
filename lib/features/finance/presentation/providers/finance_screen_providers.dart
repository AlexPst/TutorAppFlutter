import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/providers/clock_provider.dart';
import 'package:tutor_app/features/finance/domain/models/finance_summary.dart';
import 'package:tutor_app/features/finance/domain/models/income_report.dart';
import 'package:tutor_app/features/finance/domain/models/payment.dart';
import 'package:tutor_app/features/finance/domain/models/student_balance.dart';
import 'package:tutor_app/features/finance/finance_providers.dart';

part 'finance_screen_providers.freezed.dart';
part 'finance_screen_providers.g.dart';

/// Фильтр списка платежей.
@freezed
abstract class PaymentsFilter with _$PaymentsFilter {
  const factory PaymentsFilter({
    int? studentId,

    /// `null` — за всё время.
    PeriodKind? kind,
    required DateTime date,
  }) = _PaymentsFilter;

  const PaymentsFilter._();

  DatePeriod? get period => kind?.around(date);
}

@riverpod
class PaymentsFilterController extends _$PaymentsFilterController {
  @override
  PaymentsFilter build() => PaymentsFilter(
    kind: PeriodKind.month,
    date: dateOnly(ref.read(clockProvider)()),
  );

  void setStudent(int? studentId) =>
      state = state.copyWith(studentId: studentId);

  void setKind(PeriodKind? kind) => state = state.copyWith(kind: kind);

  void setDate(DateTime date) => state = state.copyWith(date: dateOnly(date));
}

@riverpod
Stream<List<PaymentDetails>> filteredPayments(Ref ref) {
  final filter = ref.watch(paymentsFilterControllerProvider);
  return ref
      .watch(paymentRepositoryProvider)
      .watchPayments(studentId: filter.studentId, period: filter.period);
}

/// Балансы всех учеников. Служат и списком учеников для фильтра:
/// в нём есть и архивные, у которых могли быть платежи.
@riverpod
Stream<List<StudentBalance>> allBalances(Ref ref) =>
    ref.watch(paymentRepositoryProvider).watchBalances();

@riverpod
Stream<List<StudentBalance>> debtors(Ref ref) =>
    ref.watch(paymentRepositoryProvider).watchDebtors();

@riverpod
Future<FinanceSummary> financeSummary(Ref ref) async =>
    FinanceSummary.fromBalances(await ref.watch(allBalancesProvider.future));

/// Период отчёта о доходах.
@riverpod
class IncomePeriodController extends _$IncomePeriodController {
  @override
  ({PeriodKind kind, DateTime date}) build() =>
      (kind: PeriodKind.month, date: dateOnly(ref.read(clockProvider)()));

  void setKind(PeriodKind kind) => state = (kind: kind, date: state.date);

  void setDate(DateTime date) =>
      state = (kind: state.kind, date: dateOnly(date));
}

@riverpod
Stream<IncomeReport> incomeReport(Ref ref, DatePeriod period) =>
    ref.watch(paymentRepositoryProvider).watchIncomeReport(period);

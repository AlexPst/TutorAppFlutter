import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/finance/domain/models/income_report.dart';
import 'package:tutor_app/features/finance/domain/models/payment.dart';
import 'package:tutor_app/features/finance/domain/models/student_balance.dart';

abstract interface class PaymentRepository {
  /// Платежи, сначала новые.
  Stream<List<PaymentDetails>> watchPayments({
    int? studentId,
    DatePeriod? period,
  });

  Future<Payment?> getPayment(int id);

  Future<int> createPayment(PaymentDraft draft);

  /// Бросает `NotFoundFailure`, если платежа нет.
  Future<void> updatePayment(Payment payment);

  Future<void> deletePayment(int id);

  /// Баланс ученика. `null`, если ученик удалён.
  Stream<StudentBalance?> watchBalance(int studentId);

  /// Балансы всех учеников, включая архивных.
  Stream<List<StudentBalance>> watchBalances();

  /// Ученики с долгом не меньше [minDebt], по убыванию долга.
  Stream<List<StudentBalance>> watchDebtors({Money minDebt = Money.zero});

  /// Разовый снимок должников — для планировщика напоминаний.
  Future<List<StudentBalance>> getDebtors({Money minDebt = Money.zero});

  /// Поступления, начисления и проведённые занятия по ученикам за период.
  Stream<IncomeReport> watchIncomeReport(DatePeriod period);
}

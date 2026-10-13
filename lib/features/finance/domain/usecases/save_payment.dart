import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/core/domain/transaction_runner.dart';
import 'package:tutor_app/features/finance/domain/models/payment.dart';
import 'package:tutor_app/features/finance/domain/payment_validator.dart';
import 'package:tutor_app/features/finance/domain/repositories/payment_repository.dart';
import 'package:tutor_app/features/students/domain/repositories/student_repository.dart';
import 'package:tutor_app/features/students/domain/student_validator.dart';

/// Создание и изменение платежа с проверкой правил. Баланс ученика
/// пересчитывается сам: он вычисляется из платежей и начислений.
class SavePaymentUseCase {
  SavePaymentUseCase({
    required this._payments,
    required this._students,
    required this._transaction,
    required this._clock,
  });

  final PaymentRepository _payments;
  final StudentRepository _students;
  final TransactionRunner _transaction;
  final DateTime Function() _clock;

  Future<int> create(PaymentDraft draft) => _transaction.run(() async {
    PaymentValidator.ensureValid(
      amount: draft.amount,
      paidAt: draft.paidAt,
      now: _clock(),
    );
    if (await _students.getStudent(draft.studentId) == null) {
      throw const NotFoundFailure(FailureReason.studentNotFound);
    }
    return _payments.createPayment(
      draft.copyWith(comment: StudentValidator.optionalText(draft.comment)),
    );
  });

  /// Ученик платежа не меняется.
  Future<void> update(Payment payment) => _transaction.run(() async {
    PaymentValidator.ensureValid(
      amount: payment.amount,
      paidAt: payment.paidAt,
      now: _clock(),
    );
    final current = await _payments.getPayment(payment.id);
    if (current == null) {
      throw const NotFoundFailure(FailureReason.paymentNotFound);
    }
    await _payments.updatePayment(
      payment.copyWith(
        studentId: current.studentId,
        comment: StudentValidator.optionalText(payment.comment),
      ),
    );
  });
}

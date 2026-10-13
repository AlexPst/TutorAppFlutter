import 'package:drift/drift.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/finance/domain/models/payment.dart';
import 'package:tutor_app/features/finance/domain/models/payment_method.dart';

extension PaymentRowMapper on PaymentRow {
  Payment toModel() => Payment(
    id: id,
    studentId: studentId,
    amount: Money(amountKopecks),
    paidAt: paidAt,
    method: PaymentMethod.values.byName(method),
    comment: comment,
  );
}

extension PaymentDraftMapper on PaymentDraft {
  PaymentsCompanion toCompanion() => PaymentsCompanion.insert(
    studentId: studentId,
    amountKopecks: amount.kopecks,
    paidAt: paidAt,
    method: Value(method.name),
    comment: Value(comment),
  );
}

extension PaymentMapper on Payment {
  PaymentsCompanion toUpdateCompanion(DateTime updatedAt) => PaymentsCompanion(
    studentId: Value(studentId),
    amountKopecks: Value(amount.kopecks),
    paidAt: Value(paidAt),
    method: Value(method.name),
    comment: Value(comment),
    updatedAt: Value(updatedAt),
  );
}

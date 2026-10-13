import 'package:drift/drift.dart';
import 'package:tutor_app/core/database/tables/sql_constraints.dart';
import 'package:tutor_app/core/database/tables/students_table.dart';

/// Допустимые значения `payments.method`. Совпадают с именами `PaymentMethod`.
const paymentMethodValues = ['cardTransfer', 'cash', 'other'];

@DataClassName('PaymentRow')
@TableIndex(
  name: 'idx_payments_student_paid_at',
  columns: {#studentId, #paidAt},
)
@TableIndex(name: 'idx_payments_paid_at', columns: {#paidAt})
class Payments extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get studentId =>
      integer().references(Students, #id, onDelete: KeyAction.cascade)();

  IntColumn get amountKopecks => integer()();

  DateTimeColumn get paidAt => dateTime()();

  TextColumn get method => text().withDefault(const Constant('cardTransfer'))();

  TextColumn get comment => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
    'CHECK (amount_kopecks > 0)',
    'CHECK (${sqlIn('method', paymentMethodValues)})',
  ];
}

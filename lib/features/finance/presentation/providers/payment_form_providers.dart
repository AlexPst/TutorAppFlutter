import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/features/finance/domain/models/payment.dart';
import 'package:tutor_app/features/finance/domain/models/student_balance.dart';
import 'package:tutor_app/features/finance/finance_providers.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';
import 'package:tutor_app/features/students/students_providers.dart';

part 'payment_form_providers.g.dart';

/// Ученики, от которых можно записать платёж.
@riverpod
Stream<List<Student>> paymentFormStudents(Ref ref) =>
    ref.watch(studentRepositoryProvider).watchStudents();

/// Баланс выбранного ученика — подсказка с суммой долга.
@riverpod
Stream<StudentBalance?> paymentFormBalance(Ref ref, int studentId) =>
    ref.watch(paymentRepositoryProvider).watchBalance(studentId);

/// Платёж для редактирования вместе с именем ученика.
@riverpod
Future<({Payment payment, String studentName})?> paymentForEdit(
  Ref ref,
  int paymentId,
) async {
  final payment = await ref
      .watch(paymentRepositoryProvider)
      .getPayment(paymentId);
  if (payment == null) return null;
  final student = await ref
      .watch(studentRepositoryProvider)
      .getStudent(payment.studentId);
  return (payment: payment, studentName: student?.fullName ?? '');
}

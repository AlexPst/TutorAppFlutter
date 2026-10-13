import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/features/finance/domain/models/lesson_package.dart';
import 'package:tutor_app/features/finance/domain/models/payment.dart';
import 'package:tutor_app/features/finance/domain/models/student_balance.dart';
import 'package:tutor_app/features/finance/finance_providers.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_details.dart';
import 'package:tutor_app/features/lessons/lessons_providers.dart';
import 'package:tutor_app/features/students/domain/models/enrollment_with_subject.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';
import 'package:tutor_app/features/students/students_providers.dart';

part 'student_details_providers.g.dart';

@riverpod
Stream<Student?> student(Ref ref, int studentId) =>
    ref.watch(studentRepositoryProvider).watchStudent(studentId);

/// Все направления ученика, включая архивные.
@riverpod
Stream<List<EnrollmentWithSubject>> studentEnrollments(
  Ref ref,
  int studentId,
) => ref
    .watch(studentRepositoryProvider)
    .watchEnrollments(studentId, includeArchived: true);

@riverpod
Stream<StudentBalance?> studentBalance(Ref ref, int studentId) =>
    ref.watch(paymentRepositoryProvider).watchBalance(studentId);

/// Занятия ученика, сначала новые.
@riverpod
Stream<List<LessonDetails>> studentLessons(Ref ref, int studentId) => ref
    .watch(lessonRepositoryProvider)
    .watchLessons(studentId: studentId)
    .map((lessons) => lessons.reversed.toList());

@riverpod
Stream<List<PaymentDetails>> studentPayments(Ref ref, int studentId) =>
    ref.watch(paymentRepositoryProvider).watchPayments(studentId: studentId);

@riverpod
Stream<List<PackageWithUsage>> studentPackages(Ref ref, int studentId) =>
    ref.watch(packageRepositoryProvider).watchPackages(studentId: studentId);

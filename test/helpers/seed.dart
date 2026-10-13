import 'package:drift/native.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/finance/data/repositories/drift_package_repository.dart';
import 'package:tutor_app/features/finance/data/repositories/drift_payment_repository.dart';
import 'package:tutor_app/features/finance/domain/models/lesson_package.dart';
import 'package:tutor_app/features/finance/domain/models/payment.dart';
import 'package:tutor_app/features/lessons/data/repositories/drift_lesson_repository.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/students/data/repositories/drift_student_repository.dart';
import 'package:tutor_app/features/students/domain/models/enrollment.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';
import 'package:tutor_app/features/subjects/data/repositories/drift_subject_repository.dart';

AppDatabase createTestDatabase() => AppDatabase(NativeDatabase.memory());

/// Наполнение тестовой БД через настоящие репозитории.
class Seed {
  Seed(AppDatabase db)
    : students = DriftStudentRepository(db),
      subjects = DriftSubjectRepository(db),
      lessons = DriftLessonRepository(db),
      payments = DriftPaymentRepository(db),
      packages = DriftPackageRepository(db);

  final DriftStudentRepository students;
  final DriftSubjectRepository subjects;
  final DriftLessonRepository lessons;
  final DriftPaymentRepository payments;
  final DriftPackageRepository packages;

  var _subjectCounter = 0;

  Future<int> student([String fullName = 'Анна']) =>
      students.createStudent(StudentDraft(fullName: fullName));

  Future<int> subject([String? name]) =>
      subjects.createSubject(name ?? 'Предмет ${++_subjectCounter}');

  Future<int> enrollment({
    int? studentId,
    int? subjectId,
    Money rate = const Money.rubles(1500),
  }) async => students.createEnrollment(
    EnrollmentDraft(
      studentId: studentId ?? await student(),
      subjectId: subjectId ?? await subject(),
      rate: rate,
    ),
  );

  Future<int> lesson(
    int enrollmentId, {
    required DateTime startsAt,
    LessonStatus status = LessonStatus.planned,
    int? packageId,
    Money price = const Money.rubles(1500),
    Duration duration = const Duration(minutes: 60),
    String? topic,
  }) async {
    final id = await lessons.createLesson(
      LessonDraft(
        enrollmentId: enrollmentId,
        startsAt: startsAt,
        duration: duration,
        price: price,
        topic: topic,
      ),
    );
    if (status != LessonStatus.planned) {
      final created = await lessons.getLesson(id);
      await lessons.updateLesson(
        created!.copyWith(status: status, packageId: packageId),
      );
    }
    return id;
  }

  Future<int> package(
    int enrollmentId, {
    int lessonsCount = 4,
    Money price = const Money.rubles(5000),
    DateTime? purchasedAt,
  }) => packages.createPackage(
    LessonPackageDraft(
      enrollmentId: enrollmentId,
      lessonsCount: lessonsCount,
      price: price,
      purchasedAt: purchasedAt ?? DateTime(2026, 10, 1),
    ),
  );

  Future<int> payment(int studentId, Money amount, {DateTime? paidAt}) =>
      payments.createPayment(
        PaymentDraft(
          studentId: studentId,
          amount: amount,
          paidAt: paidAt ?? DateTime(2026, 10, 10),
        ),
      );
}

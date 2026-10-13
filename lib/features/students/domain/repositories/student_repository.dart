import 'package:tutor_app/features/students/domain/models/enrollment.dart';
import 'package:tutor_app/features/students/domain/models/enrollment_with_subject.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';

abstract interface class StudentRepository {
  /// Ученики по алфавиту: активные или, при [archived], архивные.
  Stream<List<Student>> watchStudents({bool archived = false});

  /// `null`, если ученик удалён.
  Stream<Student?> watchStudent(int id);

  Future<Student?> getStudent(int id);

  Future<int> createStudent(StudentDraft draft);

  /// Бросает `NotFoundFailure`, если ученика нет.
  Future<void> updateStudent(Student student);

  /// Бросает `NotFoundFailure`, если ученика нет.
  Future<void> setStudentArchived(int id, {required bool archived});

  /// Удаляет ученика вместе с направлениями, занятиями, пакетами, платежами
  /// и прогрессом.
  Future<void> deleteStudent(int id);

  /// Направления ученика с предметами, по названию предмета.
  Stream<List<EnrollmentWithSubject>> watchEnrollments(
    int studentId, {
    bool includeArchived = false,
  });

  /// Направления всех учеников — для фильтра по предмету в списке.
  Stream<List<EnrollmentWithSubject>> watchAllEnrollments({
    bool includeArchived = false,
  });

  Future<Enrollment?> getEnrollment(int id);

  /// Бросает `ConflictFailure`, если у ученика уже есть направление
  /// по этому предмету.
  Future<int> createEnrollment(EnrollmentDraft draft);

  /// Меняет ставку, длительность по умолчанию, заметку и архивность.
  /// Ученик и предмет направления не меняются. Бросает `NotFoundFailure`,
  /// если направления нет.
  Future<void> updateEnrollment(Enrollment enrollment);
}

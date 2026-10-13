import 'package:drift/drift.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/features/students/data/mappers/enrollment_mapper.dart';
import 'package:tutor_app/features/students/data/mappers/student_mapper.dart';
import 'package:tutor_app/features/students/domain/models/enrollment.dart';
import 'package:tutor_app/features/students/domain/models/enrollment_with_subject.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';
import 'package:tutor_app/features/students/domain/repositories/student_repository.dart';
import 'package:tutor_app/features/subjects/data/mappers/subject_mapper.dart';

class DriftStudentRepository implements StudentRepository {
  DriftStudentRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<Student>> watchStudents({bool archived = false}) =>
      (_db.select(
        _db.students,
      )..where((t) => t.isArchived.equals(archived))).watch().map(
        (rows) => rows.map((row) => row.toModel()).toList()
          ..sort(
            (a, b) =>
                a.fullName.toLowerCase().compareTo(b.fullName.toLowerCase()),
          ),
      );

  @override
  Stream<Student?> watchStudent(int id) =>
      _studentById(id).watchSingleOrNull().map((row) => row?.toModel());

  @override
  Future<Student?> getStudent(int id) async =>
      (await _studentById(id).getSingleOrNull())?.toModel();

  @override
  Future<int> createStudent(StudentDraft draft) =>
      _db.into(_db.students).insert(draft.toCompanion());

  @override
  Future<void> updateStudent(Student student) =>
      _updateStudentRow(student.id, student.toUpdateCompanion(DateTime.now()));

  @override
  Future<void> setStudentArchived(int id, {required bool archived}) =>
      _updateStudentRow(
        id,
        StudentsCompanion(
          isArchived: Value(archived),
          updatedAt: Value(DateTime.now()),
        ),
      );

  @override
  Future<void> deleteStudent(int id) =>
      (_db.delete(_db.students)..where((t) => t.id.equals(id))).go();

  @override
  Stream<List<EnrollmentWithSubject>> watchEnrollments(
    int studentId, {
    bool includeArchived = false,
  }) =>
      _watchEnrollments(studentId: studentId, includeArchived: includeArchived);

  @override
  Stream<List<EnrollmentWithSubject>> watchAllEnrollments({
    bool includeArchived = false,
  }) => _watchEnrollments(includeArchived: includeArchived);

  Stream<List<EnrollmentWithSubject>> _watchEnrollments({
    int? studentId,
    required bool includeArchived,
  }) {
    final enrollments = _db.enrollments;
    final filters = <Expression<bool>>[
      if (studentId != null) enrollments.studentId.equals(studentId),
      if (!includeArchived) enrollments.isArchived.equals(false),
    ];
    final query = _db.select(enrollments).join([
      innerJoin(_db.subjects, _db.subjects.id.equalsExp(enrollments.subjectId)),
    ]);
    if (filters.isNotEmpty) query.where(filters.reduce((a, b) => a & b));

    return query.watch().map(
      (rows) =>
          rows
              .map(
                (row) => EnrollmentWithSubject(
                  enrollment: row.readTable(enrollments).toModel(),
                  subject: row.readTable(_db.subjects).toModel(),
                ),
              )
              .toList()
            ..sort(
              (a, b) => a.subject.name.toLowerCase().compareTo(
                b.subject.name.toLowerCase(),
              ),
            ),
    );
  }

  @override
  Future<Enrollment?> getEnrollment(int id) async {
    final row = await (_db.select(
      _db.enrollments,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    return row?.toModel();
  }

  @override
  Future<int> createEnrollment(EnrollmentDraft draft) =>
      _db.transaction(() async {
        final existing =
            await (_db.select(_db.enrollments)..where(
                  (t) =>
                      t.studentId.equals(draft.studentId) &
                      t.subjectId.equals(draft.subjectId),
                ))
                .getSingleOrNull();
        if (existing != null) {
          throw const ConflictFailure(FailureReason.enrollmentExists);
        }
        return _db.into(_db.enrollments).insert(draft.toCompanion());
      });

  @override
  Future<void> updateEnrollment(Enrollment enrollment) async {
    final updated =
        await (_db.update(_db.enrollments)
              ..where((t) => t.id.equals(enrollment.id)))
            .write(enrollment.toUpdateCompanion(DateTime.now()));
    if (updated == 0) {
      throw const NotFoundFailure(FailureReason.enrollmentNotFound);
    }
  }

  SimpleSelectStatement<$StudentsTable, StudentRow> _studentById(int id) =>
      _db.select(_db.students)..where((t) => t.id.equals(id));

  Future<void> _updateStudentRow(int id, StudentsCompanion companion) async {
    final updated = await (_db.update(
      _db.students,
    )..where((t) => t.id.equals(id))).write(companion);
    if (updated == 0) {
      throw const NotFoundFailure(FailureReason.studentNotFound);
    }
  }
}

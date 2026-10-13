import 'package:drift/drift.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/features/lessons/data/mappers/lesson_mapper.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_details.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/lessons/domain/repositories/lesson_repository.dart';
import 'package:tutor_app/features/students/data/mappers/student_mapper.dart';

class DriftLessonRepository implements LessonRepository {
  DriftLessonRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<LessonDetails>> watchLessons({
    DatePeriod? period,
    int? studentId,
    int? enrollmentId,
    Set<LessonStatus>? statuses,
  }) {
    final lessons = _db.lessons;
    final filters = <Expression<bool>>[
      if (period != null) ...[
        lessons.startsAt.isBiggerOrEqualValue(period.start),
        lessons.startsAt.isSmallerThanValue(period.end),
      ],
      if (studentId != null) _db.enrollments.studentId.equals(studentId),
      if (enrollmentId != null) lessons.enrollmentId.equals(enrollmentId),
      if (statuses != null) lessons.status.isIn(statuses.map((s) => s.name)),
    ];

    final query = _detailsQuery()
      ..orderBy([OrderingTerm.asc(lessons.startsAt)]);
    if (filters.isNotEmpty) query.where(filters.reduce((a, b) => a & b));
    return query.watch().map(_toDetailsList);
  }

  @override
  Stream<List<LessonDetails>> watchUpcoming({
    required DateTime from,
    int limit = 10,
    int? studentId,
  }) {
    final lessons = _db.lessons;
    var filter =
        lessons.status.equals(LessonStatus.planned.name) &
        lessons.startsAt.isBiggerOrEqualValue(from);
    if (studentId != null) {
      filter = filter & _db.enrollments.studentId.equals(studentId);
    }

    final query = _detailsQuery()
      ..where(filter)
      ..orderBy([OrderingTerm.asc(lessons.startsAt)])
      ..limit(limit);
    return query.watch().map(_toDetailsList);
  }

  @override
  Stream<List<LessonDetails>> watchUnmarked({required DateTime now}) {
    final lessons = _db.lessons;
    final query = _detailsQuery()
      ..where(
        lessons.status.equals(LessonStatus.planned.name) &
            lessons.startsAt.isSmallerThanValue(now),
      )
      ..orderBy([OrderingTerm.asc(lessons.startsAt)]);

    // Занятие, которое идёт прямо сейчас, ещё рано отмечать.
    return query.watch().map(
      (rows) =>
          _toDetailsList(rows)
              .where((details) => !details.lesson.endsAt.isAfter(now))
              .toList(),
    );
  }

  @override
  Stream<LessonDetails?> watchLesson(int id) {
    final query = _detailsQuery()..where(_db.lessons.id.equals(id));
    return query.watchSingleOrNull().map(
      (row) => row == null ? null : _toDetails(row),
    );
  }

  @override
  Future<Lesson?> getLesson(int id) async {
    final row = await (_db.select(
      _db.lessons,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    return row?.toModel();
  }

  @override
  Future<int> createLesson(LessonDraft draft) =>
      _db.into(_db.lessons).insert(draft.toCompanion());

  @override
  Future<void> updateLesson(Lesson lesson) async {
    final updated =
        await (_db.update(_db.lessons)..where((t) => t.id.equals(lesson.id)))
            .write(lesson.toUpdateCompanion(DateTime.now()));
    if (updated == 0) throw const NotFoundFailure(FailureReason.lessonNotFound);
  }

  @override
  Future<void> deleteLesson(int id) =>
      (_db.delete(_db.lessons)..where((t) => t.id.equals(id))).go();

  JoinedSelectStatement<HasResultSet, dynamic> _detailsQuery() =>
      _db.select(_db.lessons).join([
        innerJoin(
          _db.enrollments,
          _db.enrollments.id.equalsExp(_db.lessons.enrollmentId),
        ),
        innerJoin(
          _db.students,
          _db.students.id.equalsExp(_db.enrollments.studentId),
        ),
        innerJoin(
          _db.subjects,
          _db.subjects.id.equalsExp(_db.enrollments.subjectId),
        ),
      ]);

  List<LessonDetails> _toDetailsList(List<TypedResult> rows) =>
      rows.map(_toDetails).toList();

  LessonDetails _toDetails(TypedResult row) {
    final student = row.readTable(_db.students);
    final subject = row.readTable(_db.subjects);
    return LessonDetails(
      lesson: row.readTable(_db.lessons).toModel(),
      studentId: student.id,
      studentName: student.fullName,
      subjectId: subject.id,
      subjectName: subject.name,
      gradeScale: student.gradeScale,
    );
  }
}

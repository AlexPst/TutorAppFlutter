import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/students/domain/models/grade_scale.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';

import '../../../helpers/seed.dart';

void main() {
  late AppDatabase db;
  late Seed seed;

  setUp(() {
    db = createTestDatabase();
    seed = Seed(db);
  });

  tearDown(() => db.close());

  test('занятия за период: начало включено, конец исключён', () async {
    final enrollmentId = await seed.enrollment();
    await seed.lesson(enrollmentId, startsAt: DateTime(2026, 10, 12, 23, 59));
    final first = await seed.lesson(
      enrollmentId,
      startsAt: DateTime(2026, 10, 13),
    );
    final last = await seed.lesson(
      enrollmentId,
      startsAt: DateTime(2026, 10, 13, 23, 59),
    );
    await seed.lesson(enrollmentId, startsAt: DateTime(2026, 10, 14));

    final lessons = await seed.lessons
        .watchLessons(period: DatePeriod.day(DateTime(2026, 10, 13)))
        .first;

    expect(lessons.map((d) => d.lesson.id), [first, last]);
  });

  test('фильтры по ученику и статусу', () async {
    final anna = await seed.student('Анна');
    final boris = await seed.student('Борис');
    final annaMath = await seed.enrollment(studentId: anna);
    final borisMath = await seed.enrollment(studentId: boris);
    final completed = await seed.lesson(
      annaMath,
      startsAt: DateTime(2026, 10, 13, 10),
      status: LessonStatus.completed,
    );
    await seed.lesson(annaMath, startsAt: DateTime(2026, 10, 13, 12));
    await seed.lesson(borisMath, startsAt: DateTime(2026, 10, 13, 14));

    final lessons = await seed.lessons
        .watchLessons(
          period: DatePeriod.month(DateTime(2026, 10)),
          studentId: anna,
          statuses: {LessonStatus.completed},
        )
        .first;

    expect(lessons.map((d) => d.lesson.id), [completed]);
  });

  test('детали занятия: ученик, предмет, шкала', () async {
    final studentId = await seed.students.createStudent(
      const StudentDraft(fullName: 'Анна', gradeScale: GradeScale.tenPoint),
    );
    final subjectId = await seed.subject('Физика');
    final enrollmentId = await seed.enrollment(
      studentId: studentId,
      subjectId: subjectId,
    );
    final id = await seed.lesson(
      enrollmentId,
      startsAt: DateTime(2026, 10, 13, 18),
    );

    final details = await seed.lessons.watchLesson(id).first;

    expect(details?.studentName, 'Анна');
    expect(details?.subjectName, 'Физика');
    expect(details?.gradeScale, GradeScale.tenPoint);
  });

  test(
    'ближайшие: только запланированные с момента from, по порядку',
    () async {
      final enrollmentId = await seed.enrollment();
      final now = DateTime(2026, 10, 13, 12);
      await seed.lesson(enrollmentId, startsAt: DateTime(2026, 10, 13, 10));
      final later = await seed.lesson(
        enrollmentId,
        startsAt: DateTime(2026, 10, 15, 18),
      );
      final sooner = await seed.lesson(
        enrollmentId,
        startsAt: DateTime(2026, 10, 14, 18),
      );
      await seed.lesson(
        enrollmentId,
        startsAt: DateTime(2026, 10, 14, 10),
        status: LessonStatus.cancelledByTutor,
      );
      await seed.lesson(enrollmentId, startsAt: DateTime(2026, 10, 16, 18));

      final upcoming = await seed.lessons
          .watchUpcoming(from: now, limit: 2)
          .first;

      expect(upcoming.map((d) => d.lesson.id), [sooner, later]);
    },
  );

  test('неотмеченные: закончились и всё ещё запланированы', () async {
    final enrollmentId = await seed.enrollment();
    final now = DateTime(2026, 10, 13, 12, 30);
    final finished = await seed.lesson(
      enrollmentId,
      startsAt: DateTime(2026, 10, 13, 10),
    );
    await seed.lesson(
      enrollmentId,
      startsAt: DateTime(2026, 10, 13, 9),
      status: LessonStatus.completed,
    );
    // Идёт прямо сейчас.
    await seed.lesson(enrollmentId, startsAt: DateTime(2026, 10, 13, 12));
    await seed.lesson(enrollmentId, startsAt: DateTime(2026, 10, 13, 15));

    final unmarked = await seed.lessons.watchUnmarked(now: now).first;

    expect(unmarked.map((d) => d.lesson.id), [finished]);
  });

  test('поток реагирует на изменения', () async {
    final enrollmentId = await seed.enrollment();
    final from = DateTime(2026, 10, 13);
    final counts = seed.lessons
        .watchUpcoming(from: from)
        .map((lessons) => lessons.length);
    final expectation = expectLater(counts, emitsInOrder([0, 1]));

    await Future<void>.delayed(Duration.zero);
    await seed.lesson(enrollmentId, startsAt: DateTime(2026, 10, 14, 18));
    await expectation;
  });
}

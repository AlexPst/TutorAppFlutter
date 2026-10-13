import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/database/drift_transaction_runner.dart';
import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/lessons/domain/services/lesson_outcome_service.dart';
import 'package:tutor_app/features/lessons/domain/usecases/create_lesson.dart';
import 'package:tutor_app/features/lessons/domain/usecases/mark_lesson.dart';
import 'package:tutor_app/features/lessons/domain/usecases/reschedule_lesson.dart';
import 'package:tutor_app/features/lessons/domain/usecases/update_lesson.dart';
import 'package:tutor_app/features/progress/data/repositories/drift_progress_repository.dart';
import 'package:tutor_app/features/students/domain/models/enrollment.dart';
import 'package:tutor_app/features/students/domain/models/grade_scale.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';

import '../../../helpers/seed.dart';

void main() {
  late AppDatabase db;
  late Seed seed;
  late DriftProgressRepository progress;
  late CreateLessonUseCase create;
  late UpdateLessonUseCase update;
  late MarkLessonUseCase mark;
  late RescheduleLessonUseCase reschedule;

  setUp(() {
    db = createTestDatabase();
    seed = Seed(db);
    progress = DriftProgressRepository(db);
    final transaction = DriftTransactionRunner(db);
    final outcome = LessonOutcomeService(
      packages: seed.packages,
      progress: progress,
    );
    create = CreateLessonUseCase(
      lessons: seed.lessons,
      students: seed.students,
      outcome: outcome,
      transaction: transaction,
    );
    update = UpdateLessonUseCase(
      lessons: seed.lessons,
      outcome: outcome,
      transaction: transaction,
    );
    mark = MarkLessonUseCase(
      lessons: seed.lessons,
      students: seed.students,
      progress: progress,
      outcome: outcome,
      transaction: transaction,
    );
    reschedule = RescheduleLessonUseCase(
      lessons: seed.lessons,
      transaction: transaction,
    );
  });

  tearDown(() => db.close());

  LessonDraft draft(int enrollmentId, {int day = 13}) => LessonDraft(
    enrollmentId: enrollmentId,
    startsAt: DateTime(2026, 10, day, 18),
    duration: const Duration(minutes: 60),
    price: const Money.rubles(1500),
  );

  Future<Money> debtOf(int studentId) async =>
      (await seed.payments.watchBalance(studentId).first)!.debt;

  Future<Lesson> lesson(int id) async => (await seed.lessons.getLesson(id))!;

  group('начисление', () {
    test('«Проведено» без пакета начисляет стоимость в долг', () async {
      final studentId = await seed.student();
      final enrollmentId = await seed.enrollment(studentId: studentId);
      final id = await create(draft(enrollmentId));
      expect(await debtOf(studentId), Money.zero);

      await mark(lessonId: id, status: LessonStatus.completed);

      expect(await debtOf(studentId), const Money.rubles(1500));
    });

    test('при пакете занятие списывается из него, а не в долг', () async {
      final studentId = await seed.student();
      final enrollmentId = await seed.enrollment(studentId: studentId);
      final packageId = await seed.package(enrollmentId);
      await seed.payment(studentId, const Money.rubles(5000));
      final id = await create(draft(enrollmentId));

      await mark(lessonId: id, status: LessonStatus.completed);

      expect((await lesson(id)).packageId, packageId);
      expect(await debtOf(studentId), Money.zero);
    });

    test('отмена преподавателем возвращает занятие в пакет', () async {
      final enrollmentId = await seed.enrollment();
      final packageId = await seed.package(enrollmentId, lessonsCount: 1);
      final id = await create(draft(enrollmentId));
      await mark(lessonId: id, status: LessonStatus.completed);

      await mark(lessonId: id, status: LessonStatus.cancelledByTutor);

      expect((await lesson(id)).packageId, isNull);
      final available = await seed.packages.getAvailablePackages(enrollmentId);
      expect(available.single.package.id, packageId);
    });

    test('«Проведено» → «Пропуск» не списывает второй раз', () async {
      final enrollmentId = await seed.enrollment();
      final first = await seed.package(enrollmentId, lessonsCount: 1);
      await seed.package(enrollmentId, purchasedAt: DateTime(2026, 10, 5));
      final id = await create(draft(enrollmentId));
      await mark(lessonId: id, status: LessonStatus.completed);

      await mark(lessonId: id, status: LessonStatus.noShow);

      expect((await lesson(id)).packageId, first);
    });

    test('создание сразу проведённым занятием оплачивает его', () async {
      final studentId = await seed.student();
      final enrollmentId = await seed.enrollment(studentId: studentId);

      await create(draft(enrollmentId), status: LessonStatus.completed);

      expect(await debtOf(studentId), const Money.rubles(1500));
    });

    test('изменение стоимости проведённого занятия меняет долг', () async {
      final studentId = await seed.student();
      final enrollmentId = await seed.enrollment(studentId: studentId);
      final id = await create(
        draft(enrollmentId),
        status: LessonStatus.completed,
      );

      await update(
        (await lesson(id)).copyWith(price: const Money.rubles(1200)),
      );

      expect(await debtOf(studentId), const Money.rubles(1200));
    });

    test('в архивный предмет нельзя добавить занятие', () async {
      final enrollmentId = await seed.enrollment();
      final enrollment = await seed.students.getEnrollment(enrollmentId);
      await seed.students.updateEnrollment(
        enrollment!.copyWith(isArchived: true),
      );

      await expectLater(
        create(draft(enrollmentId)),
        throwsA(isA<ValidationFailure>()),
      );
    });
  });

  group('итог занятия', () {
    test('тема, оценка и комментарий сохраняются в прогресс', () async {
      final enrollmentId = await seed.enrollment();
      final id = await create(draft(enrollmentId));

      await mark(
        lessonId: id,
        status: LessonStatus.completed,
        topic: ' Дроби ',
        result: const LessonResult(grade: 5, comment: 'Молодец'),
      );

      expect((await lesson(id)).topic, 'Дроби');
      final entry = await progress.getEntryForLesson(id);
      expect(entry?.grade, 5);
      expect(entry?.note, 'Молодец');
    });

    test('оценка проверяется по шкале ученика', () async {
      final studentId = await seed.students.createStudent(
        const StudentDraft(fullName: 'Анна', gradeScale: GradeScale.tenPoint),
      );
      final enrollmentId = await seed.students.createEnrollment(
        EnrollmentDraft(
          studentId: studentId,
          subjectId: await seed.subject(),
          rate: const Money.rubles(1500),
        ),
      );
      final id = await create(draft(enrollmentId));

      await expectLater(
        mark(
          lessonId: id,
          status: LessonStatus.completed,
          result: const LessonResult(grade: 11),
        ),
        throwsA(isA<ValidationFailure>()),
      );
      await mark(
        lessonId: id,
        status: LessonStatus.completed,
        result: const LessonResult(grade: 9),
      );
      expect((await progress.getEntryForLesson(id))?.grade, 9);
    });

    test('ошибка оценки откатывает смену статуса', () async {
      final enrollmentId = await seed.enrollment();
      final id = await create(draft(enrollmentId));

      await expectLater(
        mark(
          lessonId: id,
          status: LessonStatus.noShow,
          result: const LessonResult(grade: 5),
        ),
        throwsA(isA<ValidationFailure>()),
      );
      expect((await lesson(id)).status, LessonStatus.planned);
    });

    test('отмена снимает оценку, но сохраняет комментарий', () async {
      final enrollmentId = await seed.enrollment();
      final id = await create(draft(enrollmentId));
      await mark(
        lessonId: id,
        status: LessonStatus.completed,
        result: const LessonResult(grade: 4, comment: 'Устал'),
      );

      await mark(lessonId: id, status: LessonStatus.cancelledByStudent);

      final entry = await progress.getEntryForLesson(id);
      expect(entry?.grade, isNull);
      expect(entry?.note, 'Устал');
    });
  });

  group('перенос', () {
    test('меняет только время запланированного занятия', () async {
      final enrollmentId = await seed.enrollment();
      final id = await create(draft(enrollmentId));

      await reschedule(lessonId: id, startsAt: DateTime(2026, 10, 15, 17));

      final moved = await lesson(id);
      expect(moved.startsAt, DateTime(2026, 10, 15, 17));
      expect(moved.status, LessonStatus.planned);
    });

    test('проведённое занятие перенести нельзя', () async {
      final enrollmentId = await seed.enrollment();
      final id = await create(
        draft(enrollmentId),
        status: LessonStatus.completed,
      );

      await expectLater(
        reschedule(lessonId: id, startsAt: DateTime(2026, 10, 15, 17)),
        throwsA(isA<ValidationFailure>()),
      );
    });
  });

  test('валидация длительности', () async {
    final enrollmentId = await seed.enrollment();

    await expectLater(
      create(draft(enrollmentId).copyWith(duration: Duration.zero)),
      throwsA(isA<ValidationFailure>()),
    );
  });
}

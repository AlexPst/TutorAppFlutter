import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/progress/data/repositories/drift_progress_repository.dart';
import 'package:tutor_app/features/progress/domain/models/progress_entry.dart';

import '../../../helpers/seed.dart';

void main() {
  late AppDatabase db;
  late Seed seed;
  late DriftProgressRepository progress;

  setUp(() {
    db = createTestDatabase();
    seed = Seed(db);
    progress = DriftProgressRepository(db);
  });

  tearDown(() => db.close());

  test(
    'хронология: проведённые занятия, оценки и самостоятельные записи',
    () async {
      final enrollmentId = await seed.enrollment();
      final otherEnrollment = await seed.enrollment();
      final fractions = await seed.lesson(
        enrollmentId,
        startsAt: DateTime(2026, 10, 1, 18),
        status: LessonStatus.completed,
        topic: 'Дроби',
      );
      final equations = await seed.lesson(
        enrollmentId,
        startsAt: DateTime(2026, 10, 8, 18),
        status: LessonStatus.completed,
        topic: 'Уравнения',
      );
      final missed = await seed.lesson(
        enrollmentId,
        startsAt: DateTime(2026, 10, 10, 18),
        status: LessonStatus.noShow,
      );
      // Не попадают: запланированное занятие, пропуск без заметки,
      // занятие другого направления.
      await seed.lesson(enrollmentId, startsAt: DateTime(2026, 10, 20, 18));
      await seed.lesson(
        enrollmentId,
        startsAt: DateTime(2026, 10, 11, 18),
        status: LessonStatus.noShow,
      );
      await seed.lesson(
        otherEnrollment,
        startsAt: DateTime(2026, 10, 2, 18),
        status: LessonStatus.completed,
      );

      await progress.saveLessonResult(
        lessonId: fractions,
        enrollmentId: enrollmentId,
        date: DateTime(2026, 10, 1, 18),
        grade: 3,
      );
      await progress.saveLessonResult(
        lessonId: equations,
        enrollmentId: enrollmentId,
        date: DateTime(2026, 10, 8, 18),
        grade: 5,
        note: 'Уверенно',
      );
      await progress.saveLessonResult(
        lessonId: missed,
        enrollmentId: enrollmentId,
        date: DateTime(2026, 10, 10, 18),
        note: 'Заболел',
      );
      await progress.createEntry(
        ProgressEntryDraft(
          enrollmentId: enrollmentId,
          date: DateTime(2026, 10, 5),
          topic: 'Контрольная',
          grade: 4,
        ),
      );

      final result = await progress.watchProgress(enrollmentId).first;

      expect(result.items.map((i) => i.topic), [
        null,
        'Уравнения',
        'Контрольная',
        'Дроби',
      ]);
      expect(result.items.first.note, 'Заболел');
      expect(result.items[2].lessonId, isNull);
      expect(result.gradedChronologically.map((i) => i.grade), [3, 4, 5]);
      expect(result.averageGrade, 4);
    },
  );

  test('результат занятия: создать, обновить, удалить пустой', () async {
    final enrollmentId = await seed.enrollment();
    final lessonId = await seed.lesson(
      enrollmentId,
      startsAt: DateTime(2026, 10, 1, 18),
      status: LessonStatus.completed,
    );
    Future<void> save({int? grade, String? note}) => progress.saveLessonResult(
      lessonId: lessonId,
      enrollmentId: enrollmentId,
      date: DateTime(2026, 10, 1, 18),
      grade: grade,
      note: note,
    );

    await save();
    expect(await progress.getEntryForLesson(lessonId), isNull);

    await save(grade: 4);
    final created = await progress.getEntryForLesson(lessonId);
    expect(created?.grade, 4);

    await save(grade: 5, note: 'Отлично');
    final updated = await progress.getEntryForLesson(lessonId);
    expect(updated?.id, created?.id);
    expect(updated?.grade, 5);
    expect(updated?.note, 'Отлично');

    await save();
    expect(await progress.getEntryForLesson(lessonId), isNull);
  });

  test('удаление занятия удаляет его оценку', () async {
    final enrollmentId = await seed.enrollment();
    final lessonId = await seed.lesson(
      enrollmentId,
      startsAt: DateTime(2026, 10, 1, 18),
      status: LessonStatus.completed,
    );
    await progress.saveLessonResult(
      lessonId: lessonId,
      enrollmentId: enrollmentId,
      date: DateTime(2026, 10, 1, 18),
      grade: 5,
    );

    await seed.lessons.deleteLesson(lessonId);

    expect(await progress.getEntryForLesson(lessonId), isNull);
    expect((await progress.watchProgress(enrollmentId).first).items, isEmpty);
  });
}

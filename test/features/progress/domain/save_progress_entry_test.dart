import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/database/drift_transaction_runner.dart';
import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/progress/data/repositories/drift_progress_repository.dart';
import 'package:tutor_app/features/progress/domain/models/progress_entry.dart';
import 'package:tutor_app/features/progress/domain/usecases/save_progress_entry.dart';

import '../../../helpers/seed.dart';

void main() {
  late AppDatabase db;
  late Seed seed;
  late DriftProgressRepository progress;
  late SaveProgressEntryUseCase save;
  late int enrollmentId;

  setUp(() async {
    db = createTestDatabase();
    seed = Seed(db);
    progress = DriftProgressRepository(db);
    save = SaveProgressEntryUseCase(
      progress: progress,
      lessons: seed.lessons,
      students: seed.students,
      transaction: DriftTransactionRunner(db),
      clock: () => DateTime(2026, 10, 13, 12),
    );
    enrollmentId = await seed.enrollment();
  });

  tearDown(() => db.close());

  ProgressEntryDraft draft({
    int? lessonId,
    String? topic = 'Контрольная',
    int? grade = 4,
    String? note,
    DateTime? date,
  }) => ProgressEntryDraft(
    enrollmentId: enrollmentId,
    lessonId: lessonId,
    date: date ?? DateTime(2026, 10, 12),
    topic: topic,
    grade: grade,
    note: note,
  );

  group('самостоятельная запись', () {
    test('сохраняется с темой, оценкой и датой', () async {
      final id = await save.create(draft(note: '  '));

      final entry = await progress.getEntry(id);
      expect(entry?.topic, 'Контрольная');
      expect(entry?.grade, 4);
      expect(entry?.note, isNull);
      final items = (await progress.watchProgress(enrollmentId).first).items;
      expect(items.single.topic, 'Контрольная');
    });

    test(
      'пустая запись, оценка вне шкалы и будущая дата отклоняются',
      () async {
        await expectLater(
          save.create(draft(topic: ' ', grade: null)),
          throwsA(isA<ValidationFailure>()),
        );
        await expectLater(
          save.create(draft(grade: 6)),
          throwsA(isA<ValidationFailure>()),
        );
        await expectLater(
          save.create(draft(date: DateTime(2026, 10, 14))),
          throwsA(isA<ValidationFailure>()),
        );
      },
    );
  });

  group('привязка к занятию', () {
    test('дата из занятия, тема записывается в занятие', () async {
      final lessonId = await seed.lesson(
        enrollmentId,
        startsAt: DateTime(2026, 10, 5, 18),
        status: LessonStatus.completed,
      );

      final id = await save.create(
        draft(lessonId: lessonId, topic: 'Дроби', grade: 5),
      );

      final entry = await progress.getEntry(id);
      expect(entry?.lessonId, lessonId);
      expect(entry?.date, DateTime(2026, 10, 5, 18));
      expect(entry?.topic, isNull);
      expect((await seed.lessons.getLesson(lessonId))?.topic, 'Дроби');
      final item =
          (await progress.watchProgress(enrollmentId).first).items.single;
      expect(item.topic, 'Дроби');
      expect(item.grade, 5);
    });

    test(
      'оценка только для проведённого, заметка — для любого прошедшего',
      () async {
        final missed = await seed.lesson(
          enrollmentId,
          startsAt: DateTime(2026, 10, 5, 18),
          status: LessonStatus.noShow,
        );

        await expectLater(
          save.create(draft(lessonId: missed)),
          throwsA(isA<ValidationFailure>()),
        );
        await save.create(
          draft(lessonId: missed, topic: null, grade: null, note: 'Болел'),
        );
        expect((await progress.getEntryForLesson(missed))?.note, 'Болел');
      },
    );

    test('запланированное, чужое и уже занятое занятие отклоняются', () async {
      final planned = await seed.lesson(
        enrollmentId,
        startsAt: DateTime(2026, 10, 20, 18),
      );
      final foreign = await seed.lesson(
        await seed.enrollment(),
        startsAt: DateTime(2026, 10, 5, 18),
        status: LessonStatus.completed,
      );
      final taken = await seed.lesson(
        enrollmentId,
        startsAt: DateTime(2026, 10, 6, 18),
        status: LessonStatus.completed,
      );
      await save.create(draft(lessonId: taken));

      await expectLater(
        save.create(draft(lessonId: planned)),
        throwsA(isA<ValidationFailure>()),
      );
      await expectLater(
        save.create(draft(lessonId: foreign)),
        throwsA(isA<ValidationFailure>()),
      );
      await expectLater(
        save.create(draft(lessonId: taken)),
        throwsA(isA<ConflictFailure>()),
      );
    });

    test('самостоятельную запись можно привязать к занятию позже', () async {
      final lessonId = await seed.lesson(
        enrollmentId,
        startsAt: DateTime(2026, 10, 5, 18),
        status: LessonStatus.completed,
      );
      final id = await save.create(draft());
      final entry = await progress.getEntry(id);

      await save.update(entry!.copyWith(lessonId: lessonId));

      final linked = await progress.getEntry(id);
      expect(linked?.lessonId, lessonId);
      expect(linked?.date, DateTime(2026, 10, 5, 18));
      expect((await seed.lessons.getLesson(lessonId))?.topic, 'Контрольная');
    });
  });
}

import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/database/tables/lessons_table.dart';
import 'package:tutor_app/core/database/tables/payments_table.dart';
import 'package:tutor_app/features/finance/domain/models/payment_method.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() => db.close());

  Future<int> insertStudent() =>
      db.into(db.students).insert(StudentsCompanion.insert(fullName: 'Анна'));

  Future<int> insertSubject([String name = 'Математика']) =>
      db.into(db.subjects).insert(SubjectsCompanion.insert(name: name));

  Future<int> insertEnrollment(int studentId, int subjectId) => db
      .into(db.enrollments)
      .insert(
        EnrollmentsCompanion.insert(
          studentId: studentId,
          subjectId: subjectId,
          rateKopecks: 150000,
        ),
      );

  Future<int> insertLesson(
    int enrollmentId, {
    String status = 'planned',
    int? packageId,
  }) => db
      .into(db.lessons)
      .insert(
        LessonsCompanion.insert(
          enrollmentId: enrollmentId,
          startsAt: DateTime(2026, 10, 13, 18),
          durationMinutes: 60,
          priceKopecks: 150000,
          status: Value(status),
          packageId: Value(packageId),
        ),
      );

  Future<int> insertPackage(int enrollmentId) => db
      .into(db.lessonPackages)
      .insert(
        LessonPackagesCompanion.insert(
          enrollmentId: enrollmentId,
          lessonsCount: 10,
          priceKopecks: 1350000,
          purchasedAt: DateTime(2026, 10, 1),
        ),
      );

  Future<int> insertEnrollmentFixture() async =>
      insertEnrollment(await insertStudent(), await insertSubject());

  group('схема', () {
    test('создаёт все таблицы и индексы', () async {
      final rows = await db
          .customSelect(
            "SELECT name FROM sqlite_master WHERE type IN ('table', 'index') "
            "AND name NOT LIKE 'sqlite_%'",
          )
          .get();
      final names = rows.map((row) => row.read<String>('name')).toSet();

      expect(
        names,
        containsAll([
          'students',
          'subjects',
          'enrollments',
          'lesson_packages',
          'lessons',
          'payments',
          'progress_entries',
          'app_settings',
          'idx_students_archived_name',
          'idx_enrollments_subject',
          'idx_lesson_packages_enrollment_purchased_at',
          'idx_lessons_starts_at',
          'idx_lessons_enrollment_starts_at',
          'idx_lessons_package',
          'idx_payments_student_paid_at',
          'idx_payments_paid_at',
          'idx_progress_entries_enrollment_date',
        ]),
      );
    });

    test('внешние ключи включены', () async {
      final row = await db.customSelect('PRAGMA foreign_keys').getSingle();
      expect(row.read<int>('foreign_keys'), 1);
      await expectLater(insertLesson(999), throwsA(isA<Exception>()));
    });

    test('значения CHECK совпадают с доменными перечислениями', () {
      expect(lessonStatusValues, LessonStatus.values.map((s) => s.name));
      expect(
        billableLessonStatusValues,
        LessonStatus.values.where((s) => s.isBillable).map((s) => s.name),
      );
      expect(paymentMethodValues, PaymentMethod.values.map((m) => m.name));
    });

    test('дата сохраняется и читается в локальном времени', () async {
      final enrollmentId = await insertEnrollmentFixture();
      final id = await insertLesson(enrollmentId);
      final lesson = await (db.select(
        db.lessons,
      )..where((t) => t.id.equals(id))).getSingle();

      expect(lesson.startsAt, DateTime(2026, 10, 13, 18));
      expect(lesson.startsAt.isUtc, isFalse);
    });
  });

  group('ограничения', () {
    test('неизвестный статус занятия отклоняется', () async {
      final enrollmentId = await insertEnrollmentFixture();
      await expectLater(
        insertLesson(enrollmentId, status: 'unknown'),
        throwsA(isA<Exception>()),
      );
    });

    test('из пакета списываются только оплачиваемые занятия', () async {
      final enrollmentId = await insertEnrollmentFixture();
      final packageId = await insertPackage(enrollmentId);

      await expectLater(
        insertLesson(enrollmentId, packageId: packageId),
        throwsA(isA<Exception>()),
      );
      await expectLater(
        insertLesson(enrollmentId, status: 'completed', packageId: packageId),
        completes,
      );
    });

    test('платёж должен быть положительным', () async {
      final studentId = await insertStudent();
      await expectLater(
        db
            .into(db.payments)
            .insert(
              PaymentsCompanion.insert(
                studentId: studentId,
                amountKopecks: 0,
                paidAt: DateTime(2026, 10, 13),
              ),
            ),
        throwsA(isA<Exception>()),
      );
    });

    test('шкала оценок: минимум меньше максимума', () async {
      await expectLater(
        db
            .into(db.students)
            .insert(
              StudentsCompanion.insert(
                fullName: 'Борис',
                gradeScaleMin: const Value(5),
                gradeScaleMax: const Value(5),
              ),
            ),
        throwsA(isA<Exception>()),
      );
    });

    test('один предмет у ученика — одно направление', () async {
      final studentId = await insertStudent();
      final subjectId = await insertSubject();
      await insertEnrollment(studentId, subjectId);

      await expectLater(
        insertEnrollment(studentId, subjectId),
        throwsA(isA<Exception>()),
      );
    });

    test('запись прогресса не может быть пустой', () async {
      final enrollmentId = await insertEnrollmentFixture();
      await expectLater(
        db
            .into(db.progressEntries)
            .insert(
              ProgressEntriesCompanion.insert(
                enrollmentId: enrollmentId,
                entryDate: DateTime(2026, 10, 13),
              ),
            ),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('удаление', () {
    test('удаление ученика каскадно удаляет его данные', () async {
      final studentId = await insertStudent();
      final enrollmentId = await insertEnrollment(
        studentId,
        await insertSubject(),
      );
      final packageId = await insertPackage(enrollmentId);
      final lessonId = await insertLesson(
        enrollmentId,
        status: 'completed',
        packageId: packageId,
      );
      await db
          .into(db.progressEntries)
          .insert(
            ProgressEntriesCompanion.insert(
              enrollmentId: enrollmentId,
              lessonId: Value(lessonId),
              entryDate: DateTime(2026, 10, 13),
              grade: const Value(5),
            ),
          );
      await db
          .into(db.payments)
          .insert(
            PaymentsCompanion.insert(
              studentId: studentId,
              amountKopecks: 150000,
              paidAt: DateTime(2026, 10, 13),
            ),
          );

      await (db.delete(db.students)..where((t) => t.id.equals(studentId))).go();

      for (final table in <TableInfo<Table, Object?>>[
        db.enrollments,
        db.lessonPackages,
        db.lessons,
        db.progressEntries,
        db.payments,
      ]) {
        expect(
          await db.select(table).get(),
          isEmpty,
          reason: table.actualTableName,
        );
      }
    });

    test('используемый предмет удалить нельзя', () async {
      final subjectId = await insertSubject();
      await insertEnrollment(await insertStudent(), subjectId);

      await expectLater(
        (db.delete(db.subjects)..where((t) => t.id.equals(subjectId))).go(),
        throwsA(isA<Exception>()),
      );
    });

    test('при удалении пакета занятия становятся платными', () async {
      final enrollmentId = await insertEnrollmentFixture();
      final packageId = await insertPackage(enrollmentId);
      final lessonId = await insertLesson(
        enrollmentId,
        status: 'completed',
        packageId: packageId,
      );

      await (db.delete(
        db.lessonPackages,
      )..where((t) => t.id.equals(packageId))).go();

      final lesson = await (db.select(
        db.lessons,
      )..where((t) => t.id.equals(lessonId))).getSingle();
      expect(lesson.packageId, isNull);
    });
  });
}

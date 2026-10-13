import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/students/domain/models/enrollment.dart';
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

  group('ученики', () {
    test('список по алфавиту без учёта регистра, архив отдельно', () async {
      await seed.student('борис');
      await seed.student('Анна');
      final archivedId = await seed.student('Вера');
      await seed.students.setStudentArchived(archivedId, archived: true);

      final active = await seed.students.watchStudents().first;
      final archived = await seed.students.watchStudents(archived: true).first;

      expect(active.map((s) => s.fullName), ['Анна', 'борис']);
      expect(archived.map((s) => s.fullName), ['Вера']);
    });

    test('создание и обновление сохраняют все поля', () async {
      final id = await seed.students.createStudent(
        const StudentDraft(
          fullName: '  Анна  ',
          phone: '+79990000000',
          gradeScale: GradeScale.tenPoint,
        ),
      );
      final created = await seed.students.getStudent(id);

      expect(created?.fullName, 'Анна');
      expect(created?.gradeScale, GradeScale.tenPoint);

      await seed.students.updateStudent(
        created!.copyWith(telegram: '@anna', gradeScale: GradeScale.percent),
      );
      final updated = await seed.students.getStudent(id);

      expect(updated?.telegram, '@anna');
      expect(updated?.phone, '+79990000000');
      expect(updated?.gradeScale, GradeScale.percent);
    });

    test('обновление несуществующего ученика — NotFoundFailure', () async {
      await expectLater(
        seed.students.updateStudent(const Student(id: 42, fullName: 'Нет')),
        throwsA(isA<NotFoundFailure>()),
      );
    });

    test('watchStudent отдаёт null после удаления', () async {
      final id = await seed.student();
      final stream = seed.students.watchStudent(id).map((s) => s?.id);
      final expectation = expectLater(stream, emitsInOrder([id, null]));

      await Future<void>.delayed(Duration.zero);
      await seed.students.deleteStudent(id);
      await expectation;
    });
  });

  group('направления', () {
    test('с предметами, по названию предмета, без архивных', () async {
      final studentId = await seed.student();
      final physics = await seed.subject('Физика');
      final math = await seed.subject('Математика');
      final english = await seed.subject('Английский');
      await seed.enrollment(studentId: studentId, subjectId: physics);
      await seed.enrollment(studentId: studentId, subjectId: math);
      final archivedId = await seed.enrollment(
        studentId: studentId,
        subjectId: english,
      );
      final archived = await seed.students.getEnrollment(archivedId);
      await seed.students.updateEnrollment(
        archived!.copyWith(isArchived: true),
      );

      final active = await seed.students.watchEnrollments(studentId).first;
      final all = await seed.students
          .watchEnrollments(studentId, includeArchived: true)
          .first;

      expect(active.map((e) => e.subject.name), ['Математика', 'Физика']);
      expect(all, hasLength(3));
    });

    test('второе направление по тому же предмету — ConflictFailure', () async {
      final studentId = await seed.student();
      final subjectId = await seed.subject();
      await seed.enrollment(studentId: studentId, subjectId: subjectId);

      await expectLater(
        seed.students.createEnrollment(
          EnrollmentDraft(
            studentId: studentId,
            subjectId: subjectId,
            rate: const Money.rubles(2000),
          ),
        ),
        throwsA(isA<ConflictFailure>()),
      );
    });

    test('обновление меняет ставку, но не предмет', () async {
      final id = await seed.enrollment();
      final enrollment = await seed.students.getEnrollment(id);

      await seed.students.updateEnrollment(
        enrollment!.copyWith(rate: const Money.rubles(2000), subjectId: 999),
      );
      final updated = await seed.students.getEnrollment(id);

      expect(updated?.rate, const Money.rubles(2000));
      expect(updated?.subjectId, enrollment.subjectId);
    });
  });

  group('предметы', () {
    test(
      'название уникально без учёта регистра, в том числе кириллицы',
      () async {
        await seed.subject('Математика');

        await expectLater(
          seed.subjects.createSubject(' математика '),
          throwsA(isA<ConflictFailure>()),
        );
      },
    );

    test('переименование в своё же название разрешено', () async {
      final id = await seed.subject('математика');
      await seed.subjects.renameSubject(id, 'Математика');

      final subjects = await seed.subjects.watchSubjects().first;
      expect(subjects.single.name, 'Математика');
    });

    test('используемый предмет удалить нельзя, свободный — можно', () async {
      final used = await seed.subject();
      final free = await seed.subject();
      await seed.enrollment(subjectId: used);

      await expectLater(
        seed.subjects.deleteSubject(used),
        throwsA(isA<ConflictFailure>()),
      );
      await seed.subjects.deleteSubject(free);

      final subjects = await seed.subjects.watchSubjects().first;
      expect(subjects.map((s) => s.id), [used]);
    });
  });
}

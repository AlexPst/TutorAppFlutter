import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/students/domain/models/grade_scale.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';

void main() {
  group('Money', () {
    test('арифметика и сравнение', () {
      const rate = Money.rubles(1500);

      expect(rate.kopecks, 150000);
      expect(rate * 3 - const Money.rubles(500), const Money.rubles(4000));
      expect(-rate, const Money(-150000));
      expect((-rate).abs(), rate);
      expect(Money.zero < rate, isTrue);
      expect((Money.zero - rate).isNegative, isTrue);
    });
  });

  group('GradeScale', () {
    test('проверяет попадание в диапазон и нормализует', () {
      expect(GradeScale.fivePoint.contains(5), isTrue);
      expect(GradeScale.fivePoint.contains(1), isFalse);
      expect(GradeScale.fivePoint.normalize(2), 0);
      expect(GradeScale.tenPoint.normalize(10), 1);
      expect(GradeScale.percent.normalize(50), 0.5);
    });

    test('минимум должен быть меньше максимума', () {
      final min = 5;
      expect(
        () => GradeScale(min: min, max: 2),
        throwsA(isA<AssertionError>()),
      );
    });
  });

  group('Lesson.charge', () {
    final lesson = Lesson(
      id: 1,
      enrollmentId: 1,
      startsAt: DateTime(2026, 10, 13, 18),
      duration: const Duration(minutes: 60),
      price: const Money.rubles(1500),
    );

    test('запланированное и отменённое преподавателем не начисляются', () {
      expect(lesson.charge, Money.zero);
      expect(
        lesson.copyWith(status: LessonStatus.cancelledByTutor).charge,
        Money.zero,
      );
    });

    test('оплачиваемые статусы начисляют стоимость', () {
      for (final status in [
        LessonStatus.completed,
        LessonStatus.cancelledByStudent,
        LessonStatus.noShow,
      ]) {
        expect(lesson.copyWith(status: status).charge, lesson.price);
      }
    });

    test('занятие из пакета не начисляется', () {
      expect(
        lesson.copyWith(status: LessonStatus.completed, packageId: 7).charge,
        Money.zero,
      );
    });

    test('время окончания', () {
      expect(lesson.endsAt, DateTime(2026, 10, 13, 19));
    });
  });

  group('JSON', () {
    test('Student с вложенной шкалой', () {
      const student = Student(
        id: 1,
        fullName: 'Анна',
        gradeScale: GradeScale.tenPoint,
      );

      expect(student.toJson()['gradeScale'], {'min': 1, 'max': 10});
      expect(Student.fromJson(student.toJson()), student);
    });

    test('Lesson с деньгами, длительностью и статусом', () {
      final lesson = Lesson(
        id: 1,
        enrollmentId: 2,
        startsAt: DateTime(2026, 10, 13, 18),
        duration: const Duration(minutes: 90),
        status: LessonStatus.noShow,
        price: const Money.rubles(2000),
      );
      final json = lesson.toJson();

      expect(json['price'], 200000);
      expect(json['status'], 'noShow');
      expect(Lesson.fromJson(json), lesson);
    });
  });
}

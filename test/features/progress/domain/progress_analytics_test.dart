import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_app/features/progress/domain/models/subject_progress.dart';
import 'package:tutor_app/features/progress/domain/models/topic_mastery.dart';
import 'package:tutor_app/features/progress/domain/services/progress_analytics.dart';
import 'package:tutor_app/features/students/domain/models/grade_scale.dart';

/// Записи передаются в хронологическом порядке, а в [SubjectProgress]
/// кладутся от новых к старым — как их отдаёт репозиторий.
SubjectProgress _progress(List<(String?, int?)> chronological) =>
    SubjectProgress(
      enrollmentId: 1,
      items: [
        for (final (index, (topic, grade)) in chronological.indexed)
          ProgressItem(
            date: DateTime(2026, 10, 1 + index),
            topic: topic,
            grade: grade,
          ),
      ].reversed.toList(),
    );

void main() {
  group('уровень освоения', () {
    test('одинаков для разных шкал', () {
      expect(
        MasteryLevel.of(GradeScale.fivePoint.normalize(5)),
        MasteryLevel.mastered,
      );
      expect(
        MasteryLevel.of(GradeScale.tenPoint.normalize(8)),
        MasteryLevel.good,
      );
      expect(
        MasteryLevel.of(GradeScale.percent.normalize(45)),
        MasteryLevel.review,
      );
      expect(
        MasteryLevel.of(GradeScale.fivePoint.normalize(2)),
        MasteryLevel.weak,
      );
    });
  });

  group('темы', () {
    test('группировка без учёта регистра, последняя оценка решает', () {
      final topics = ProgressAnalytics.topics(
        _progress([
          ('дроби', 3),
          ('Уравнения', 5),
          (' Дроби ', 4),
          (null, 5),
          ('Графики', null),
        ]),
      );

      expect(topics.map((t) => t.topic), ['Дроби', 'Уравнения', 'Графики']);
      final fractions = topics.first;
      expect(fractions.lastGrade, 4);
      expect(fractions.averageGrade, 3.5);
      expect(fractions.entriesCount, 2);
      expect(fractions.gradesCount, 2);
      expect(fractions.lastDate, DateTime(2026, 10, 3));
      expect(topics.last.lastGrade, isNull);
    });

    test('без тем — пусто', () {
      expect(ProgressAnalytics.topics(_progress([(null, 5)])), isEmpty);
    });
  });

  group('динамика', () {
    const scale = GradeScale.fivePoint;

    ProgressTrend? trend(List<int> grades) => ProgressAnalytics.trend(
      _progress([for (final grade in grades) ('Тема', grade)]),
      scale,
    );

    test('меньше двух оценок — динамики нет', () {
      expect(trend([]), isNull);
      expect(trend([4]), isNull);
    });

    test('сравнение последних оценок с предыдущими', () {
      expect(trend([3, 5]), ProgressTrend.up);
      expect(trend([5, 3]), ProgressTrend.down);
      expect(trend([4, 4]), ProgressTrend.stable);
      // Окно — 3 последние против 3 предыдущих: 2,2,2 → 3,4,5.
      expect(trend([5, 2, 2, 2, 3, 4, 5]), ProgressTrend.up);
    });

    test('оценки без темы тоже учитываются', () {
      final progress = _progress([(null, 3), ('Дроби', 5)]);
      expect(ProgressAnalytics.trend(progress, scale), ProgressTrend.up);
    });
  });
}

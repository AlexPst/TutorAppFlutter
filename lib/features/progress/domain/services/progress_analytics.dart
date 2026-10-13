import 'package:tutor_app/features/progress/domain/models/subject_progress.dart';
import 'package:tutor_app/features/progress/domain/models/topic_mastery.dart';
import 'package:tutor_app/features/students/domain/models/grade_scale.dart';

/// Аналитика прогресса по направлению. Чистые функции без доступа к данным.
abstract final class ProgressAnalytics {
  /// Сколько последних оценок сравнивается с предыдущими.
  static const trendWindow = 3;

  /// Изменение средней доли шкалы, которое ещё считается «стабильно».
  static const trendThreshold = 0.05;

  /// Темы направления. Записи без темы не учитываются; темы сравниваются
  /// без учёта регистра и пробелов по краям. Сначала темы, где последняя
  /// оценка ниже (их нужно повторить), затем темы без оценок — по дате.
  static List<TopicMastery> topics(SubjectProgress progress) {
    final byKey = <String, List<ProgressItem>>{};
    // Элементы приходят от новых к старым — первый в группе самый свежий.
    for (final item in progress.items) {
      final topic = item.topic?.trim();
      if (topic == null || topic.isEmpty) continue;
      byKey.putIfAbsent(topic.toLowerCase(), () => []).add(item);
    }

    final topics = [for (final items in byKey.values) _mastery(items)];
    topics.sort((a, b) {
      final aGrade = a.lastGrade;
      final bGrade = b.lastGrade;
      if (aGrade != null && bGrade != null && aGrade != bGrade) {
        return aGrade.compareTo(bGrade);
      }
      if ((aGrade == null) != (bGrade == null)) {
        return aGrade == null ? 1 : -1;
      }
      return b.lastDate.compareTo(a.lastDate);
    });
    return topics;
  }

  static TopicMastery _mastery(List<ProgressItem> newestFirst) {
    final grades = [for (final item in newestFirst) ?item.grade];
    return TopicMastery(
      topic: newestFirst.first.topic!.trim(),
      lastDate: newestFirst.first.date,
      entriesCount: newestFirst.length,
      lastGrade: grades.firstOrNull,
      gradesCount: grades.length,
      averageGrade: grades.isEmpty
          ? null
          : grades.reduce((a, b) => a + b) / grades.length,
    );
  }

  /// Динамика: средняя доля шкалы последних [trendWindow] оценок против
  /// стольких же предыдущих. `null`, если оценок меньше двух.
  static ProgressTrend? trend(SubjectProgress progress, GradeScale scale) {
    final grades = [
      for (final item in progress.gradedChronologically)
        scale.normalize(item.grade!),
    ];
    if (grades.length < 2) return null;

    final recentCount = grades.length >= 2 * trendWindow
        ? trendWindow
        : grades.length ~/ 2;
    final recent = grades.sublist(grades.length - recentCount);
    final previous = grades.sublist(
      (grades.length - 2 * recentCount).clamp(0, grades.length),
      grades.length - recentCount,
    );

    final change = _mean(recent) - _mean(previous);
    if (change > trendThreshold) return ProgressTrend.up;
    if (change < -trendThreshold) return ProgressTrend.down;
    return ProgressTrend.stable;
  }

  static double _mean(List<double> values) =>
      values.reduce((a, b) => a + b) / values.length;
}

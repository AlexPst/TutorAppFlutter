import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_mastery.freezed.dart';

/// Уровень освоения по доле от шкалы ученика. Одинаково трактуется
/// для шкал 2–5, 1–10 и 0–100.
enum MasteryLevel {
  mastered,
  good,
  review,
  weak;

  /// [normalized] — оценка, приведённая к 0..1 (`GradeScale.normalize`).
  static MasteryLevel of(double normalized) => switch (normalized) {
    >= 0.85 => mastered,
    >= 0.6 => good,
    >= 0.4 => review,
    _ => weak,
  };
}

/// Сводка по одной теме: последняя оценка решает уровень освоения,
/// средняя показывает историю.
@freezed
abstract class TopicMastery with _$TopicMastery {
  const factory TopicMastery({
    /// Написание из самой свежей записи.
    required String topic,
    required DateTime lastDate,

    /// Записей по теме: занятий и самостоятельных записей.
    required int entriesCount,
    int? lastGrade,
    double? averageGrade,
    @Default(0) int gradesCount,
  }) = _TopicMastery;
}

/// Направление изменения оценок.
enum ProgressTrend { up, down, stable }

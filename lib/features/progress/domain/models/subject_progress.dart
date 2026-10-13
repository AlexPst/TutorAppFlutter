import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_progress.freezed.dart';

/// Строка хронологии прогресса: проведённое занятие (с темой) и/или запись
/// прогресса (оценка, заметка).
@freezed
abstract class ProgressItem with _$ProgressItem {
  const factory ProgressItem({
    required DateTime date,
    int? lessonId,
    int? entryId,
    String? topic,
    int? grade,
    String? note,
  }) = _ProgressItem;
}

/// Прогресс ученика по одному направлению.
@freezed
abstract class SubjectProgress with _$SubjectProgress {
  const factory SubjectProgress({
    required int enrollmentId,

    /// Сначала новые.
    required List<ProgressItem> items,
  }) = _SubjectProgress;

  const SubjectProgress._();

  /// Оценённые записи в хронологическом порядке — для графика.
  List<ProgressItem> get gradedChronologically =>
      items.where((item) => item.grade != null).toList().reversed.toList();

  double? get averageGrade {
    final grades = [for (final item in items) ?item.grade];
    if (grades.isEmpty) return null;
    return grades.reduce((a, b) => a + b) / grades.length;
  }
}

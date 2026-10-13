import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_entry.freezed.dart';
part 'progress_entry.g.dart';

/// Запись прогресса по направлению: оценка и/или заметка.
///
/// Если запись привязана к занятию ([lessonId]), тема берётся из занятия,
/// а [topic] остаётся пустым. Самостоятельные записи (например, контрольная
/// вне занятия) хранят тему в [topic].
@freezed
abstract class ProgressEntry with _$ProgressEntry {
  const factory ProgressEntry({
    required int id,
    required int enrollmentId,
    int? lessonId,
    required DateTime date,
    String? topic,
    int? grade,
    String? note,
  }) = _ProgressEntry;

  const ProgressEntry._();

  factory ProgressEntry.fromJson(Map<String, dynamic> json) =>
      _$ProgressEntryFromJson(json);

  bool get isLinkedToLesson => lessonId != null;
}

/// Данные для создания записи прогресса.
@freezed
abstract class ProgressEntryDraft with _$ProgressEntryDraft {
  const factory ProgressEntryDraft({
    required int enrollmentId,
    int? lessonId,
    required DateTime date,
    String? topic,
    int? grade,
    String? note,
  }) = _ProgressEntryDraft;
}

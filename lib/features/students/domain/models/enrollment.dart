import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutor_app/core/domain/money.dart';

part 'enrollment.freezed.dart';
part 'enrollment.g.dart';

/// Направление: занятия ученика по одному предмету со своей ставкой.
@freezed
abstract class Enrollment with _$Enrollment {
  const factory Enrollment({
    required int id,
    required int studentId,
    required int subjectId,
    @MoneyConverter() required Money rate,
    required Duration defaultDuration,

    /// Общая заметка по направлению: цели, слабые места.
    String? note,
    @Default(false) bool isArchived,
  }) = _Enrollment;

  factory Enrollment.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentFromJson(json);
}

/// Данные для создания направления.
@freezed
abstract class EnrollmentDraft with _$EnrollmentDraft {
  const factory EnrollmentDraft({
    required int studentId,
    required int subjectId,
    required Money rate,
    @Default(Duration(minutes: 60)) Duration defaultDuration,
    String? note,
  }) = _EnrollmentDraft;
}

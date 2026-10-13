import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutor_app/features/students/domain/models/grade_scale.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
abstract class Student with _$Student {
  const factory Student({
    required int id,
    required String fullName,
    String? phone,
    String? telegram,
    String? note,
    @Default(GradeScale.fivePoint) GradeScale gradeScale,
    @Default(false) bool isArchived,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
}

/// Данные для создания ученика.
@freezed
abstract class StudentDraft with _$StudentDraft {
  const factory StudentDraft({
    required String fullName,
    String? phone,
    String? telegram,
    String? note,
    @Default(GradeScale.fivePoint) GradeScale gradeScale,
  }) = _StudentDraft;
}

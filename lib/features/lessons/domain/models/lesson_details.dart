import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson.dart';
import 'package:tutor_app/features/students/domain/models/grade_scale.dart';

part 'lesson_details.freezed.dart';

/// Занятие с данными ученика и предмета — для списков и карточек.
@freezed
abstract class LessonDetails with _$LessonDetails {
  const factory LessonDetails({
    required Lesson lesson,
    required int studentId,
    required String studentName,
    required int subjectId,
    required String subjectName,
    required GradeScale gradeScale,
  }) = _LessonDetails;
}

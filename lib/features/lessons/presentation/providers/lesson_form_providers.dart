import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_details.dart';
import 'package:tutor_app/features/lessons/lessons_providers.dart';
import 'package:tutor_app/features/progress/domain/models/progress_entry.dart';
import 'package:tutor_app/features/progress/progress_providers.dart';
import 'package:tutor_app/features/students/domain/models/enrollment_with_subject.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';
import 'package:tutor_app/features/students/students_providers.dart';

part 'lesson_form_providers.g.dart';

/// Ученики, которым можно назначить занятие.
@riverpod
Stream<List<Student>> lessonFormStudents(Ref ref) =>
    ref.watch(studentRepositoryProvider).watchStudents();

/// Активные предметы ученика.
@riverpod
Stream<List<EnrollmentWithSubject>> lessonFormEnrollments(
  Ref ref,
  int studentId,
) => ref.watch(studentRepositoryProvider).watchEnrollments(studentId);

@riverpod
Stream<LessonDetails?> lessonDetails(Ref ref, int lessonId) =>
    ref.watch(lessonRepositoryProvider).watchLesson(lessonId);

/// Оценка и комментарий занятия — для формы отметки.
@riverpod
Future<ProgressEntry?> lessonProgressEntry(Ref ref, int lessonId) =>
    ref.watch(progressRepositoryProvider).getEntryForLesson(lessonId);

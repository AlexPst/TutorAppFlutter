import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_details.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/lessons/lessons_providers.dart';
import 'package:tutor_app/features/progress/domain/models/progress_entry.dart';
import 'package:tutor_app/features/progress/domain/models/subject_progress.dart';
import 'package:tutor_app/features/progress/progress_providers.dart';
import 'package:tutor_app/features/students/domain/models/enrollment.dart';
import 'package:tutor_app/features/students/domain/models/enrollment_with_subject.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';
import 'package:tutor_app/features/students/students_providers.dart';

part 'progress_screen_providers.g.dart';

/// Ученик и предмет, к которым относится прогресс.
typedef ProgressContext = ({Student student, EnrollmentWithSubject enrollment});

/// Направление по id — чтобы узнать ученика.
@riverpod
Future<Enrollment?> progressEnrollment(Ref ref, int enrollmentId) =>
    ref.watch(studentRepositoryProvider).getEnrollment(enrollmentId);

@riverpod
Stream<Student?> progressStudent(Ref ref, int studentId) =>
    ref.watch(studentRepositoryProvider).watchStudent(studentId);

@riverpod
Stream<List<EnrollmentWithSubject>> progressStudentEnrollments(
  Ref ref,
  int studentId,
) => ref
    .watch(studentRepositoryProvider)
    .watchEnrollments(studentId, includeArchived: true);

/// `null`, если направление или ученик удалены. Следит за учеником
/// и его предметами, поэтому смена шкалы сразу отражается на графике.
///
/// Стримы объединяются через провайдеры. Вложенное ожидание `.first`
/// одного стрима Drift внутри обработчика другого приводило к зависанию
/// всех запросов (воспроизводилось в виджетных тестах).
@riverpod
Future<ProgressContext?> progressContext(Ref ref, int enrollmentId) async {
  final enrollment = await ref.watch(
    progressEnrollmentProvider(enrollmentId).future,
  );
  if (enrollment == null) return null;
  final studentId = enrollment.studentId;
  final (student, enrollments) = await (
    ref.watch(progressStudentProvider(studentId).future),
    ref.watch(progressStudentEnrollmentsProvider(studentId).future),
  ).wait;
  final item = enrollments
      .where((item) => item.enrollment.id == enrollmentId)
      .firstOrNull;
  if (student == null || item == null) return null;
  return (student: student, enrollment: item);
}

@riverpod
Stream<SubjectProgress> subjectProgress(Ref ref, int enrollmentId) =>
    ref.watch(progressRepositoryProvider).watchProgress(enrollmentId);

/// Прошедшие занятия направления (сначала новые) — варианты привязки
/// записи прогресса.
@riverpod
Stream<List<LessonDetails>> pastLessons(Ref ref, int enrollmentId) => ref
    .watch(lessonRepositoryProvider)
    .watchLessons(enrollmentId: enrollmentId)
    .map(
      (lessons) => [
        for (final details in lessons.reversed)
          if (details.lesson.status != LessonStatus.planned) details,
      ],
    );

@riverpod
Future<ProgressEntry?> progressEntryForEdit(Ref ref, int entryId) =>
    ref.watch(progressRepositoryProvider).getEntry(entryId);

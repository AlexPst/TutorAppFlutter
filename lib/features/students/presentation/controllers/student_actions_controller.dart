import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/features/students/domain/student_validator.dart';
import 'package:tutor_app/features/students/students_providers.dart';

part 'student_actions_controller.g.dart';

/// Действия карточки ученика: архив, удаление, заметки.
/// Каждый метод возвращает `true` при успехе; ошибка попадает в состояние.
@riverpod
class StudentActionsController extends _$StudentActionsController {
  @override
  FutureOr<void> build(int studentId) {}

  Future<bool> setArchived({required bool archived}) => _run(
    () => ref
        .read(studentRepositoryProvider)
        .setStudentArchived(studentId, archived: archived),
  );

  Future<bool> delete() =>
      _run(() => ref.read(studentRepositoryProvider).deleteStudent(studentId));

  Future<bool> saveNote(String note) => _run(() async {
    final repository = ref.read(studentRepositoryProvider);
    final student = await repository.getStudent(studentId);
    if (student == null) {
      throw const NotFoundFailure(FailureReason.studentNotFound);
    }
    await repository.updateStudent(
      student.copyWith(note: StudentValidator.optionalText(note)),
    );
  });

  Future<bool> saveEnrollmentNote(int enrollmentId, String note) =>
      _run(() async {
        final repository = ref.read(studentRepositoryProvider);
        final enrollment = await repository.getEnrollment(enrollmentId);
        if (enrollment == null) {
          throw const NotFoundFailure(FailureReason.enrollmentNotFound);
        }
        await repository.updateEnrollment(
          enrollment.copyWith(note: StudentValidator.optionalText(note)),
        );
      });

  Future<bool> _run(Future<void> Function() action) async {
    state = const AsyncLoading();
    try {
      await action();
      if (ref.mounted) state = const AsyncData(null);
      return true;
    } on Object catch (error, stackTrace) {
      if (ref.mounted) state = AsyncError(error, stackTrace);
      return false;
    }
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/students/domain/models/enrollment.dart';
import 'package:tutor_app/features/students/domain/student_validator.dart';
import 'package:tutor_app/features/students/students_providers.dart';
import 'package:tutor_app/features/subjects/subjects_providers.dart';

part 'enrollment_form_controller.g.dart';

/// Сохраняет направление и создаёт новые предметы прямо из формы.
@riverpod
class EnrollmentFormController extends _$EnrollmentFormController {
  @override
  FutureOr<void> build() {}

  /// Создаёт направление, если [initial] равен `null`, иначе обновляет его.
  /// Возвращает `true` при успехе.
  Future<bool> save({
    required int studentId,
    Enrollment? initial,
    required int subjectId,
    required Money rate,
    required Duration defaultDuration,
    required String note,
    required bool isArchived,
  }) async {
    final saved = await _run(() async {
      final repository = ref.read(studentRepositoryProvider);
      final normalizedNote = StudentValidator.optionalText(note);
      if (initial == null) {
        await repository.createEnrollment(
          EnrollmentDraft(
            studentId: studentId,
            subjectId: subjectId,
            rate: rate,
            defaultDuration: defaultDuration,
            note: normalizedNote,
          ),
        );
      } else {
        await repository.updateEnrollment(
          initial.copyWith(
            rate: rate,
            defaultDuration: defaultDuration,
            note: normalizedNote,
            isArchived: isArchived,
          ),
        );
      }
      return true;
    });
    return saved ?? false;
  }

  /// Возвращает id нового предмета или `null`, если создать не удалось.
  Future<int?> createSubject(String name) =>
      _run(() => ref.read(subjectRepositoryProvider).createSubject(name));

  Future<T?> _run<T>(Future<T> Function() action) async {
    state = const AsyncLoading();
    try {
      final result = await action();
      if (ref.mounted) state = const AsyncData(null);
      return result;
    } on Object catch (error, stackTrace) {
      if (ref.mounted) state = AsyncError(error, stackTrace);
      return null;
    }
  }
}

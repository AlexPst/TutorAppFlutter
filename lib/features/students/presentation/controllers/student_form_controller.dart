import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/features/students/domain/models/grade_scale.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';
import 'package:tutor_app/features/students/domain/student_validator.dart';
import 'package:tutor_app/features/students/students_providers.dart';

part 'student_form_controller.g.dart';

/// Значения формы ученика в том виде, в каком их ввёл пользователь.
class StudentFormData {
  const StudentFormData({
    required this.fullName,
    required this.phone,
    required this.telegram,
    required this.note,
    required this.gradeScale,
  });

  final String fullName;
  final String phone;
  final String telegram;
  final String note;
  final GradeScale gradeScale;
}

/// Сохраняет ученика. Состояние отражает ход сохранения: загрузка
/// или ошибка, которую экран показывает пользователю.
@riverpod
class StudentFormController extends _$StudentFormController {
  @override
  FutureOr<void> build() {}

  /// Создаёт ученика, если [initial] равен `null`, иначе обновляет его.
  /// Возвращает id ученика или `null`, если сохранить не удалось.
  Future<int?> save({Student? initial, required StudentFormData data}) async {
    state = const AsyncLoading();
    try {
      final id = await _save(initial, data);
      if (ref.mounted) state = const AsyncData(null);
      return id;
    } on Object catch (error, stackTrace) {
      if (ref.mounted) state = AsyncError(error, stackTrace);
      return null;
    }
  }

  Future<int> _save(Student? initial, StudentFormData data) async {
    final repository = ref.read(studentRepositoryProvider);
    final fullName = data.fullName.trim();
    final phone = StudentValidator.optionalText(data.phone);
    final telegram = StudentValidator.normalizeTelegram(data.telegram);
    final note = StudentValidator.optionalText(data.note);

    if (initial == null) {
      return repository.createStudent(
        StudentDraft(
          fullName: fullName,
          phone: phone,
          telegram: telegram,
          note: note,
          gradeScale: data.gradeScale,
        ),
      );
    }
    await repository.updateStudent(
      initial.copyWith(
        fullName: fullName,
        phone: phone,
        telegram: telegram,
        note: note,
        gradeScale: data.gradeScale,
      ),
    );
    return initial.id;
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/lessons/lessons_providers.dart';

part 'lesson_form_controller.g.dart';

/// Сохранение и удаление занятия из формы. Каждый метод возвращает `true`
/// при успехе; ошибка попадает в состояние и показывается экраном.
@riverpod
class LessonFormController extends _$LessonFormController {
  @override
  FutureOr<void> build() {}

  Future<bool> createLesson(LessonDraft draft, LessonStatus status) =>
      _run(() => ref.read(createLessonUseCaseProvider)(draft, status: status));

  Future<bool> updateLesson(Lesson lesson) =>
      _run(() => ref.read(updateLessonUseCaseProvider)(lesson));

  Future<bool> deleteLesson(int lessonId) =>
      _run(() => ref.read(lessonRepositoryProvider).deleteLesson(lessonId));

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

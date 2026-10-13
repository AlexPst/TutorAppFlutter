// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Сохранение и удаление занятия из формы. Каждый метод возвращает `true`
/// при успехе; ошибка попадает в состояние и показывается экраном.

@ProviderFor(LessonFormController)
final lessonFormControllerProvider = LessonFormControllerProvider._();

/// Сохранение и удаление занятия из формы. Каждый метод возвращает `true`
/// при успехе; ошибка попадает в состояние и показывается экраном.
final class LessonFormControllerProvider
    extends $AsyncNotifierProvider<LessonFormController, void> {
  /// Сохранение и удаление занятия из формы. Каждый метод возвращает `true`
  /// при успехе; ошибка попадает в состояние и показывается экраном.
  LessonFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lessonFormControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lessonFormControllerHash();

  @$internal
  @override
  LessonFormController create() => LessonFormController();
}

String _$lessonFormControllerHash() =>
    r'ea927c0c49c8b35cc7f30b980767a355da2f614d';

/// Сохранение и удаление занятия из формы. Каждый метод возвращает `true`
/// при успехе; ошибка попадает в состояние и показывается экраном.

abstract class _$LessonFormController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

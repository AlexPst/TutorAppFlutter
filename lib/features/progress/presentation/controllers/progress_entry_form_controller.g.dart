// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_entry_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Сохранение и удаление записи прогресса. Методы возвращают `true`
/// при успехе; ошибка попадает в состояние и показывается экраном.

@ProviderFor(ProgressEntryFormController)
final progressEntryFormControllerProvider =
    ProgressEntryFormControllerProvider._();

/// Сохранение и удаление записи прогресса. Методы возвращают `true`
/// при успехе; ошибка попадает в состояние и показывается экраном.
final class ProgressEntryFormControllerProvider
    extends $AsyncNotifierProvider<ProgressEntryFormController, void> {
  /// Сохранение и удаление записи прогресса. Методы возвращают `true`
  /// при успехе; ошибка попадает в состояние и показывается экраном.
  ProgressEntryFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'progressEntryFormControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$progressEntryFormControllerHash();

  @$internal
  @override
  ProgressEntryFormController create() => ProgressEntryFormController();
}

String _$progressEntryFormControllerHash() =>
    r'04c172bc8650dc1e5bf8972d200c2f0650b1831c';

/// Сохранение и удаление записи прогресса. Методы возвращают `true`
/// при успехе; ошибка попадает в состояние и показывается экраном.

abstract class _$ProgressEntryFormController extends $AsyncNotifier<void> {
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Сохраняет ученика. Состояние отражает ход сохранения: загрузка
/// или ошибка, которую экран показывает пользователю.

@ProviderFor(StudentFormController)
final studentFormControllerProvider = StudentFormControllerProvider._();

/// Сохраняет ученика. Состояние отражает ход сохранения: загрузка
/// или ошибка, которую экран показывает пользователю.
final class StudentFormControllerProvider
    extends $AsyncNotifierProvider<StudentFormController, void> {
  /// Сохраняет ученика. Состояние отражает ход сохранения: загрузка
  /// или ошибка, которую экран показывает пользователю.
  StudentFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'studentFormControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$studentFormControllerHash();

  @$internal
  @override
  StudentFormController create() => StudentFormController();
}

String _$studentFormControllerHash() =>
    r'9fbdd514521709db3286e41b2ca94cd778785d1d';

/// Сохраняет ученика. Состояние отражает ход сохранения: загрузка
/// или ошибка, которую экран показывает пользователю.

abstract class _$StudentFormController extends $AsyncNotifier<void> {
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

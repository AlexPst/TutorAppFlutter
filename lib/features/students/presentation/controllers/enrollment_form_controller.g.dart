// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollment_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Сохраняет направление и создаёт новые предметы прямо из формы.

@ProviderFor(EnrollmentFormController)
final enrollmentFormControllerProvider = EnrollmentFormControllerProvider._();

/// Сохраняет направление и создаёт новые предметы прямо из формы.
final class EnrollmentFormControllerProvider
    extends $AsyncNotifierProvider<EnrollmentFormController, void> {
  /// Сохраняет направление и создаёт новые предметы прямо из формы.
  EnrollmentFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'enrollmentFormControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$enrollmentFormControllerHash();

  @$internal
  @override
  EnrollmentFormController create() => EnrollmentFormController();
}

String _$enrollmentFormControllerHash() =>
    r'ecdeff614fc77b6c26e1832f6585be9dbd521870';

/// Сохраняет направление и создаёт новые предметы прямо из формы.

abstract class _$EnrollmentFormController extends $AsyncNotifier<void> {
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

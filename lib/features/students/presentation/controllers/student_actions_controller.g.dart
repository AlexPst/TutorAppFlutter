// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_actions_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Действия карточки ученика: архив, удаление, заметки.
/// Каждый метод возвращает `true` при успехе; ошибка попадает в состояние.

@ProviderFor(StudentActionsController)
final studentActionsControllerProvider = StudentActionsControllerFamily._();

/// Действия карточки ученика: архив, удаление, заметки.
/// Каждый метод возвращает `true` при успехе; ошибка попадает в состояние.
final class StudentActionsControllerProvider
    extends $AsyncNotifierProvider<StudentActionsController, void> {
  /// Действия карточки ученика: архив, удаление, заметки.
  /// Каждый метод возвращает `true` при успехе; ошибка попадает в состояние.
  StudentActionsControllerProvider._({
    required StudentActionsControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'studentActionsControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$studentActionsControllerHash();

  @override
  String toString() {
    return r'studentActionsControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  StudentActionsController create() => StudentActionsController();

  @override
  bool operator ==(Object other) {
    return other is StudentActionsControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$studentActionsControllerHash() =>
    r'35fd286f3dbf103ec913fdc40dbe68dabcb60d08';

/// Действия карточки ученика: архив, удаление, заметки.
/// Каждый метод возвращает `true` при успехе; ошибка попадает в состояние.

final class StudentActionsControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          StudentActionsController,
          AsyncValue<void>,
          void,
          FutureOr<void>,
          int
        > {
  StudentActionsControllerFamily._()
    : super(
        retry: null,
        name: r'studentActionsControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Действия карточки ученика: архив, удаление, заметки.
  /// Каждый метод возвращает `true` при успехе; ошибка попадает в состояние.

  StudentActionsControllerProvider call(int studentId) =>
      StudentActionsControllerProvider._(argument: studentId, from: this);

  @override
  String toString() => r'studentActionsControllerProvider';
}

/// Действия карточки ученика: архив, удаление, заметки.
/// Каждый метод возвращает `true` при успехе; ошибка попадает в состояние.

abstract class _$StudentActionsController extends $AsyncNotifier<void> {
  late final _$args = ref.$arg as int;
  int get studentId => _$args;

  FutureOr<void> build(int studentId);
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
    return element.handleCreate(ref, () => build(_$args));
  }
}

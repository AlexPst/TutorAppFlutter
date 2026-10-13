// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(progressRepository)
final progressRepositoryProvider = ProgressRepositoryProvider._();

final class ProgressRepositoryProvider
    extends
        $FunctionalProvider<
          ProgressRepository,
          ProgressRepository,
          ProgressRepository
        >
    with $Provider<ProgressRepository> {
  ProgressRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'progressRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$progressRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProgressRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProgressRepository create(Ref ref) {
    return progressRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProgressRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProgressRepository>(value),
    );
  }
}

String _$progressRepositoryHash() =>
    r'eb9fc8dcc51f379088e3b31d9fe0422cac1043bc';

@ProviderFor(saveProgressEntryUseCase)
final saveProgressEntryUseCaseProvider = SaveProgressEntryUseCaseProvider._();

final class SaveProgressEntryUseCaseProvider
    extends
        $FunctionalProvider<
          SaveProgressEntryUseCase,
          SaveProgressEntryUseCase,
          SaveProgressEntryUseCase
        >
    with $Provider<SaveProgressEntryUseCase> {
  SaveProgressEntryUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'saveProgressEntryUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$saveProgressEntryUseCaseHash();

  @$internal
  @override
  $ProviderElement<SaveProgressEntryUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SaveProgressEntryUseCase create(Ref ref) {
    return saveProgressEntryUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaveProgressEntryUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaveProgressEntryUseCase>(value),
    );
  }
}

String _$saveProgressEntryUseCaseHash() =>
    r'a4c8ca52e85b7a0f041fe49e9dd62fa48579d09f';

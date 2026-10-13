// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(subjectRepository)
final subjectRepositoryProvider = SubjectRepositoryProvider._();

final class SubjectRepositoryProvider
    extends
        $FunctionalProvider<
          SubjectRepository,
          SubjectRepository,
          SubjectRepository
        >
    with $Provider<SubjectRepository> {
  SubjectRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subjectRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subjectRepositoryHash();

  @$internal
  @override
  $ProviderElement<SubjectRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SubjectRepository create(Ref ref) {
    return subjectRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubjectRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubjectRepository>(value),
    );
  }
}

String _$subjectRepositoryHash() => r'fad187fe07c299f5d5e543233ba13a4af8363adb';

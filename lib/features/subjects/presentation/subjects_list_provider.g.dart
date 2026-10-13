// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(subjectsList)
final subjectsListProvider = SubjectsListProvider._();

final class SubjectsListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Subject>>,
          List<Subject>,
          Stream<List<Subject>>
        >
    with $FutureModifier<List<Subject>>, $StreamProvider<List<Subject>> {
  SubjectsListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subjectsListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subjectsListHash();

  @$internal
  @override
  $StreamProviderElement<List<Subject>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Subject>> create(Ref ref) {
    return subjectsList(ref);
  }
}

String _$subjectsListHash() => r'c43c6a08e904c86d115dd46e57996936397d269e';

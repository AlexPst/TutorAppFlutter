// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_list_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StudentListQueryController)
final studentListQueryControllerProvider =
    StudentListQueryControllerProvider._();

final class StudentListQueryControllerProvider
    extends $NotifierProvider<StudentListQueryController, StudentListQuery> {
  StudentListQueryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'studentListQueryControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$studentListQueryControllerHash();

  @$internal
  @override
  StudentListQueryController create() => StudentListQueryController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StudentListQuery value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StudentListQuery>(value),
    );
  }
}

String _$studentListQueryControllerHash() =>
    r'f42ed8873210de30eab42dd0015225efc13b68c2';

abstract class _$StudentListQueryController
    extends $Notifier<StudentListQuery> {
  StudentListQuery build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<StudentListQuery, StudentListQuery>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<StudentListQuery, StudentListQuery>,
              StudentListQuery,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(students)
final studentsProvider = StudentsFamily._();

final class StudentsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Student>>,
          List<Student>,
          Stream<List<Student>>
        >
    with $FutureModifier<List<Student>>, $StreamProvider<List<Student>> {
  StudentsProvider._({
    required StudentsFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'studentsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$studentsHash();

  @override
  String toString() {
    return r'studentsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Student>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Student>> create(Ref ref) {
    final argument = this.argument as bool;
    return students(ref, archived: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$studentsHash() => r'5a63745401471efd7c600f5c30088a43edf0d3a0';

final class StudentsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Student>>, bool> {
  StudentsFamily._()
    : super(
        retry: null,
        name: r'studentsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StudentsProvider call({required bool archived}) =>
      StudentsProvider._(argument: archived, from: this);

  @override
  String toString() => r'studentsProvider';
}

@ProviderFor(allEnrollments)
final allEnrollmentsProvider = AllEnrollmentsProvider._();

final class AllEnrollmentsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<EnrollmentWithSubject>>,
          List<EnrollmentWithSubject>,
          Stream<List<EnrollmentWithSubject>>
        >
    with
        $FutureModifier<List<EnrollmentWithSubject>>,
        $StreamProvider<List<EnrollmentWithSubject>> {
  AllEnrollmentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allEnrollmentsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allEnrollmentsHash();

  @$internal
  @override
  $StreamProviderElement<List<EnrollmentWithSubject>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<EnrollmentWithSubject>> create(Ref ref) {
    return allEnrollments(ref);
  }
}

String _$allEnrollmentsHash() => r'50f03c2e6b5b3687592724efeffd5c35f858df34';

@ProviderFor(studentBalances)
final studentBalancesProvider = StudentBalancesProvider._();

final class StudentBalancesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<StudentBalance>>,
          List<StudentBalance>,
          Stream<List<StudentBalance>>
        >
    with
        $FutureModifier<List<StudentBalance>>,
        $StreamProvider<List<StudentBalance>> {
  StudentBalancesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'studentBalancesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$studentBalancesHash();

  @$internal
  @override
  $StreamProviderElement<List<StudentBalance>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<StudentBalance>> create(Ref ref) {
    return studentBalances(ref);
  }
}

String _$studentBalancesHash() => r'78c7bc9fe16518188deec0ae1be91ec6c52592cb';

/// Ученики раздела вместе с предметами и балансами.

@ProviderFor(studentListItems)
final studentListItemsProvider = StudentListItemsFamily._();

/// Ученики раздела вместе с предметами и балансами.

final class StudentListItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<StudentListItem>>,
          List<StudentListItem>,
          FutureOr<List<StudentListItem>>
        >
    with
        $FutureModifier<List<StudentListItem>>,
        $FutureProvider<List<StudentListItem>> {
  /// Ученики раздела вместе с предметами и балансами.
  StudentListItemsProvider._({
    required StudentListItemsFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'studentListItemsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$studentListItemsHash();

  @override
  String toString() {
    return r'studentListItemsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<StudentListItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<StudentListItem>> create(Ref ref) {
    final argument = this.argument as bool;
    return studentListItems(ref, archived: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentListItemsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$studentListItemsHash() => r'9015a1ea498b9dcfb22904fc1e3877b047f468d1';

/// Ученики раздела вместе с предметами и балансами.

final class StudentListItemsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<StudentListItem>>, bool> {
  StudentListItemsFamily._()
    : super(
        retry: null,
        name: r'studentListItemsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Ученики раздела вместе с предметами и балансами.

  StudentListItemsProvider call({required bool archived}) =>
      StudentListItemsProvider._(argument: archived, from: this);

  @override
  String toString() => r'studentListItemsProvider';
}

/// Отфильтрованный список и общее число учеников в разделе — чтобы
/// отличать «учеников нет» от «никого не нашли».

@ProviderFor(filteredStudents)
final filteredStudentsProvider = FilteredStudentsProvider._();

/// Отфильтрованный список и общее число учеников в разделе — чтобы
/// отличать «учеников нет» от «никого не нашли».

final class FilteredStudentsProvider
    extends
        $FunctionalProvider<
          AsyncValue<({List<StudentListItem> items, int total})>,
          AsyncValue<({List<StudentListItem> items, int total})>,
          AsyncValue<({List<StudentListItem> items, int total})>
        >
    with $Provider<AsyncValue<({List<StudentListItem> items, int total})>> {
  /// Отфильтрованный список и общее число учеников в разделе — чтобы
  /// отличать «учеников нет» от «никого не нашли».
  FilteredStudentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredStudentsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredStudentsHash();

  @$internal
  @override
  $ProviderElement<AsyncValue<({List<StudentListItem> items, int total})>>
  $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  AsyncValue<({List<StudentListItem> items, int total})> create(Ref ref) {
    return filteredStudents(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    AsyncValue<({List<StudentListItem> items, int total})> value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<
            AsyncValue<({List<StudentListItem> items, int total})>
          >(value),
    );
  }
}

String _$filteredStudentsHash() => r'5d8ce0f112a18637f1641143499243bd87d76bb6';

/// Предметы, по которым у учеников есть активные направления, — варианты
/// фильтра.

@ProviderFor(subjectFilterOptions)
final subjectFilterOptionsProvider = SubjectFilterOptionsProvider._();

/// Предметы, по которым у учеников есть активные направления, — варианты
/// фильтра.

final class SubjectFilterOptionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Subject>>,
          List<Subject>,
          FutureOr<List<Subject>>
        >
    with $FutureModifier<List<Subject>>, $FutureProvider<List<Subject>> {
  /// Предметы, по которым у учеников есть активные направления, — варианты
  /// фильтра.
  SubjectFilterOptionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subjectFilterOptionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subjectFilterOptionsHash();

  @$internal
  @override
  $FutureProviderElement<List<Subject>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Subject>> create(Ref ref) {
    return subjectFilterOptions(ref);
  }
}

String _$subjectFilterOptionsHash() =>
    r'39a6f6d747d5ce234e6d00e7e098341e1a5401d8';

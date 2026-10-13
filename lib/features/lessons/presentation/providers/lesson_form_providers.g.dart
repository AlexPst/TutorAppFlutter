// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_form_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Ученики, которым можно назначить занятие.

@ProviderFor(lessonFormStudents)
final lessonFormStudentsProvider = LessonFormStudentsProvider._();

/// Ученики, которым можно назначить занятие.

final class LessonFormStudentsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Student>>,
          List<Student>,
          Stream<List<Student>>
        >
    with $FutureModifier<List<Student>>, $StreamProvider<List<Student>> {
  /// Ученики, которым можно назначить занятие.
  LessonFormStudentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lessonFormStudentsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lessonFormStudentsHash();

  @$internal
  @override
  $StreamProviderElement<List<Student>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Student>> create(Ref ref) {
    return lessonFormStudents(ref);
  }
}

String _$lessonFormStudentsHash() =>
    r'6e6915023124af4425e9f5695255c86ab98bc274';

/// Активные предметы ученика.

@ProviderFor(lessonFormEnrollments)
final lessonFormEnrollmentsProvider = LessonFormEnrollmentsFamily._();

/// Активные предметы ученика.

final class LessonFormEnrollmentsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<EnrollmentWithSubject>>,
          List<EnrollmentWithSubject>,
          Stream<List<EnrollmentWithSubject>>
        >
    with
        $FutureModifier<List<EnrollmentWithSubject>>,
        $StreamProvider<List<EnrollmentWithSubject>> {
  /// Активные предметы ученика.
  LessonFormEnrollmentsProvider._({
    required LessonFormEnrollmentsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'lessonFormEnrollmentsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$lessonFormEnrollmentsHash();

  @override
  String toString() {
    return r'lessonFormEnrollmentsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<EnrollmentWithSubject>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<EnrollmentWithSubject>> create(Ref ref) {
    final argument = this.argument as int;
    return lessonFormEnrollments(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LessonFormEnrollmentsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$lessonFormEnrollmentsHash() =>
    r'99c3f2a24c0c7604e4f7452be71dcde9cc95b836';

/// Активные предметы ученика.

final class LessonFormEnrollmentsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<EnrollmentWithSubject>>, int> {
  LessonFormEnrollmentsFamily._()
    : super(
        retry: null,
        name: r'lessonFormEnrollmentsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Активные предметы ученика.

  LessonFormEnrollmentsProvider call(int studentId) =>
      LessonFormEnrollmentsProvider._(argument: studentId, from: this);

  @override
  String toString() => r'lessonFormEnrollmentsProvider';
}

@ProviderFor(lessonDetails)
final lessonDetailsProvider = LessonDetailsFamily._();

final class LessonDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<LessonDetails?>,
          LessonDetails?,
          Stream<LessonDetails?>
        >
    with $FutureModifier<LessonDetails?>, $StreamProvider<LessonDetails?> {
  LessonDetailsProvider._({
    required LessonDetailsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'lessonDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$lessonDetailsHash();

  @override
  String toString() {
    return r'lessonDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<LessonDetails?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<LessonDetails?> create(Ref ref) {
    final argument = this.argument as int;
    return lessonDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LessonDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$lessonDetailsHash() => r'4ba708261eb457e4197b58ec1c4c5b63de277d8b';

final class LessonDetailsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<LessonDetails?>, int> {
  LessonDetailsFamily._()
    : super(
        retry: null,
        name: r'lessonDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LessonDetailsProvider call(int lessonId) =>
      LessonDetailsProvider._(argument: lessonId, from: this);

  @override
  String toString() => r'lessonDetailsProvider';
}

/// Оценка и комментарий занятия — для формы отметки.

@ProviderFor(lessonProgressEntry)
final lessonProgressEntryProvider = LessonProgressEntryFamily._();

/// Оценка и комментарий занятия — для формы отметки.

final class LessonProgressEntryProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProgressEntry?>,
          ProgressEntry?,
          FutureOr<ProgressEntry?>
        >
    with $FutureModifier<ProgressEntry?>, $FutureProvider<ProgressEntry?> {
  /// Оценка и комментарий занятия — для формы отметки.
  LessonProgressEntryProvider._({
    required LessonProgressEntryFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'lessonProgressEntryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$lessonProgressEntryHash();

  @override
  String toString() {
    return r'lessonProgressEntryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ProgressEntry?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ProgressEntry?> create(Ref ref) {
    final argument = this.argument as int;
    return lessonProgressEntry(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LessonProgressEntryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$lessonProgressEntryHash() =>
    r'40e4d0e0347c0f4ee25ff2273b902c90480d8829';

/// Оценка и комментарий занятия — для формы отметки.

final class LessonProgressEntryFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ProgressEntry?>, int> {
  LessonProgressEntryFamily._()
    : super(
        retry: null,
        name: r'lessonProgressEntryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Оценка и комментарий занятия — для формы отметки.

  LessonProgressEntryProvider call(int lessonId) =>
      LessonProgressEntryProvider._(argument: lessonId, from: this);

  @override
  String toString() => r'lessonProgressEntryProvider';
}

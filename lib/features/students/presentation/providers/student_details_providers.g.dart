// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_details_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(student)
final studentProvider = StudentFamily._();

final class StudentProvider
    extends
        $FunctionalProvider<AsyncValue<Student?>, Student?, Stream<Student?>>
    with $FutureModifier<Student?>, $StreamProvider<Student?> {
  StudentProvider._({
    required StudentFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'studentProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$studentHash();

  @override
  String toString() {
    return r'studentProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Student?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Student?> create(Ref ref) {
    final argument = this.argument as int;
    return student(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$studentHash() => r'61c4dfe832d8938c4236526b4094f70b2eee247f';

final class StudentFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Student?>, int> {
  StudentFamily._()
    : super(
        retry: null,
        name: r'studentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StudentProvider call(int studentId) =>
      StudentProvider._(argument: studentId, from: this);

  @override
  String toString() => r'studentProvider';
}

/// Все направления ученика, включая архивные.

@ProviderFor(studentEnrollments)
final studentEnrollmentsProvider = StudentEnrollmentsFamily._();

/// Все направления ученика, включая архивные.

final class StudentEnrollmentsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<EnrollmentWithSubject>>,
          List<EnrollmentWithSubject>,
          Stream<List<EnrollmentWithSubject>>
        >
    with
        $FutureModifier<List<EnrollmentWithSubject>>,
        $StreamProvider<List<EnrollmentWithSubject>> {
  /// Все направления ученика, включая архивные.
  StudentEnrollmentsProvider._({
    required StudentEnrollmentsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'studentEnrollmentsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$studentEnrollmentsHash();

  @override
  String toString() {
    return r'studentEnrollmentsProvider'
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
    return studentEnrollments(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentEnrollmentsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$studentEnrollmentsHash() =>
    r'867b955894a37cec39d4701ae8bed2fdb4a8c99c';

/// Все направления ученика, включая архивные.

final class StudentEnrollmentsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<EnrollmentWithSubject>>, int> {
  StudentEnrollmentsFamily._()
    : super(
        retry: null,
        name: r'studentEnrollmentsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Все направления ученика, включая архивные.

  StudentEnrollmentsProvider call(int studentId) =>
      StudentEnrollmentsProvider._(argument: studentId, from: this);

  @override
  String toString() => r'studentEnrollmentsProvider';
}

@ProviderFor(studentBalance)
final studentBalanceProvider = StudentBalanceFamily._();

final class StudentBalanceProvider
    extends
        $FunctionalProvider<
          AsyncValue<StudentBalance?>,
          StudentBalance?,
          Stream<StudentBalance?>
        >
    with $FutureModifier<StudentBalance?>, $StreamProvider<StudentBalance?> {
  StudentBalanceProvider._({
    required StudentBalanceFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'studentBalanceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$studentBalanceHash();

  @override
  String toString() {
    return r'studentBalanceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<StudentBalance?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<StudentBalance?> create(Ref ref) {
    final argument = this.argument as int;
    return studentBalance(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentBalanceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$studentBalanceHash() => r'0d15eef4d0dca0ad98384f2155364bb6acd51f71';

final class StudentBalanceFamily extends $Family
    with $FunctionalFamilyOverride<Stream<StudentBalance?>, int> {
  StudentBalanceFamily._()
    : super(
        retry: null,
        name: r'studentBalanceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StudentBalanceProvider call(int studentId) =>
      StudentBalanceProvider._(argument: studentId, from: this);

  @override
  String toString() => r'studentBalanceProvider';
}

/// Занятия ученика, сначала новые.

@ProviderFor(studentLessons)
final studentLessonsProvider = StudentLessonsFamily._();

/// Занятия ученика, сначала новые.

final class StudentLessonsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LessonDetails>>,
          List<LessonDetails>,
          Stream<List<LessonDetails>>
        >
    with
        $FutureModifier<List<LessonDetails>>,
        $StreamProvider<List<LessonDetails>> {
  /// Занятия ученика, сначала новые.
  StudentLessonsProvider._({
    required StudentLessonsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'studentLessonsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$studentLessonsHash();

  @override
  String toString() {
    return r'studentLessonsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<LessonDetails>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<LessonDetails>> create(Ref ref) {
    final argument = this.argument as int;
    return studentLessons(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentLessonsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$studentLessonsHash() => r'c2f5a48c7dcbec53a622bbc5ec3bc1bbeea7a2b0';

/// Занятия ученика, сначала новые.

final class StudentLessonsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<LessonDetails>>, int> {
  StudentLessonsFamily._()
    : super(
        retry: null,
        name: r'studentLessonsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Занятия ученика, сначала новые.

  StudentLessonsProvider call(int studentId) =>
      StudentLessonsProvider._(argument: studentId, from: this);

  @override
  String toString() => r'studentLessonsProvider';
}

@ProviderFor(studentPayments)
final studentPaymentsProvider = StudentPaymentsFamily._();

final class StudentPaymentsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PaymentDetails>>,
          List<PaymentDetails>,
          Stream<List<PaymentDetails>>
        >
    with
        $FutureModifier<List<PaymentDetails>>,
        $StreamProvider<List<PaymentDetails>> {
  StudentPaymentsProvider._({
    required StudentPaymentsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'studentPaymentsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$studentPaymentsHash();

  @override
  String toString() {
    return r'studentPaymentsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<PaymentDetails>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<PaymentDetails>> create(Ref ref) {
    final argument = this.argument as int;
    return studentPayments(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentPaymentsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$studentPaymentsHash() => r'3255f1d97241c98af2b9da561d14a866c065c359';

final class StudentPaymentsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<PaymentDetails>>, int> {
  StudentPaymentsFamily._()
    : super(
        retry: null,
        name: r'studentPaymentsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StudentPaymentsProvider call(int studentId) =>
      StudentPaymentsProvider._(argument: studentId, from: this);

  @override
  String toString() => r'studentPaymentsProvider';
}

@ProviderFor(studentPackages)
final studentPackagesProvider = StudentPackagesFamily._();

final class StudentPackagesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PackageWithUsage>>,
          List<PackageWithUsage>,
          Stream<List<PackageWithUsage>>
        >
    with
        $FutureModifier<List<PackageWithUsage>>,
        $StreamProvider<List<PackageWithUsage>> {
  StudentPackagesProvider._({
    required StudentPackagesFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'studentPackagesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$studentPackagesHash();

  @override
  String toString() {
    return r'studentPackagesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<PackageWithUsage>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<PackageWithUsage>> create(Ref ref) {
    final argument = this.argument as int;
    return studentPackages(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentPackagesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$studentPackagesHash() => r'1680bb32eb6efc18289d4c31803e320548522b4f';

final class StudentPackagesFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<PackageWithUsage>>, int> {
  StudentPackagesFamily._()
    : super(
        retry: null,
        name: r'studentPackagesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StudentPackagesProvider call(int studentId) =>
      StudentPackagesProvider._(argument: studentId, from: this);

  @override
  String toString() => r'studentPackagesProvider';
}

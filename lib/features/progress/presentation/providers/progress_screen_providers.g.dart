// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_screen_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Направление по id — чтобы узнать ученика.

@ProviderFor(progressEnrollment)
final progressEnrollmentProvider = ProgressEnrollmentFamily._();

/// Направление по id — чтобы узнать ученика.

final class ProgressEnrollmentProvider
    extends
        $FunctionalProvider<
          AsyncValue<Enrollment?>,
          Enrollment?,
          FutureOr<Enrollment?>
        >
    with $FutureModifier<Enrollment?>, $FutureProvider<Enrollment?> {
  /// Направление по id — чтобы узнать ученика.
  ProgressEnrollmentProvider._({
    required ProgressEnrollmentFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'progressEnrollmentProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$progressEnrollmentHash();

  @override
  String toString() {
    return r'progressEnrollmentProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Enrollment?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Enrollment?> create(Ref ref) {
    final argument = this.argument as int;
    return progressEnrollment(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProgressEnrollmentProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$progressEnrollmentHash() =>
    r'0d58ab178cc2f847a6638dcb8149ead5ae7473f8';

/// Направление по id — чтобы узнать ученика.

final class ProgressEnrollmentFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Enrollment?>, int> {
  ProgressEnrollmentFamily._()
    : super(
        retry: null,
        name: r'progressEnrollmentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Направление по id — чтобы узнать ученика.

  ProgressEnrollmentProvider call(int enrollmentId) =>
      ProgressEnrollmentProvider._(argument: enrollmentId, from: this);

  @override
  String toString() => r'progressEnrollmentProvider';
}

@ProviderFor(progressStudent)
final progressStudentProvider = ProgressStudentFamily._();

final class ProgressStudentProvider
    extends
        $FunctionalProvider<AsyncValue<Student?>, Student?, Stream<Student?>>
    with $FutureModifier<Student?>, $StreamProvider<Student?> {
  ProgressStudentProvider._({
    required ProgressStudentFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'progressStudentProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$progressStudentHash();

  @override
  String toString() {
    return r'progressStudentProvider'
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
    return progressStudent(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProgressStudentProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$progressStudentHash() => r'eae035f83db2678f553c099342f3421100540e98';

final class ProgressStudentFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Student?>, int> {
  ProgressStudentFamily._()
    : super(
        retry: null,
        name: r'progressStudentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProgressStudentProvider call(int studentId) =>
      ProgressStudentProvider._(argument: studentId, from: this);

  @override
  String toString() => r'progressStudentProvider';
}

@ProviderFor(progressStudentEnrollments)
final progressStudentEnrollmentsProvider = ProgressStudentEnrollmentsFamily._();

final class ProgressStudentEnrollmentsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<EnrollmentWithSubject>>,
          List<EnrollmentWithSubject>,
          Stream<List<EnrollmentWithSubject>>
        >
    with
        $FutureModifier<List<EnrollmentWithSubject>>,
        $StreamProvider<List<EnrollmentWithSubject>> {
  ProgressStudentEnrollmentsProvider._({
    required ProgressStudentEnrollmentsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'progressStudentEnrollmentsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$progressStudentEnrollmentsHash();

  @override
  String toString() {
    return r'progressStudentEnrollmentsProvider'
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
    return progressStudentEnrollments(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProgressStudentEnrollmentsProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$progressStudentEnrollmentsHash() =>
    r'5227122a3db4673eab787f401dcb736b57a6ed60';

final class ProgressStudentEnrollmentsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<EnrollmentWithSubject>>, int> {
  ProgressStudentEnrollmentsFamily._()
    : super(
        retry: null,
        name: r'progressStudentEnrollmentsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProgressStudentEnrollmentsProvider call(int studentId) =>
      ProgressStudentEnrollmentsProvider._(argument: studentId, from: this);

  @override
  String toString() => r'progressStudentEnrollmentsProvider';
}

/// `null`, если направление или ученик удалены. Следит за учеником
/// и его предметами, поэтому смена шкалы сразу отражается на графике.
///
/// Стримы объединяются через провайдеры. Вложенное ожидание `.first`
/// одного стрима Drift внутри обработчика другого приводило к зависанию
/// всех запросов (воспроизводилось в виджетных тестах).

@ProviderFor(progressContext)
final progressContextProvider = ProgressContextFamily._();

/// `null`, если направление или ученик удалены. Следит за учеником
/// и его предметами, поэтому смена шкалы сразу отражается на графике.
///
/// Стримы объединяются через провайдеры. Вложенное ожидание `.first`
/// одного стрима Drift внутри обработчика другого приводило к зависанию
/// всех запросов (воспроизводилось в виджетных тестах).

final class ProgressContextProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProgressContext?>,
          ProgressContext?,
          FutureOr<ProgressContext?>
        >
    with $FutureModifier<ProgressContext?>, $FutureProvider<ProgressContext?> {
  /// `null`, если направление или ученик удалены. Следит за учеником
  /// и его предметами, поэтому смена шкалы сразу отражается на графике.
  ///
  /// Стримы объединяются через провайдеры. Вложенное ожидание `.first`
  /// одного стрима Drift внутри обработчика другого приводило к зависанию
  /// всех запросов (воспроизводилось в виджетных тестах).
  ProgressContextProvider._({
    required ProgressContextFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'progressContextProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$progressContextHash();

  @override
  String toString() {
    return r'progressContextProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ProgressContext?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ProgressContext?> create(Ref ref) {
    final argument = this.argument as int;
    return progressContext(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProgressContextProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$progressContextHash() => r'fc33cf330bb35ca047647a01a8681091ac53d086';

/// `null`, если направление или ученик удалены. Следит за учеником
/// и его предметами, поэтому смена шкалы сразу отражается на графике.
///
/// Стримы объединяются через провайдеры. Вложенное ожидание `.first`
/// одного стрима Drift внутри обработчика другого приводило к зависанию
/// всех запросов (воспроизводилось в виджетных тестах).

final class ProgressContextFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ProgressContext?>, int> {
  ProgressContextFamily._()
    : super(
        retry: null,
        name: r'progressContextProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// `null`, если направление или ученик удалены. Следит за учеником
  /// и его предметами, поэтому смена шкалы сразу отражается на графике.
  ///
  /// Стримы объединяются через провайдеры. Вложенное ожидание `.first`
  /// одного стрима Drift внутри обработчика другого приводило к зависанию
  /// всех запросов (воспроизводилось в виджетных тестах).

  ProgressContextProvider call(int enrollmentId) =>
      ProgressContextProvider._(argument: enrollmentId, from: this);

  @override
  String toString() => r'progressContextProvider';
}

@ProviderFor(subjectProgress)
final subjectProgressProvider = SubjectProgressFamily._();

final class SubjectProgressProvider
    extends
        $FunctionalProvider<
          AsyncValue<SubjectProgress>,
          SubjectProgress,
          Stream<SubjectProgress>
        >
    with $FutureModifier<SubjectProgress>, $StreamProvider<SubjectProgress> {
  SubjectProgressProvider._({
    required SubjectProgressFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'subjectProgressProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$subjectProgressHash();

  @override
  String toString() {
    return r'subjectProgressProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<SubjectProgress> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<SubjectProgress> create(Ref ref) {
    final argument = this.argument as int;
    return subjectProgress(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SubjectProgressProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$subjectProgressHash() => r'ad28aa0ba769334fcbcf2b48a08270963a1b50ad';

final class SubjectProgressFamily extends $Family
    with $FunctionalFamilyOverride<Stream<SubjectProgress>, int> {
  SubjectProgressFamily._()
    : super(
        retry: null,
        name: r'subjectProgressProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SubjectProgressProvider call(int enrollmentId) =>
      SubjectProgressProvider._(argument: enrollmentId, from: this);

  @override
  String toString() => r'subjectProgressProvider';
}

/// Прошедшие занятия направления (сначала новые) — варианты привязки
/// записи прогресса.

@ProviderFor(pastLessons)
final pastLessonsProvider = PastLessonsFamily._();

/// Прошедшие занятия направления (сначала новые) — варианты привязки
/// записи прогресса.

final class PastLessonsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LessonDetails>>,
          List<LessonDetails>,
          Stream<List<LessonDetails>>
        >
    with
        $FutureModifier<List<LessonDetails>>,
        $StreamProvider<List<LessonDetails>> {
  /// Прошедшие занятия направления (сначала новые) — варианты привязки
  /// записи прогресса.
  PastLessonsProvider._({
    required PastLessonsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'pastLessonsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pastLessonsHash();

  @override
  String toString() {
    return r'pastLessonsProvider'
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
    return pastLessons(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PastLessonsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pastLessonsHash() => r'6c500af55a87a32ec652108aa229a6a079aa3956';

/// Прошедшие занятия направления (сначала новые) — варианты привязки
/// записи прогресса.

final class PastLessonsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<LessonDetails>>, int> {
  PastLessonsFamily._()
    : super(
        retry: null,
        name: r'pastLessonsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Прошедшие занятия направления (сначала новые) — варианты привязки
  /// записи прогресса.

  PastLessonsProvider call(int enrollmentId) =>
      PastLessonsProvider._(argument: enrollmentId, from: this);

  @override
  String toString() => r'pastLessonsProvider';
}

@ProviderFor(progressEntryForEdit)
final progressEntryForEditProvider = ProgressEntryForEditFamily._();

final class ProgressEntryForEditProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProgressEntry?>,
          ProgressEntry?,
          FutureOr<ProgressEntry?>
        >
    with $FutureModifier<ProgressEntry?>, $FutureProvider<ProgressEntry?> {
  ProgressEntryForEditProvider._({
    required ProgressEntryForEditFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'progressEntryForEditProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$progressEntryForEditHash();

  @override
  String toString() {
    return r'progressEntryForEditProvider'
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
    return progressEntryForEdit(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProgressEntryForEditProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$progressEntryForEditHash() =>
    r'3fc23a36cace262ff0250e3d77db3f6e0e1bbe40';

final class ProgressEntryForEditFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ProgressEntry?>, int> {
  ProgressEntryForEditFamily._()
    : super(
        retry: null,
        name: r'progressEntryForEditProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProgressEntryForEditProvider call(int entryId) =>
      ProgressEntryForEditProvider._(argument: entryId, from: this);

  @override
  String toString() => r'progressEntryForEditProvider';
}

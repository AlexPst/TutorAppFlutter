// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_calendar_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LessonsCalendarController)
final lessonsCalendarControllerProvider = LessonsCalendarControllerProvider._();

final class LessonsCalendarControllerProvider
    extends $NotifierProvider<LessonsCalendarController, LessonsCalendarState> {
  LessonsCalendarControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lessonsCalendarControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lessonsCalendarControllerHash();

  @$internal
  @override
  LessonsCalendarController create() => LessonsCalendarController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LessonsCalendarState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LessonsCalendarState>(value),
    );
  }
}

String _$lessonsCalendarControllerHash() =>
    r'a9e32dab18d0d98dbdd78904756d3ed641602676';

abstract class _$LessonsCalendarController
    extends $Notifier<LessonsCalendarState> {
  LessonsCalendarState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<LessonsCalendarState, LessonsCalendarState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LessonsCalendarState, LessonsCalendarState>,
              LessonsCalendarState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(lessonsInPeriod)
final lessonsInPeriodProvider = LessonsInPeriodFamily._();

final class LessonsInPeriodProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LessonDetails>>,
          List<LessonDetails>,
          Stream<List<LessonDetails>>
        >
    with
        $FutureModifier<List<LessonDetails>>,
        $StreamProvider<List<LessonDetails>> {
  LessonsInPeriodProvider._({
    required LessonsInPeriodFamily super.from,
    required DatePeriod super.argument,
  }) : super(
         retry: null,
         name: r'lessonsInPeriodProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$lessonsInPeriodHash();

  @override
  String toString() {
    return r'lessonsInPeriodProvider'
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
    final argument = this.argument as DatePeriod;
    return lessonsInPeriod(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LessonsInPeriodProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$lessonsInPeriodHash() => r'6de8e72e16d13d831a9e400bbd373faa6225099f';

final class LessonsInPeriodFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<LessonDetails>>, DatePeriod> {
  LessonsInPeriodFamily._()
    : super(
        retry: null,
        name: r'lessonsInPeriodProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LessonsInPeriodProvider call(DatePeriod period) =>
      LessonsInPeriodProvider._(argument: period, from: this);

  @override
  String toString() => r'lessonsInPeriodProvider';
}

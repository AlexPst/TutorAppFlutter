// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_screen_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UpcomingRangeController)
final upcomingRangeControllerProvider = UpcomingRangeControllerProvider._();

final class UpcomingRangeControllerProvider
    extends $NotifierProvider<UpcomingRangeController, UpcomingRange> {
  UpcomingRangeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'upcomingRangeControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$upcomingRangeControllerHash();

  @$internal
  @override
  UpcomingRangeController create() => UpcomingRangeController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpcomingRange value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpcomingRange>(value),
    );
  }
}

String _$upcomingRangeControllerHash() =>
    r'62e425071ecd51cd6ebbf6e73074d6d78b9e5c07';

abstract class _$UpcomingRangeController extends $Notifier<UpcomingRange> {
  UpcomingRange build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<UpcomingRange, UpcomingRange>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UpcomingRange, UpcomingRange>,
              UpcomingRange,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Запланированные занятия в выбранном горизонте, по времени начала.

@ProviderFor(upcomingLessons)
final upcomingLessonsProvider = UpcomingLessonsProvider._();

/// Запланированные занятия в выбранном горизонте, по времени начала.

final class UpcomingLessonsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LessonDetails>>,
          List<LessonDetails>,
          Stream<List<LessonDetails>>
        >
    with
        $FutureModifier<List<LessonDetails>>,
        $StreamProvider<List<LessonDetails>> {
  /// Запланированные занятия в выбранном горизонте, по времени начала.
  UpcomingLessonsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'upcomingLessonsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$upcomingLessonsHash();

  @$internal
  @override
  $StreamProviderElement<List<LessonDetails>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<LessonDetails>> create(Ref ref) {
    return upcomingLessons(ref);
  }
}

String _$upcomingLessonsHash() => r'5ad583b0f613caf54d694fe1792400312400e131';

/// Прошедшие, но не отмеченные занятия.

@ProviderFor(unmarkedLessons)
final unmarkedLessonsProvider = UnmarkedLessonsProvider._();

/// Прошедшие, но не отмеченные занятия.

final class UnmarkedLessonsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LessonDetails>>,
          List<LessonDetails>,
          Stream<List<LessonDetails>>
        >
    with
        $FutureModifier<List<LessonDetails>>,
        $StreamProvider<List<LessonDetails>> {
  /// Прошедшие, но не отмеченные занятия.
  UnmarkedLessonsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'unmarkedLessonsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$unmarkedLessonsHash();

  @$internal
  @override
  $StreamProviderElement<List<LessonDetails>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<LessonDetails>> create(Ref ref) {
    return unmarkedLessons(ref);
  }
}

String _$unmarkedLessonsHash() => r'82e54e76da3850b2afc2beb90dff7ff977d549cd';

/// Статистика текущего месяца: получено, начислено, проведено занятий.

@ProviderFor(currentMonthStats)
final currentMonthStatsProvider = CurrentMonthStatsProvider._();

/// Статистика текущего месяца: получено, начислено, проведено занятий.

final class CurrentMonthStatsProvider
    extends
        $FunctionalProvider<
          AsyncValue<PeriodStats>,
          PeriodStats,
          Stream<PeriodStats>
        >
    with $FutureModifier<PeriodStats>, $StreamProvider<PeriodStats> {
  /// Статистика текущего месяца: получено, начислено, проведено занятий.
  CurrentMonthStatsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentMonthStatsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentMonthStatsHash();

  @$internal
  @override
  $StreamProviderElement<PeriodStats> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PeriodStats> create(Ref ref) {
    return currentMonthStats(ref);
  }
}

String _$currentMonthStatsHash() => r'd83760c630237d026197933b1215853c1fbd75e8';

@ProviderFor(activeStudentsCount)
final activeStudentsCountProvider = ActiveStudentsCountProvider._();

final class ActiveStudentsCountProvider
    extends $FunctionalProvider<AsyncValue<int>, int, Stream<int>>
    with $FutureModifier<int>, $StreamProvider<int> {
  ActiveStudentsCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeStudentsCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeStudentsCountHash();

  @$internal
  @override
  $StreamProviderElement<int> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<int> create(Ref ref) {
    return activeStudentsCount(ref);
  }
}

String _$activeStudentsCountHash() =>
    r'bcf445adda0e3ca2e1537eb97b59c87f1b49c6e5';

/// Должники по убыванию долга.

@ProviderFor(dashboardDebtors)
final dashboardDebtorsProvider = DashboardDebtorsProvider._();

/// Должники по убыванию долга.

final class DashboardDebtorsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<StudentBalance>>,
          List<StudentBalance>,
          Stream<List<StudentBalance>>
        >
    with
        $FutureModifier<List<StudentBalance>>,
        $StreamProvider<List<StudentBalance>> {
  /// Должники по убыванию долга.
  DashboardDebtorsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardDebtorsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardDebtorsHash();

  @$internal
  @override
  $StreamProviderElement<List<StudentBalance>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<StudentBalance>> create(Ref ref) {
    return dashboardDebtors(ref);
  }
}

String _$dashboardDebtorsHash() => r'844a898967a30b377f953a0f9baa42a338c2bca6';

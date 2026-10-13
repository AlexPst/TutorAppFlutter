import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/providers/clock_provider.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_details.dart';
import 'package:tutor_app/features/lessons/lessons_providers.dart';

part 'lessons_calendar_providers.freezed.dart';
part 'lessons_calendar_providers.g.dart';

/// Режим календаря и выбранный день. Показываются сутки, неделя или месяц,
/// содержащие выбранный день.
@freezed
abstract class LessonsCalendarState with _$LessonsCalendarState {
  const factory LessonsCalendarState({
    required PeriodKind mode,
    required DateTime selectedDay,
  }) = _LessonsCalendarState;

  const LessonsCalendarState._();

  DatePeriod get period => mode.around(selectedDay);
}

@riverpod
class LessonsCalendarController extends _$LessonsCalendarController {
  @override
  LessonsCalendarState build() =>
      LessonsCalendarState(mode: PeriodKind.week, selectedDay: today());

  DateTime today() => dateOnly(ref.read(clockProvider)());

  void setMode(PeriodKind mode) => state = state.copyWith(mode: mode);

  void selectDay(DateTime day) =>
      state = state.copyWith(selectedDay: dateOnly(day));

  /// Открывает конкретный день в режиме «День».
  void openDay(DateTime day) =>
      state = state.copyWith(mode: PeriodKind.day, selectedDay: dateOnly(day));

  void showToday() => selectDay(today());

  void previous() => selectDay(state.mode.shift(state.selectedDay, -1));

  void next() => selectDay(state.mode.shift(state.selectedDay, 1));
}

@riverpod
Stream<List<LessonDetails>> lessonsInPeriod(Ref ref, DatePeriod period) =>
    ref.watch(lessonRepositoryProvider).watchLessons(period: period);

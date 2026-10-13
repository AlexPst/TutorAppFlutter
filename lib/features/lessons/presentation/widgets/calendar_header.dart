import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_app/core/widgets/period_switcher.dart';
import 'package:tutor_app/features/lessons/presentation/providers/lessons_calendar_providers.dart';

/// Переключатель «День / Неделя / Месяц» и навигация по периодам.
class CalendarHeader extends ConsumerWidget {
  const CalendarHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(lessonsCalendarControllerProvider);
    final controller = ref.read(lessonsCalendarControllerProvider.notifier);
    return PeriodSwitcher(
      kind: state.mode,
      date: state.selectedDay,
      today: controller.today(),
      onKindChanged: (mode) {
        if (mode != null) controller.setMode(mode);
      },
      onDateChanged: controller.selectDay,
    );
  }
}

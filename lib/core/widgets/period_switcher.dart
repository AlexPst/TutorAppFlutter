import 'package:flutter/material.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/l10n/l10n.dart';

extension PeriodKindUi on PeriodKind {
  String label(AppLocalizations l10n) => switch (this) {
    PeriodKind.day => l10n.periodDay,
    PeriodKind.week => l10n.periodWeek,
    PeriodKind.month => l10n.periodMonth,
  };

  /// `Вторник, 13 октября`, `12–18 октября`, `Октябрь 2026`.
  String titleFor(DateTime date, AppLocalizations l10n) => switch (this) {
    PeriodKind.day => Formatters.dayHeader(date),
    PeriodKind.week => l10n.weekRange(around(date)),
    PeriodKind.month => Formatters.monthTitle(date),
  };
}

/// Выбор периода: «День / Неделя / Месяц» (и при [allowAllTime] —
/// «Всё время»), стрелки, выбор даты по нажатию на заголовок и «Сегодня».
class PeriodSwitcher extends StatelessWidget {
  const PeriodSwitcher({
    super.key,
    required this.kind,
    required this.date,
    required this.today,
    required this.onKindChanged,
    required this.onDateChanged,
    this.allowAllTime = false,
  });

  /// `null` — «Всё время» (только при [allowAllTime]).
  final PeriodKind? kind;
  final DateTime date;
  final DateTime today;
  final ValueChanged<PeriodKind?> onKindChanged;
  final ValueChanged<DateTime> onDateChanged;
  final bool allowAllTime;

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(date.year - 2),
      lastDate: DateTime(date.year + 2),
    );
    if (picked != null) onDateChanged(dateOnly(picked));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final kind = this.kind;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SegmentedButton<PeriodKind?>(
              showSelectedIcon: false,
              segments: [
                if (allowAllTime)
                  ButtonSegment(value: null, label: Text(l10n.periodAll)),
                for (final option in PeriodKind.values)
                  ButtonSegment(value: option, label: Text(option.label(l10n))),
              ],
              selected: {kind},
              onSelectionChanged: (selection) =>
                  onKindChanged(selection.single),
            ),
          ),
          if (kind == null)
            const SizedBox(height: 8)
          else
            Row(
              children: [
                IconButton(
                  tooltip: l10n.commonBack,
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () => onDateChanged(kind.shift(date, -1)),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () => _pickDate(context),
                    child: Text(
                      kind.titleFor(date, l10n),
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                IconButton(
                  tooltip: l10n.commonForward,
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () => onDateChanged(kind.shift(date, 1)),
                ),
                TextButton(
                  onPressed: () => onDateChanged(today),
                  child: Text(l10n.commonToday),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

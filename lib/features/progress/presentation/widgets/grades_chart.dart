import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/features/progress/domain/models/subject_progress.dart';
import 'package:tutor_app/features/progress/presentation/progress_ui.dart';
import 'package:tutor_app/features/students/domain/models/grade_scale.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Линейный график оценок по времени.
///
/// Ось X — дни от первой оценки, поэтому расстояние между точками
/// отражает реальные паузы между занятиями. Ось Y — шкала ученика
/// целиком: так видно, насколько далеко оценки от максимума.
/// Пунктиром — средний балл. В компактном режиме (карточка ученика)
/// без осей, сетки и подсказок.
class GradesChart extends StatelessWidget {
  const GradesChart({
    super.key,
    required this.graded,
    required this.scale,
    this.height = 220,
    this.compact = false,
  });

  /// Записи с оценкой в хронологическом порядке.
  final List<ProgressItem> graded;
  final GradeScale scale;
  final double height;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (graded.isEmpty) {
      return SizedBox(
        height: compact ? null : height,
        child: Center(
          child: Text(
            context.l10n.chartEmpty,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      );
    }

    final first = graded.first.date;
    double xOf(ProgressItem item) =>
        item.date.difference(first).inMinutes / Duration.minutesPerDay;
    final spots = [
      for (final item in graded) FlSpot(xOf(item), item.grade!.toDouble()),
    ];
    final maxX = math.max(spots.last.x, 1).toDouble();
    final average =
        graded.map((item) => item.grade!).reduce((a, b) => a + b) /
        graded.length;
    final color = theme.colorScheme.primary;
    final l10n = context.l10n;

    return Semantics(
      label: l10n.chartSemantics(
        l10n.gradesCount(graded.length),
        formatAverage(average),
        scale.max,
      ),
      child: ExcludeSemantics(
        child: SizedBox(
          height: height,
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: maxX,
              minY: scale.min.toDouble(),
              maxY: scale.max.toDouble(),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(
                show: !compact,
                drawVerticalLine: false,
                horizontalInterval: _yInterval,
                getDrawingHorizontalLine: (_) => FlLine(
                  color: theme.colorScheme.outlineVariant,
                  strokeWidth: 1,
                ),
              ),
              titlesData: compact
                  ? const FlTitlesData(show: false)
                  : _titles(theme, first, maxX),
              extraLinesData: ExtraLinesData(
                horizontalLines: [
                  if (!compact)
                    HorizontalLine(
                      y: average,
                      color: theme.colorScheme.outline,
                      strokeWidth: 1,
                      dashArray: const [6, 4],
                      label: HorizontalLineLabel(
                        show: true,
                        alignment: Alignment.topRight,
                        style: theme.textTheme.labelSmall,
                        labelResolver: (_) =>
                            l10n.chartAverage(formatAverage(average)),
                      ),
                    ),
                ],
              ),
              lineTouchData: LineTouchData(
                enabled: !compact,
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (_) => theme.colorScheme.inverseSurface,
                  getTooltipItems: (touched) => [
                    for (final spot in touched)
                      LineTooltipItem(
                        _tooltip(graded[spot.spotIndex], l10n),
                        TextStyle(color: theme.colorScheme.onInverseSurface),
                      ),
                  ],
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  curveSmoothness: 0.2,
                  preventCurveOverShooting: true,
                  color: color,
                  barWidth: compact ? 2 : 3,
                  dotData: FlDotData(show: !compact || spots.length < 12),
                  belowBarData: BarAreaData(
                    show: true,
                    color: color.withValues(alpha: 0.12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Деления оси Y: каждая оценка на шкале 2–5, каждая вторая на 1–10,
  /// четверти на длинных шкалах.
  double get _yInterval {
    final range = scale.max - scale.min;
    if (range <= 5) return 1;
    if (range <= 10) return 2;
    return range / 4;
  }

  FlTitlesData _titles(ThemeData theme, DateTime first, double maxX) {
    const hidden = AxisTitles(sideTitles: SideTitles(showTitles: false));
    final style = theme.textTheme.labelSmall;
    return FlTitlesData(
      topTitles: hidden,
      rightTitles: hidden,
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 32,
          interval: _yInterval,
          getTitlesWidget: (value, meta) => SideTitleWidget(
            meta: meta,
            child: Text(value.round().toString(), style: style),
          ),
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 24,
          interval: math.max(maxX / 3, 1),
          getTitlesWidget: (value, meta) => SideTitleWidget(
            meta: meta,
            child: Text(
              Formatters.shortDate(
                first.add(Duration(minutes: (value * 1440).round())),
              ),
              style: style,
            ),
          ),
        ),
      ),
    );
  }

  String _tooltip(ProgressItem item, AppLocalizations l10n) =>
      '${item.grade} · ${item.topic ?? l10n.chartNoTopic}\n'
      '${Formatters.date(item.date)}';
}

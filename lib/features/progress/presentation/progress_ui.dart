import 'package:flutter/material.dart';
import 'package:tutor_app/app/theme/finance_colors.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/features/progress/domain/models/topic_mastery.dart';
import 'package:tutor_app/features/students/domain/models/grade_scale.dart';
import 'package:tutor_app/l10n/l10n.dart';

extension MasteryLevelUi on MasteryLevel {
  String label(AppLocalizations l10n) => switch (this) {
    MasteryLevel.mastered => l10n.masteryMastered,
    MasteryLevel.good => l10n.masteryGood,
    MasteryLevel.review => l10n.masteryReview,
    MasteryLevel.weak => l10n.masteryWeak,
  };

  Color color(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return switch (this) {
      MasteryLevel.mastered => FinanceColors.of(context).advance,
      MasteryLevel.good => colorScheme.primary,
      MasteryLevel.review => colorScheme.tertiary,
      MasteryLevel.weak => colorScheme.error,
    };
  }
}

extension ProgressTrendUi on ProgressTrend {
  String label(AppLocalizations l10n) => switch (this) {
    ProgressTrend.up => l10n.trendUp,
    ProgressTrend.down => l10n.trendDown,
    ProgressTrend.stable => l10n.trendStable,
  };

  IconData get icon => switch (this) {
    ProgressTrend.up => Icons.trending_up,
    ProgressTrend.down => Icons.trending_down,
    ProgressTrend.stable => Icons.trending_flat,
  };

  Color color(BuildContext context) => switch (this) {
    ProgressTrend.up => FinanceColors.of(context).advance,
    ProgressTrend.down => Theme.of(context).colorScheme.error,
    ProgressTrend.stable => Theme.of(context).colorScheme.outline,
  };
}

/// Средний балл: `4,3` / `4.3`.
String formatAverage(double value) => Formatters.decimal(value);

/// Оценка в кружке цвета её уровня освоения; без оценки — «—».
class GradeBadge extends StatelessWidget {
  const GradeBadge({super.key, required this.grade, required this.scale});

  final int? grade;
  final GradeScale scale;

  @override
  Widget build(BuildContext context) {
    final grade = this.grade;
    final colorScheme = Theme.of(context).colorScheme;
    final color = grade == null
        ? colorScheme.outline
        : MasteryLevel.of(scale.normalize(grade)).color(context);
    // Размер по содержимому (не меньше 36×36): `Container` с `alignment`
    // растянулся бы на всю доступную ширину, например в `ListTile.trailing`.
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: color),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Center(
            widthFactor: 1,
            heightFactor: 1,
            child: Text(
              grade?.toString() ?? '—',
              style: Theme.of(context).textTheme.labelLarge
                  ?.copyWith(color: color),
            ),
          ),
        ),
      ),
    );
  }
}

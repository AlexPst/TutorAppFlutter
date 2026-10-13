import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_app/core/widgets/messages.dart';
import 'package:tutor_app/features/progress/domain/models/subject_progress.dart';
import 'package:tutor_app/features/progress/domain/models/topic_mastery.dart';
import 'package:tutor_app/features/progress/domain/services/progress_analytics.dart';
import 'package:tutor_app/features/progress/presentation/progress_ui.dart';
import 'package:tutor_app/features/progress/presentation/providers/progress_screen_providers.dart';
import 'package:tutor_app/features/progress/presentation/widgets/grades_chart.dart';
import 'package:tutor_app/features/students/domain/models/enrollment_with_subject.dart';
import 'package:tutor_app/features/students/domain/models/grade_scale.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Краткий прогресс по предмету для карточки ученика: средний балл,
/// динамика, мини-график и темы, которые стоит повторить.
class EnrollmentProgressCard extends ConsumerWidget {
  const EnrollmentProgressCard({
    super.key,
    required this.enrollment,
    required this.scale,
    required this.onOpen,
  });

  final EnrollmentWithSubject enrollment;
  final GradeScale scale;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final progressValue = ref.watch(
      subjectProgressProvider(enrollment.enrollment.id),
    );

    final List<Widget> body;
    if (progressValue.value case final progress?) {
      body = _body(context, progress);
    } else if (progressValue.hasError) {
      body = [Text(errorMessage(context, progressValue.error!))];
    } else {
      body = [const LinearProgressIndicator()];
    }

    return Card.outlined(
      child: InkWell(
        onTap: onOpen,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(enrollment.subject.name, style: theme.textTheme.titleMedium),
              const SizedBox(height: 4),
              ...body,
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: onOpen,
                  child: Text(context.l10n.progressDetails),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _body(BuildContext context, SubjectProgress progress) {
    final theme = Theme.of(context);
    final graded = progress.gradedChronologically;
    final average = progress.averageGrade;
    final trend = ProgressAnalytics.trend(progress, scale);
    final toReview = ProgressAnalytics.topics(progress)
        .where(
          (topic) =>
              topic.lastGrade != null &&
              MasteryLevel.of(scale.normalize(topic.lastGrade!)).index >=
                  MasteryLevel.review.index,
        )
        .take(3)
        .map((topic) => topic.topic)
        .toList();

    return [
      Row(
        children: [
          Expanded(
            child: Text(
              average == null
                  ? context.l10n.noGradesYet
                  : context.l10n.averageSummary(
                      formatAverage(average),
                      scale.max,
                      context.l10n.gradesCount(graded.length),
                    ),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          if (trend != null)
            Tooltip(
              message: trend.label(context.l10n),
              child: Icon(trend.icon, color: trend.color(context)),
            ),
        ],
      ),
      if (graded.isNotEmpty) ...[
        const SizedBox(height: 8),
        GradesChart(graded: graded, scale: scale, height: 64, compact: true),
      ],
      if (toReview.isNotEmpty) ...[
        const SizedBox(height: 8),
        Text(context.l10n.toReview(toReview.join(', '))),
      ],
    ];
  }
}

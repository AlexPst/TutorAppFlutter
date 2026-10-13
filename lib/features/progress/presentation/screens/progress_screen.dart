import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/core/widgets/async_value_view.dart';
import 'package:tutor_app/core/widgets/content_width.dart';
import 'package:tutor_app/core/widgets/empty_state.dart';
import 'package:tutor_app/features/progress/domain/models/subject_progress.dart';
import 'package:tutor_app/features/progress/domain/models/topic_mastery.dart';
import 'package:tutor_app/features/progress/domain/services/progress_analytics.dart';
import 'package:tutor_app/features/progress/presentation/progress_ui.dart';
import 'package:tutor_app/features/progress/presentation/providers/progress_screen_providers.dart';
import 'package:tutor_app/features/progress/presentation/widgets/grades_chart.dart';
import 'package:tutor_app/features/students/domain/models/grade_scale.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Прогресс ученика по предмету: сводка, график, темы и хронология.
class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({
    super.key,
    required this.studentId,
    required this.enrollmentId,
  });

  final int studentId;
  final int enrollmentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contextValue = ref.watch(progressContextProvider(enrollmentId));
    if (contextValue.value case final loaded?
        when loaded.student.id == studentId) {
      return _ProgressView(progressContext: loaded);
    }
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.tabProgress)),
      body: AsyncValueView(
        value: contextValue,
        onRetry: () => ref.invalidate(progressContextProvider(enrollmentId)),
        data: (_) => EmptyState(
          icon: Icons.search_off,
          title: context.l10n.failureEnrollmentNotFound,
          message: context.l10n.commonNotFoundMaybeDeleted,
        ),
      ),
    );
  }
}

enum _Section { topics, timeline }

class _ProgressView extends ConsumerStatefulWidget {
  const _ProgressView({required this.progressContext});

  final ProgressContext progressContext;

  @override
  ConsumerState<_ProgressView> createState() => _ProgressViewState();
}

class _ProgressViewState extends ConsumerState<_ProgressView> {
  var _section = _Section.topics;

  @override
  Widget build(BuildContext context) {
    final (:student, :enrollment) = widget.progressContext;
    final enrollmentId = enrollment.enrollment.id;
    final scale = student.gradeScale;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(enrollment.subject.name),
            Text(student.fullName, style: theme.textTheme.bodySmall),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'progress-fab',
        onPressed: () => context.push(
          AppRoutes.newProgressEntry(enrollmentId: enrollmentId),
        ),
        icon: const Icon(Icons.add),
        label: Text(context.l10n.progressEntryFab),
      ),
      body: ContentWidth(
        child: AsyncValueView(
          value: ref.watch(subjectProgressProvider(enrollmentId)),
          onRetry: () => ref.invalidate(subjectProgressProvider(enrollmentId)),
          data: (progress) => ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 88),
            children: [
              _Summary(progress: progress, scale: scale),
              if (enrollment.enrollment.note case final note?) ...[
                const SizedBox(height: 12),
                Card.outlined(
                  child: ListTile(
                    leading: const Icon(Icons.flag_outlined),
                    title: Text(context.l10n.goalsTitle),
                    subtitle: Text(note),
                  ),
                ),
              ],
              const SizedBox(height: 12),
              Card.outlined(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 16, 8),
                  child: GradesChart(
                    graded: progress.gradedChronologically,
                    scale: scale,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SegmentedButton<_Section>(
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(
                    value: _Section.topics,
                    label: Text(context.l10n.sectionTopics),
                  ),
                  ButtonSegment(
                    value: _Section.timeline,
                    label: Text(context.l10n.sectionTimeline),
                  ),
                ],
                selected: {_section},
                onSelectionChanged: (selection) =>
                    setState(() => _section = selection.single),
              ),
              const SizedBox(height: 8),
              ...switch (_section) {
                _Section.topics => _topics(progress, scale),
                _Section.timeline => _timeline(progress, scale, enrollmentId),
              },
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _topics(SubjectProgress progress, GradeScale scale) {
    final topics = ProgressAnalytics.topics(progress);
    if (topics.isEmpty) {
      return [_Hint(context.l10n.topicsEmptyHint)];
    }
    return [
      for (final topic in topics)
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(topic.topic),
          subtitle: Text(_topicDetails(topic, scale)),
          trailing: GradeBadge(grade: topic.lastGrade, scale: scale),
        ),
    ];
  }

  String _topicDetails(TopicMastery topic, GradeScale scale) {
    final lastGrade = topic.lastGrade;
    final l10n = context.l10n;
    final level = lastGrade == null
        ? l10n.commonNoGrade
        : MasteryLevel.of(scale.normalize(lastGrade)).label(l10n);
    final count = topic.gradesCount;
    return [
      level,
      if (count > 1)
        l10n.topicGradesAverage(
          l10n.gradesCount(count),
          formatAverage(topic.averageGrade!),
        ),
      Formatters.date(topic.lastDate),
    ].join(' · ');
  }

  List<Widget> _timeline(
    SubjectProgress progress,
    GradeScale scale,
    int enrollmentId,
  ) {
    if (progress.items.isEmpty) {
      return [_Hint(context.l10n.timelineEmptyHint)];
    }
    return [
      for (final item in progress.items)
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            item.lessonId == null ? Icons.edit_note : Icons.event_note,
          ),
          title: Text(item.topic ?? context.l10n.commonNoTopic),
          subtitle: Text(
            [
              Formatters.date(item.date),
              if (item.lessonId == null) context.l10n.outsideLesson,
              ?item.note,
            ].join(' · '),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: GradeBadge(grade: item.grade, scale: scale),
          onTap: () => context.push(switch (item) {
            ProgressItem(:final entryId?) => AppRoutes.editProgressEntry(
              entryId,
            ),
            // У занятия ещё нет записи — создаём её с привязкой.
            ProgressItem(:final lessonId) => AppRoutes.newProgressEntry(
              enrollmentId: enrollmentId,
              lessonId: lessonId,
            ),
          }),
        ),
    ];
  }
}

class _Summary extends StatelessWidget {
  const _Summary({required this.progress, required this.scale});

  final SubjectProgress progress;
  final GradeScale scale;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final average = progress.averageGrade;
    final trend = ProgressAnalytics.trend(progress, scale);
    final graded = progress.gradedChronologically.length;
    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.averageGrade,
                    style: theme.textTheme.labelLarge,
                  ),
                  Text(
                    average == null
                        ? '—'
                        : context.l10n.averageOutOf(
                            formatAverage(average),
                            scale.max,
                          ),
                    style: theme.textTheme.headlineSmall,
                  ),
                  Text(
                    context.l10n.gradesWithScale(
                      context.l10n.gradesCount(graded),
                      scale.min,
                      scale.max,
                    ),
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            if (trend != null)
              Column(
                children: [
                  Icon(trend.icon, color: trend.color(context), size: 32),
                  Text(
                    trend.label(context.l10n),
                    style: theme.textTheme.labelMedium,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _Hint extends StatelessWidget {
  const _Hint(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 24),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium
          ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
    ),
  );
}

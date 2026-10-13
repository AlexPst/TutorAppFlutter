import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/core/widgets/empty_state.dart';
import 'package:tutor_app/features/lessons/presentation/widgets/lesson_tile.dart';
import 'package:tutor_app/features/students/presentation/providers/student_details_providers.dart';
import 'package:tutor_app/features/students/presentation/widgets/tabs/student_tab_view.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Занятия ученика (сначала новые) с быстрыми действиями и кнопкой
/// планирования.
class StudentLessonsTab extends ConsumerWidget {
  const StudentLessonsTab({super.key, required this.studentId});

  final int studentId;

  void _planLesson(BuildContext context) =>
      context.push(AppRoutes.newLesson(studentId: studentId));

  @override
  Widget build(BuildContext context, WidgetRef ref) => StudentTabView(
    storageKey: 'lessons',
    value: ref.watch(studentLessonsProvider(studentId)),
    onRetry: () => ref.invalidate(studentLessonsProvider(studentId)),
    isEmpty: (lessons) => lessons.isEmpty,
    empty: EmptyState(
      icon: Icons.event_note_outlined,
      title: context.l10n.studentLessonsEmptyTitle,
      message: context.l10n.studentLessonsEmptyMessage,
      actionLabel: context.l10n.planLesson,
      onAction: () => _planLesson(context),
    ),
    slivers: (lessons) => [
      SliverToBoxAdapter(
        child: Align(
          alignment: Alignment.centerLeft,
          child: FilledButton.tonalIcon(
            onPressed: () => _planLesson(context),
            icon: const Icon(Icons.add),
            label: Text(context.l10n.planLesson),
          ),
        ),
      ),
      const SliverToBoxAdapter(child: SizedBox(height: 8)),
      SliverList.separated(
        itemCount: lessons.length,
        itemBuilder: (context, index) => LessonTile(
          key: ValueKey(lessons[index].lesson.id),
          details: lessons[index],
          showStudent: false,
          showDate: true,
        ),
        separatorBuilder: (_, _) => const Divider(height: 1),
      ),
    ],
  );
}

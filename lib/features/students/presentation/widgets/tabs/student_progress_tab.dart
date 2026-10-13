import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/core/widgets/empty_state.dart';
import 'package:tutor_app/features/progress/presentation/widgets/enrollment_progress_card.dart';
import 'package:tutor_app/features/students/domain/models/enrollment_with_subject.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';
import 'package:tutor_app/features/students/presentation/providers/student_details_providers.dart';
import 'package:tutor_app/features/students/presentation/widgets/tabs/student_tab_view.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Краткий прогресс по каждому активному предмету; нажатие открывает
/// подробный экран с графиком и темами.
class StudentProgressTab extends ConsumerWidget {
  const StudentProgressTab({super.key, required this.student});

  final Student student;

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      StudentTabView<List<EnrollmentWithSubject>>(
        storageKey: 'progress',
        value: ref
            .watch(studentEnrollmentsProvider(student.id))
            .whenData(
              (items) =>
                  items.where((item) => !item.enrollment.isArchived).toList(),
            ),
        onRetry: () => ref.invalidate(studentEnrollmentsProvider(student.id)),
        isEmpty: (enrollments) => enrollments.isEmpty,
        empty: EmptyState(
          icon: Icons.trending_up,
          title: context.l10n.progressNoSubjectsTitle,
          message: context.l10n.progressNoSubjectsMessage,
        ),
        slivers: (enrollments) => [
          SliverList.separated(
            itemCount: enrollments.length,
            itemBuilder: (context, index) {
              final enrollment = enrollments[index];
              return EnrollmentProgressCard(
                enrollment: enrollment,
                scale: student.gradeScale,
                onOpen: () => context.go(
                  AppRoutes.studentProgress(
                    student.id,
                    enrollment.enrollment.id,
                  ),
                ),
              );
            },
            separatorBuilder: (_, _) => const SizedBox(height: 12),
          ),
        ],
      );
}

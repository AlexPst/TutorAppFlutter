import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/core/widgets/async_value_view.dart';
import 'package:tutor_app/core/widgets/content_width.dart';
import 'package:tutor_app/core/widgets/empty_state.dart';
import 'package:tutor_app/core/widgets/messages.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';
import 'package:tutor_app/features/students/presentation/controllers/student_actions_controller.dart';
import 'package:tutor_app/features/students/presentation/providers/student_details_providers.dart';
import 'package:tutor_app/features/students/presentation/widgets/student_header.dart';
import 'package:tutor_app/features/students/presentation/widgets/tabs/student_lessons_tab.dart';
import 'package:tutor_app/features/students/presentation/widgets/tabs/student_notes_tab.dart';
import 'package:tutor_app/features/students/presentation/widgets/tabs/student_payments_tab.dart';
import 'package:tutor_app/features/students/presentation/widgets/tabs/student_progress_tab.dart';
import 'package:tutor_app/l10n/l10n.dart';

class StudentDetailsScreen extends ConsumerWidget {
  const StudentDetailsScreen({super.key, required this.studentId});

  final int studentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final student = ref.watch(studentProvider(studentId));
    if (student.value case final loaded?) {
      return _StudentDetailsView(student: loaded);
    }
    return Scaffold(
      appBar: AppBar(),
      body: AsyncValueView(
        value: student,
        onRetry: () => ref.invalidate(studentProvider(studentId)),
        data: (_) => EmptyState(
          icon: Icons.person_off_outlined,
          title: context.l10n.failureStudentNotFound,
          message: context.l10n.commonNotFoundMaybeDeleted,
          actionLabel: context.l10n.toStudentsList,
          onAction: () => context.go(AppRoutes.students),
        ),
      ),
    );
  }
}

enum _MenuAction { archive, restore, delete }

class _StudentDetailsView extends ConsumerWidget {
  const _StudentDetailsView({required this.student});

  final Student student;

  Future<void> _onMenuAction(
    BuildContext context,
    WidgetRef ref,
    _MenuAction action,
  ) async {
    final actions = ref.read(
      studentActionsControllerProvider(student.id).notifier,
    );
    switch (action) {
      case _MenuAction.archive:
        if (await actions.setArchived(archived: true) && context.mounted) {
          showInfoSnackBar(context, context.l10n.studentMovedToArchive);
        }
      case _MenuAction.restore:
        await actions.setArchived(archived: false);
      case _MenuAction.delete:
        final confirmed = await showConfirmDialog(
          context,
          title: context.l10n.deleteStudentTitle,
          message: context.l10n.deleteStudentMessage,
          confirmLabel: context.l10n.commonDelete,
          destructive: true,
        );
        if (!confirmed) return;
        if (await actions.delete() && context.mounted) {
          context.go(AppRoutes.students);
          showInfoSnackBar(context, context.l10n.studentDeleted);
        }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(studentActionsControllerProvider(student.id), (_, state) {
      if (state case AsyncError(:final error)) {
        showErrorSnackBar(context, error);
      }
    });

    final l10n = context.l10n;
    final tabs = [
      l10n.tabLessons,
      l10n.tabPayments,
      l10n.tabProgress,
      l10n.tabNotes,
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverMainAxisGroup(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    title: Text(student.fullName),
                    actions: [
                      IconButton(
                        tooltip: context.l10n.commonEdit,
                        icon: const Icon(Icons.edit_outlined),
                        onPressed: () =>
                            context.go(AppRoutes.editStudent(student.id)),
                      ),
                      PopupMenuButton<_MenuAction>(
                        tooltip: context.l10n.commonMore,
                        onSelected: (action) =>
                            _onMenuAction(context, ref, action),
                        itemBuilder: (_) => [
                          if (student.isArchived)
                            PopupMenuItem(
                              value: _MenuAction.restore,
                              child: Text(l10n.restoreFromArchive),
                            )
                          else
                            PopupMenuItem(
                              value: _MenuAction.archive,
                              child: Text(l10n.toArchive),
                            ),
                          PopupMenuItem(
                            value: _MenuAction.delete,
                            child: Text(l10n.commonDelete),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: ContentWidth(child: StudentHeader(student: student)),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _TabBarHeader(
                      TabBar(tabs: [for (final tab in tabs) Tab(text: tab)]),
                    ),
                  ),
                ],
              ),
            ),
          ],
          body: TabBarView(
            children: [
              StudentLessonsTab(studentId: student.id),
              StudentPaymentsTab(studentId: student.id),
              StudentProgressTab(student: student),
              StudentNotesTab(student: student),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabBarHeader extends SliverPersistentHeaderDelegate {
  const _TabBarHeader(this.tabBar);

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) => Material(color: Theme.of(context).colorScheme.surface, child: tabBar);

  @override
  bool shouldRebuild(_TabBarHeader oldDelegate) => oldDelegate.tabBar != tabBar;
}

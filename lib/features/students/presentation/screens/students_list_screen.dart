import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/core/widgets/async_value_view.dart';
import 'package:tutor_app/core/widgets/content_width.dart';
import 'package:tutor_app/core/widgets/empty_state.dart';
import 'package:tutor_app/features/students/presentation/models/student_list_item.dart';
import 'package:tutor_app/features/students/presentation/models/student_list_query.dart';
import 'package:tutor_app/features/students/presentation/providers/students_list_providers.dart';
import 'package:tutor_app/features/students/presentation/widgets/student_list_filters.dart';
import 'package:tutor_app/features/students/presentation/widgets/student_tile.dart';
import 'package:tutor_app/l10n/l10n.dart';

class StudentsListScreen extends ConsumerWidget {
  const StudentsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(studentListQueryControllerProvider);
    final controller = ref.read(studentListQueryControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          query.archived
              ? context.l10n.studentsArchiveTitle
              : context.l10n.navStudents,
        ),
        actions: [
          PopupMenuButton<StudentSort>(
            tooltip: context.l10n.studentsSortTooltip,
            icon: const Icon(Icons.sort),
            initialValue: query.sort,
            onSelected: controller.setSort,
            itemBuilder: (_) => [
              for (final sort in StudentSort.values)
                CheckedPopupMenuItem(
                  value: sort,
                  checked: sort == query.sort,
                  child: Text(switch (sort) {
                    StudentSort.name => context.l10n.studentSortName,
                    StudentSort.debt => context.l10n.studentSortDebt,
                  }),
                ),
            ],
          ),
          IconButton(
            tooltip: query.archived
                ? context.l10n.studentsActiveTooltip
                : context.l10n.studentsArchiveTooltip,
            icon: Icon(
              query.archived
                  ? Icons.people_outline
                  : Icons.inventory_2_outlined,
            ),
            onPressed: () => controller.setArchived(archived: !query.archived),
          ),
        ],
      ),
      floatingActionButton: query.archived
          ? null
          : FloatingActionButton.extended(
              // Экраны вкладок живут в одном поддереве оболочки — теги кнопок
              // должны различаться, иначе конфликт Hero при открытии формы.
              heroTag: 'students-fab',
              onPressed: () => context.go(AppRoutes.newStudent),
              icon: const Icon(Icons.person_add_alt_1),
              label: Text(context.l10n.studentsAddFab),
            ),
      body: ContentWidth(
        child: Column(
          children: [
            const StudentListFilters(),
            Expanded(
              child: AsyncValueView(
                value: ref.watch(filteredStudentsProvider),
                onRetry: () => ref.invalidate(studentListItemsProvider),
                data: (result) => result.items.isEmpty
                    ? _EmptyList(query: query, total: result.total)
                    : _StudentList(items: result.items),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StudentList extends StatelessWidget {
  const _StudentList({required this.items});

  final List<StudentListItem> items;

  @override
  Widget build(BuildContext context) => ListView.builder(
    // Нижний отступ, чтобы FAB не закрывал последнюю строку.
    padding: const EdgeInsets.only(bottom: 88),
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];
      return StudentTile(
        key: ValueKey(item.student.id),
        item: item,
        onTap: () => context.go(AppRoutes.student(item.student.id)),
      );
    },
  );
}

class _EmptyList extends ConsumerWidget {
  const _EmptyList({required this.query, required this.total});

  final StudentListQuery query;
  final int total;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (total > 0) {
      return EmptyState(
        icon: Icons.search_off,
        title: context.l10n.studentsNoMatchesTitle,
        message: context.l10n.studentsNoMatchesMessage,
        actionLabel: context.l10n.studentsResetFilters,
        onAction: ref
            .read(studentListQueryControllerProvider.notifier)
            .resetFilters,
      );
    }
    if (query.archived) {
      return EmptyState(
        icon: Icons.inventory_2_outlined,
        title: context.l10n.studentsArchiveEmptyTitle,
        message: context.l10n.studentsArchiveEmptyMessage,
      );
    }
    return EmptyState(
      icon: Icons.school_outlined,
      title: context.l10n.studentsEmptyTitle,
      message: context.l10n.studentsEmptyMessage,
      actionLabel: context.l10n.commonAddStudent,
      onAction: () => context.go(AppRoutes.newStudent),
    );
  }
}

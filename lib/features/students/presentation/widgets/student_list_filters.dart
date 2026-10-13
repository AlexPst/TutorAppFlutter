import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_app/features/students/presentation/providers/students_list_providers.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Поиск и фильтры над списком учеников: строка поиска, «Должники»
/// и предметы.
class StudentListFilters extends ConsumerStatefulWidget {
  const StudentListFilters({super.key});

  @override
  ConsumerState<StudentListFilters> createState() => _StudentListFiltersState();
}

class _StudentListFiltersState extends ConsumerState<StudentListFilters> {
  late final _searchController = TextEditingController(
    text: ref.read(studentListQueryControllerProvider).search,
  );

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = ref.watch(studentListQueryControllerProvider);
    final controller = ref.read(studentListQueryControllerProvider.notifier);
    final subjects = ref.watch(subjectFilterOptionsProvider).value ?? const [];

    // Сброс фильтров из пустого состояния должен очищать и поле ввода.
    ref.listen(studentListQueryControllerProvider.select((q) => q.search), (
      _,
      search,
    ) {
      if (_searchController.text != search) _searchController.text = search;
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
          child: SearchBar(
            controller: _searchController,
            hintText: context.l10n.studentsSearchHint,
            leading: const Icon(Icons.search),
            elevation: const WidgetStatePropertyAll(0),
            trailing: [
              if (query.search.isNotEmpty)
                IconButton(
                  tooltip: context.l10n.commonClear,
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    _searchController.clear();
                    controller.setSearch('');
                  },
                ),
            ],
            onChanged: controller.setSearch,
          ),
        ),
        SizedBox(
          height: 48,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            children: [
              FilterChip(
                avatar: const Icon(Icons.priority_high, size: 18),
                label: Text(context.l10n.studentsDebtorsFilter),
                selected: query.onlyDebtors,
                onSelected: (selected) =>
                    controller.setOnlyDebtors(onlyDebtors: selected),
              ),
              for (final subject in subjects) ...[
                const SizedBox(width: 8),
                ChoiceChip(
                  label: Text(subject.name),
                  selected: query.subjectId == subject.id,
                  onSelected: (selected) =>
                      controller.setSubject(selected ? subject.id : null),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

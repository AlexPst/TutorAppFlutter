import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutor_app/features/students/presentation/models/student_list_item.dart';

part 'student_list_query.freezed.dart';

enum StudentSort { name, debt }

/// Поиск, фильтры и сортировка списка учеников.
@freezed
abstract class StudentListQuery with _$StudentListQuery {
  const factory StudentListQuery({
    @Default('') String search,
    @Default(StudentSort.name) StudentSort sort,
    int? subjectId,
    @Default(false) bool onlyDebtors,
    @Default(false) bool archived,
  }) = _StudentListQuery;

  const StudentListQuery._();

  bool get hasFilters =>
      search.trim().isNotEmpty || subjectId != null || onlyDebtors;

  /// Применяет поиск, фильтры и сортировку. Архивность здесь не
  /// проверяется: список уже загружен для нужного раздела.
  List<StudentListItem> apply(List<StudentListItem> items) {
    final needle = search.trim().toLowerCase();
    final result = items.where((item) {
      if (onlyDebtors && !item.hasDebt) return false;
      if (subjectId != null &&
          !item.subjects.any((subject) => subject.id == subjectId)) {
        return false;
      }
      if (needle.isEmpty) return true;
      final student = item.student;
      return [
        student.fullName,
        student.phone,
        student.telegram,
      ].any((field) => field?.toLowerCase().contains(needle) ?? false);
    }).toList();

    int byName(StudentListItem a, StudentListItem b) => a.student.fullName
        .toLowerCase()
        .compareTo(b.student.fullName.toLowerCase());

    result.sort(switch (sort) {
      StudentSort.name => byName,
      StudentSort.debt => (a, b) {
        final byDebt = b.debt.compareTo(a.debt);
        return byDebt != 0 ? byDebt : byName(a, b);
      },
    });
    return result;
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/features/finance/domain/models/student_balance.dart';
import 'package:tutor_app/features/finance/finance_providers.dart';
import 'package:tutor_app/features/students/domain/models/enrollment_with_subject.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';
import 'package:tutor_app/features/students/presentation/models/student_list_item.dart';
import 'package:tutor_app/features/students/presentation/models/student_list_query.dart';
import 'package:tutor_app/features/students/students_providers.dart';
import 'package:tutor_app/features/subjects/domain/models/subject.dart';

part 'students_list_providers.g.dart';

@riverpod
class StudentListQueryController extends _$StudentListQueryController {
  @override
  StudentListQuery build() => const StudentListQuery();

  void setSearch(String search) => state = state.copyWith(search: search);

  void setSort(StudentSort sort) => state = state.copyWith(sort: sort);

  void setSubject(int? subjectId) =>
      state = state.copyWith(subjectId: subjectId);

  void setOnlyDebtors({required bool onlyDebtors}) =>
      state = state.copyWith(onlyDebtors: onlyDebtors);

  void setArchived({required bool archived}) =>
      state = state.copyWith(archived: archived);

  void resetFilters() =>
      state = StudentListQuery(sort: state.sort, archived: state.archived);
}

@riverpod
Stream<List<Student>> students(Ref ref, {required bool archived}) =>
    ref.watch(studentRepositoryProvider).watchStudents(archived: archived);

@riverpod
Stream<List<EnrollmentWithSubject>> allEnrollments(Ref ref) =>
    ref.watch(studentRepositoryProvider).watchAllEnrollments();

@riverpod
Stream<List<StudentBalance>> studentBalances(Ref ref) =>
    ref.watch(paymentRepositoryProvider).watchBalances();

/// Ученики раздела вместе с предметами и балансами.
@riverpod
Future<List<StudentListItem>> studentListItems(
  Ref ref, {
  required bool archived,
}) async {
  final (students, enrollments, balances) = await (
    ref.watch(studentsProvider(archived: archived).future),
    ref.watch(allEnrollmentsProvider.future),
    ref.watch(studentBalancesProvider.future),
  ).wait;

  final subjectsByStudent = <int, List<Subject>>{};
  for (final item in enrollments) {
    subjectsByStudent
        .putIfAbsent(item.enrollment.studentId, () => [])
        .add(item.subject);
  }
  final balanceByStudent = {
    for (final balance in balances) balance.studentId: balance,
  };

  return [
    for (final student in students)
      StudentListItem(
        student: student,
        subjects: subjectsByStudent[student.id] ?? const [],
        balance: balanceByStudent[student.id],
      ),
  ];
}

/// Отфильтрованный список и общее число учеников в разделе — чтобы
/// отличать «учеников нет» от «никого не нашли».
@riverpod
AsyncValue<({List<StudentListItem> items, int total})> filteredStudents(
  Ref ref,
) {
  final query = ref.watch(studentListQueryControllerProvider);
  return ref
      .watch(studentListItemsProvider(archived: query.archived))
      .whenData((items) => (items: query.apply(items), total: items.length));
}

/// Предметы, по которым у учеников есть активные направления, — варианты
/// фильтра.
@riverpod
Future<List<Subject>> subjectFilterOptions(Ref ref) async {
  final enrollments = await ref.watch(allEnrollmentsProvider.future);
  final subjects = {
    for (final item in enrollments) item.subject.id: item.subject,
  };
  return subjects.values.toList()
    ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
}

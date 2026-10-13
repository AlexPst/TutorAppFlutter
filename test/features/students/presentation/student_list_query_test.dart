import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/finance/domain/models/student_balance.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';
import 'package:tutor_app/features/students/presentation/models/student_list_item.dart';
import 'package:tutor_app/features/students/presentation/models/student_list_query.dart';
import 'package:tutor_app/features/subjects/domain/models/subject.dart';

const _math = Subject(id: 1, name: 'Математика');
const _physics = Subject(id: 2, name: 'Физика');

StudentListItem _item(
  int id,
  String name, {
  List<Subject> subjects = const [],
  int debtRubles = 0,
  String? phone,
}) => StudentListItem(
  student: Student(id: id, fullName: name, phone: phone),
  subjects: subjects,
  balance: StudentBalance(
    studentId: id,
    studentName: name,
    lessonsCharged: Money.rubles(debtRubles),
  ),
);

void main() {
  final items = [
    _item(1, 'вера', subjects: [_physics]),
    _item(2, 'Анна', subjects: [_math], debtRubles: 1500),
    _item(3, 'Борис', subjects: [_math, _physics], debtRubles: 3000),
    _item(4, 'Глеб', phone: '+7 900 111-22-33'),
  ];

  List<String> names(StudentListQuery query) =>
      query.apply(items).map((item) => item.student.fullName).toList();

  test('по умолчанию — все по алфавиту без учёта регистра', () {
    expect(names(const StudentListQuery()), ['Анна', 'Борис', 'вера', 'Глеб']);
  });

  test('сортировка по долгу, при равенстве — по имени', () {
    expect(names(const StudentListQuery(sort: StudentSort.debt)), [
      'Борис',
      'Анна',
      'вера',
      'Глеб',
    ]);
  });

  test('поиск по имени и телефону', () {
    expect(names(const StudentListQuery(search: ' ВЕР ')), ['вера']);
    expect(names(const StudentListQuery(search: '111-22')), ['Глеб']);
  });

  test('фильтры по предмету и должникам комбинируются', () {
    expect(names(const StudentListQuery(subjectId: 2)), ['Борис', 'вера']);
    expect(names(const StudentListQuery(onlyDebtors: true)), ['Анна', 'Борис']);
    expect(names(const StudentListQuery(subjectId: 2, onlyDebtors: true)), [
      'Борис',
    ]);
  });

  test('hasFilters учитывает только поиск, предмет и должников', () {
    expect(const StudentListQuery(sort: StudentSort.debt).hasFilters, isFalse);
    expect(const StudentListQuery(search: ' ').hasFilters, isFalse);
    expect(const StudentListQuery(subjectId: 1).hasFilters, isTrue);
  });
}

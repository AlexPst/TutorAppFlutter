import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/finance/domain/models/student_balance.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';
import 'package:tutor_app/features/subjects/domain/models/subject.dart';

part 'student_list_item.freezed.dart';

/// Строка списка учеников: ученик, его активные предметы и баланс.
@freezed
abstract class StudentListItem with _$StudentListItem {
  const factory StudentListItem({
    required Student student,
    required List<Subject> subjects,
    StudentBalance? balance,
  }) = _StudentListItem;

  const StudentListItem._();

  /// Оплачено минус начислено.
  Money get balanceAmount => balance?.balance ?? Money.zero;

  Money get debt => balance?.debt ?? Money.zero;

  bool get hasDebt => balance?.hasDebt ?? false;
}

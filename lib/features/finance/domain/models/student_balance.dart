import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutor_app/core/domain/money.dart';

part 'student_balance.freezed.dart';

/// Финансовое состояние ученика по всем направлениям.
@freezed
abstract class StudentBalance with _$StudentBalance {
  const factory StudentBalance({
    required int studentId,
    required String studentName,
    @Default(false) bool isArchived,

    /// Занятия в оплачиваемых статусах, не списанные из пакета.
    @Default(Money.zero) Money lessonsCharged,

    /// Цены оформленных пакетов.
    @Default(Money.zero) Money packagesCharged,
    @Default(Money.zero) Money paid,
    DateTime? lastPaymentAt,
  }) = _StudentBalance;

  const StudentBalance._();

  Money get charged => lessonsCharged + packagesCharged;

  /// Оплачено минус начислено: больше нуля — аванс, меньше — долг.
  Money get balance => paid - charged;

  Money get debt => balance.isNegative ? -balance : Money.zero;

  bool get hasDebt => balance.isNegative;
}

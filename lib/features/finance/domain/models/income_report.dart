import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/domain/money.dart';

part 'income_report.freezed.dart';

/// Доходы и нагрузка по одному ученику за период.
@freezed
abstract class StudentIncome with _$StudentIncome {
  const factory StudentIncome({
    required int studentId,
    required String studentName,

    /// Платежи с датой оплаты в периоде.
    @Default(Money.zero) Money received,

    /// Оплачиваемые занятия вне пакетов, начавшиеся в периоде.
    @Default(Money.zero) Money lessonsCharged,

    /// Пакеты, оформленные в периоде.
    @Default(Money.zero) Money packagesSold,
    @Default(0) int completedLessons,
    @Default(Duration.zero) Duration completedDuration,
  }) = _StudentIncome;

  const StudentIncome._();

  Money get charged => lessonsCharged + packagesSold;

  bool get isEmpty =>
      received.isZero && charged.isZero && completedLessons == 0;
}

/// Отчёт о доходах за период.
///
/// «Получено» — деньги, которые пришли за период (кассовый метод).
/// «Начислено» — сколько стоит работа за период (метод начисления).
/// Они расходятся, если ученик платит заранее или с опозданием.
@freezed
abstract class IncomeReport with _$IncomeReport {
  const factory IncomeReport({
    required DatePeriod period,

    /// Только ученики с движением в периоде; сначала с большей суммой
    /// поступлений, затем начислений.
    required List<StudentIncome> students,
  }) = _IncomeReport;

  const IncomeReport._();

  Money get received => _sum((s) => s.received);

  Money get lessonsCharged => _sum((s) => s.lessonsCharged);

  Money get packagesSold => _sum((s) => s.packagesSold);

  Money get charged => lessonsCharged + packagesSold;

  int get completedLessons =>
      students.fold(0, (sum, s) => sum + s.completedLessons);

  Duration get completedDuration =>
      students.fold(Duration.zero, (sum, s) => sum + s.completedDuration);

  bool get isEmpty => students.isEmpty;

  Money _sum(Money Function(StudentIncome) amount) =>
      students.fold(Money.zero, (sum, s) => sum + amount(s));
}

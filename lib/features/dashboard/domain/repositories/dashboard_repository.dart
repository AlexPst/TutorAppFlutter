import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/features/dashboard/domain/models/period_stats.dart';

abstract interface class DashboardRepository {
  /// Статистика занятий, начислений и поступлений за [period].
  Stream<PeriodStats> watchPeriodStats(DatePeriod period);
}

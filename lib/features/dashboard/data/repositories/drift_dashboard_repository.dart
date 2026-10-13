import 'package:drift/drift.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/database/tables/lessons_table.dart';
import 'package:tutor_app/core/database/tables/sql_constraints.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/dashboard/domain/models/period_stats.dart';
import 'package:tutor_app/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';

class DriftDashboardRepository implements DashboardRepository {
  DriftDashboardRepository(this._db);

  final AppDatabase _db;

  static const _lessonsInPeriod = 'starts_at >= ?1 AND starts_at < ?2';

  /// `count_<status>` для каждого статуса занятия.
  static final _statusCountColumns = LessonStatus.values
      .map(
        (status) =>
            '(SELECT COUNT(*) FROM lessons '
            "WHERE $_lessonsInPeriod AND status = '${status.name}') "
            'AS count_${status.name}',
      )
      .join(',\n  ');

  /// Один запрос из скалярных подзапросов: каждый идёт по индексу
  /// соответствующей даты, а `watch` следит сразу за всеми таблицами.
  static final _statsSql =
      '''
SELECT
  $_statusCountColumns,
  (SELECT COALESCE(SUM(duration_minutes), 0) FROM lessons
   WHERE $_lessonsInPeriod AND status = '${LessonStatus.completed.name}')
    AS completed_minutes,
  (SELECT COALESCE(SUM(price_kopecks), 0) FROM lessons
   WHERE $_lessonsInPeriod
     AND package_id IS NULL
     AND ${sqlIn('status', billableLessonStatusValues)}) AS lessons_charged,
  (SELECT COALESCE(SUM(price_kopecks), 0) FROM lesson_packages
   WHERE purchased_at >= ?1 AND purchased_at < ?2) AS packages_sold,
  (SELECT COALESCE(SUM(amount_kopecks), 0) FROM payments
   WHERE paid_at >= ?1 AND paid_at < ?2) AS received
''';

  @override
  Stream<PeriodStats> watchPeriodStats(DatePeriod period) => _db
      .customSelect(
        _statsSql,
        variables: [
          Variable.withDateTime(period.start),
          Variable.withDateTime(period.end),
        ],
        readsFrom: {_db.lessons, _db.lessonPackages, _db.payments},
      )
      .watchSingle()
      .map(
        (row) => PeriodStats(
          period: period,
          lessonsByStatus: {
            for (final status in LessonStatus.values)
              status: row.read<int>('count_${status.name}'),
          },
          completedDuration: Duration(
            minutes: row.read<int>('completed_minutes'),
          ),
          lessonsCharged: Money(row.read<int>('lessons_charged')),
          packagesSold: Money(row.read<int>('packages_sold')),
          received: Money(row.read<int>('received')),
        ),
      );
}

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/core/database/database_providers.dart';
import 'package:tutor_app/features/dashboard/data/repositories/drift_dashboard_repository.dart';
import 'package:tutor_app/features/dashboard/domain/repositories/dashboard_repository.dart';

part 'dashboard_providers.g.dart';

@Riverpod(keepAlive: true)
DashboardRepository dashboardRepository(Ref ref) =>
    DriftDashboardRepository(ref.watch(appDatabaseProvider));

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/core/providers/clock_provider.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/core/widgets/content_width.dart';
import 'package:tutor_app/features/dashboard/presentation/widgets/quick_actions_card.dart';
import 'package:tutor_app/features/dashboard/presentation/widgets/summary_card.dart';
import 'package:tutor_app/features/dashboard/presentation/widgets/top_debtors_card.dart';
import 'package:tutor_app/features/dashboard/presentation/widgets/unmarked_lessons_card.dart';
import 'package:tutor_app/features/dashboard/presentation/widgets/upcoming_lessons_card.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Главный экран: быстрые действия, что нужно отметить, ближайшие
/// занятия, сводка и должники.
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = ref.watch(clockProvider)();
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.l10n.navHome),
            Text(
              Formatters.dayHeader(today),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: context.l10n.settingsTooltip,
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push(AppRoutes.settings),
          ),
        ],
      ),
      body: ContentWidth(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            QuickActionsCard(),
            SizedBox(height: 12),
            UnmarkedLessonsCard(),
            UpcomingLessonsCard(),
            SizedBox(height: 12),
            SummaryCard(),
            SizedBox(height: 12),
            TopDebtorsCard(),
          ],
        ),
      ),
    );
  }
}

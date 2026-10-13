import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Оболочка с основными разделами: нижняя панель на телефоне,
/// боковая — на широком экране (Linux).
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const _wideLayoutWidth = 720.0;

  /// Повторное нажатие на активный раздел возвращает к его началу.
  void _onSelected(int index) => navigationShell.goBranch(
    index,
    initialLocation: index == navigationShell.currentIndex,
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // Порядок совпадает с порядком веток в роутере.
    final destinations = [
      (Icons.home_outlined, Icons.home, l10n.navHome),
      (Icons.event_note_outlined, Icons.event_note, l10n.navSchedule),
      (
        Icons.account_balance_wallet_outlined,
        Icons.account_balance_wallet,
        l10n.navFinance,
      ),
      (Icons.people_outline, Icons.people, l10n.navStudents),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= _wideLayoutWidth) {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: navigationShell.currentIndex,
                  onDestinationSelected: _onSelected,
                  labelType: NavigationRailLabelType.all,
                  destinations: [
                    for (final (icon, selectedIcon, label) in destinations)
                      NavigationRailDestination(
                        icon: Icon(icon),
                        selectedIcon: Icon(selectedIcon),
                        label: Text(label),
                      ),
                  ],
                ),
                const VerticalDivider(width: 1),
                Expanded(child: navigationShell),
              ],
            ),
          );
        }
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _onSelected,
            destinations: [
              for (final (icon, selectedIcon, label) in destinations)
                NavigationDestination(
                  icon: Icon(icon),
                  selectedIcon: Icon(selectedIcon),
                  label: label,
                ),
            ],
          ),
        );
      },
    );
  }
}

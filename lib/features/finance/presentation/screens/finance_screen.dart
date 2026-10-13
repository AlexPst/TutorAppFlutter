import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/features/finance/presentation/widgets/debtors_tab.dart';
import 'package:tutor_app/features/finance/presentation/widgets/income_tab.dart';
import 'package:tutor_app/features/finance/presentation/widgets/payments_tab.dart';
import 'package:tutor_app/l10n/l10n.dart';

enum FinanceTab {
  payments,
  debtors,
  income;

  String label(AppLocalizations l10n) => switch (this) {
    FinanceTab.payments => l10n.paymentsSection,
    FinanceTab.debtors => l10n.financeTabDebtors,
    FinanceTab.income => l10n.financeTabIncome,
  };

  /// Вкладка из параметра `tab` ссылки; по умолчанию — платежи.
  static FinanceTab parse(String? value) => values.firstWhere(
    (tab) => tab.name == value,
    orElse: () => FinanceTab.payments,
  );
}

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key, this.initialTab = FinanceTab.payments});

  final FinanceTab initialTab;

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: FinanceTab.values.length,
    initialIndex: initialTab.index,
    child: Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.navFinance),
        bottom: TabBar(
          tabs: [
            for (final tab in FinanceTab.values)
              Tab(text: tab.label(context.l10n)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        // Экраны вкладок живут в одном поддереве оболочки — теги кнопок
        // должны различаться, иначе конфликт Hero при открытии формы.
        heroTag: 'finance-fab',
        onPressed: () => context.push(AppRoutes.newPayment()),
        icon: const Icon(Icons.add),
        label: Text(context.l10n.paymentShort),
      ),
      body: const TabBarView(
        children: [PaymentsTab(), DebtorsTab(), IncomeTab()],
      ),
    ),
  );
}

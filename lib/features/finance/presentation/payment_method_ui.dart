import 'package:tutor_app/features/finance/domain/models/payment_method.dart';
import 'package:tutor_app/l10n/l10n.dart';

extension PaymentMethodUi on PaymentMethod {
  String label(AppLocalizations l10n) => switch (this) {
    PaymentMethod.cardTransfer => l10n.methodCardTransfer,
    PaymentMethod.cash => l10n.methodCash,
    PaymentMethod.other => l10n.methodOther,
  };
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/features/finance/domain/models/payment.dart';
import 'package:tutor_app/features/finance/presentation/payment_method_ui.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Строка платежа; нажатие открывает редактирование.
class PaymentTile extends StatelessWidget {
  const PaymentTile({
    super.key,
    required this.payment,
    this.studentName,
    this.contentPadding,
  });

  final Payment payment;

  /// Имя ученика — в общем списке; в карточке ученика не нужно.
  final String? studentName;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final amount = Formatters.money(payment.amount);
    final details = [
      Formatters.date(payment.paidAt),
      payment.method.label(context.l10n),
      ?payment.comment,
    ].join(' · ');
    return ListTile(
      contentPadding: contentPadding,
      leading: const Icon(Icons.payments_outlined),
      title: Text(studentName ?? amount),
      subtitle: Text(details, maxLines: 2, overflow: TextOverflow.ellipsis),
      trailing: studentName == null ? null : Text(amount),
      onTap: () => context.push(AppRoutes.editPayment(payment.id)),
    );
  }
}

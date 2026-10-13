import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutor_app/core/utils/formatters.dart';
import 'package:tutor_app/core/widgets/messages.dart';
import 'package:tutor_app/features/finance/domain/models/student_balance.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Показывает готовый текст напоминания о долге: его можно поправить
/// и скопировать, чтобы отправить ученику в мессенджере.
Future<void> showDebtReminderDialog(
  BuildContext context,
  StudentBalance balance,
) async {
  if (!balance.hasDebt) {
    showInfoSnackBar(context, context.l10n.studentHasNoDebt);
    return;
  }
  final message = context.l10n.debtReminderText(
    balance.studentName.trim(),
    Formatters.money(balance.debt),
  );
  await showDialog<void>(
    context: context,
    builder: (_) => _DebtReminderDialog(initialText: message),
  );
}

class _DebtReminderDialog extends StatefulWidget {
  const _DebtReminderDialog({required this.initialText});

  final String initialText;

  @override
  State<_DebtReminderDialog> createState() => _DebtReminderDialogState();
}

class _DebtReminderDialogState extends State<_DebtReminderDialog> {
  late final _text = TextEditingController(text: widget.initialText);

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  Future<void> _copy() async {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final copiedMessage = context.l10n.reminderCopied;
    await Clipboard.setData(ClipboardData(text: _text.text));
    navigator.pop();
    messenger.showInfo(copiedMessage);
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(context.l10n.reminderTitle),
    content: SizedBox(
      width: 480,
      child: TextField(
        controller: _text,
        minLines: 5,
        maxLines: 10,
        decoration: InputDecoration(helperText: context.l10n.reminderEditHint),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text(context.l10n.commonCancel),
      ),
      FilledButton.icon(
        onPressed: _copy,
        icon: const Icon(Icons.copy),
        label: Text(context.l10n.commonCopyTooltip),
      ),
    ],
  );
}

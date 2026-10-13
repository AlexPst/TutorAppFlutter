import 'package:flutter/material.dart';
import 'package:tutor_app/core/widgets/messages.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Спрашивает подтверждение, если пользователь уходит с формы,
/// не сохранив изменения (кнопка «назад», жест, системная кнопка).
class UnsavedChangesScope extends StatelessWidget {
  const UnsavedChangesScope({
    super.key,
    required this.hasChanges,
    required this.child,
  });

  final bool hasChanges;
  final Widget child;

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: !hasChanges,
    onPopInvokedWithResult: (didPop, _) async {
      if (didPop) return;
      final leave = await showConfirmDialog(
        context,
        title: context.l10n.leaveWithoutSavingTitle,
        message: context.l10n.leaveWithoutSavingMessage,
        confirmLabel: context.l10n.leaveAction,
        destructive: true,
      );
      if (leave && context.mounted) Navigator.of(context).pop();
    },
    child: child,
  );
}

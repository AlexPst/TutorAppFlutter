import 'package:flutter/material.dart';
import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/core/logging/app_logger.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Текст ошибки для пользователя: перевод причины [AppFailure] или общая
/// фраза для непредвиденных ошибок.
String errorMessage(BuildContext context, Object error) => switch (error) {
  final AppFailure failure => context.l10n.failure(failure),
  _ => context.l10n.errorUnexpected,
};

void showErrorSnackBar(BuildContext context, Object error) =>
    ScaffoldMessenger.of(context).showError(error);

void showInfoSnackBar(BuildContext context, String message) =>
    ScaffoldMessenger.of(context).showInfo(message);

/// Для сообщений после `await`: messenger берут до операции, потому что
/// виджет, запустивший её, к этому моменту может исчезнуть с экрана.
extension AppSnackBars on ScaffoldMessengerState {
  void showInfo(String message) => this
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message)));

  /// Непредвиденные ошибки дополнительно пишутся в журнал.
  void showError(Object error) {
    if (error is! AppFailure) {
      AppLogger.error('Operation failed', error, StackTrace.current);
    }
    showInfo(errorMessage(context, error));
  }
}

/// Диалог подтверждения. Возвращает `true`, только если пользователь
/// нажал кнопку подтверждения.
Future<bool> showConfirmDialog(
  BuildContext context, {
  required String title,
  required String message,
  required String confirmLabel,
  bool destructive = false,
}) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) {
      final colorScheme = Theme.of(context).colorScheme;
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(context.l10n.commonCancel),
          ),
          FilledButton(
            style: destructive
                ? FilledButton.styleFrom(
                    backgroundColor: colorScheme.error,
                    foregroundColor: colorScheme.onError,
                  )
                : null,
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(confirmLabel),
          ),
        ],
      );
    },
  );
  return confirmed ?? false;
}

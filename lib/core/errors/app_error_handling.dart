import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_app/core/logging/app_logger.dart';
import 'package:tutor_app/core/widgets/messages.dart';
import 'package:tutor_app/l10n/app_localizations.dart';

/// Messenger всего приложения: через него показываются ошибки, у которых
/// нет своего экрана (необработанные исключения в обработчиках событий).
final appMessengerKey = GlobalKey<ScaffoldMessengerState>();

/// Глобальная обработка ошибок. Вызывается в `bootstrap` до `runApp`.
///
/// - Ошибки фреймворка (сборка, раскладка) пишутся в журнал; в debug
///   вдобавок печатаются в консоль как обычно.
/// - Необработанные асинхронные ошибки пишутся в журнал, а пользователь
///   видит SnackBar вместо молчаливого сбоя.
/// - Сломанный виджет заменяется аккуратной заглушкой [AppErrorWidget]
///   вместо красного экрана.
void installErrorHandlers() {
  FlutterError.onError = (details) {
    if (kDebugMode) FlutterError.presentError(details);
    AppLogger.error('Flutter error', details.exception, details.stack);
  };

  PlatformDispatcher.instance.onError = (error, stackTrace) {
    AppLogger.error('Uncaught error', error, stackTrace);
    appMessengerKey.currentState?.showError(error);
    return true;
  };

  ErrorWidget.builder = (details) => AppErrorWidget(details: details);
}

/// Пишет в журнал ошибки провайдеров: ошибка, показанная на экране как
/// «Не удалось загрузить», иначе не оставила бы следа.
final class AppProviderObserver extends ProviderObserver {
  const AppProviderObserver();

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) => AppLogger.error(
    'Provider failed: ${context.provider.name ?? context.provider}',
    error,
    stackTrace,
  );
}

/// Заглушка вместо виджета, который не удалось построить. В debug
/// показывает текст исключения.
class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key, required this.details});

  final FlutterErrorDetails details;

  @override
  Widget build(BuildContext context) {
    // Ошибка могла случиться выше локализаций — тогда нужен запасной текст.
    final title =
        Localizations.of<AppLocalizations>(
          context,
          AppLocalizations,
        )?.errorWidgetTitle ??
        "This section couldn't be displayed";
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: colorScheme.errorContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.broken_image_outlined,
              color: colorScheme.onErrorContainer,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: colorScheme.onErrorContainer),
            ),
            if (kDebugMode) ...[
              const SizedBox(height: 8),
              Text(
                details.exceptionAsString(),
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: colorScheme.onErrorContainer,
                  fontSize: 12,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

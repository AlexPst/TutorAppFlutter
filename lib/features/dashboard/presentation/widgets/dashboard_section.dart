import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_app/core/widgets/messages.dart';

/// Карточка раздела главного экрана: заголовок, необязательная ссылка
/// «Все…» и содержимое.
class DashboardSection extends StatelessWidget {
  const DashboardSection({
    super.key,
    required this.title,
    required this.child,
    this.actionLabel,
    this.onAction,
    this.trailing,
  });

  final String title;
  final Widget child;
  final String? actionLabel;
  final VoidCallback? onAction;

  /// Элемент справа от заголовка, например переключатель.
  final Widget? trailing;

  @override
  Widget build(BuildContext context) => Card.outlined(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              ?trailing,
            ],
          ),
          const SizedBox(height: 8),
          child,
          if (actionLabel != null && onAction != null)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(onPressed: onAction, child: Text(actionLabel!)),
            ),
        ],
      ),
    ),
  );
}

/// Компактные состояния загрузки и ошибки внутри карточки: главный экран
/// не должен целиком ждать самый медленный раздел.
class SectionAsync<T> extends StatelessWidget {
  const SectionAsync({super.key, required this.value, required this.data});

  final AsyncValue<T> value;
  final Widget Function(T data) data;

  @override
  Widget build(BuildContext context) {
    if (value.hasValue && !value.hasError) return data(value.requireValue);
    if (value.hasError) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          errorMessage(context, value.error!),
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
    }
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: LinearProgressIndicator(),
    );
  }
}

/// Пояснение вместо пустого списка.
class SectionHint extends StatelessWidget {
  const SectionHint(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium
          ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
    ),
  );
}

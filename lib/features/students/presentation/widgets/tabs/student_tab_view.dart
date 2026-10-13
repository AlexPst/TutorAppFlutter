import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_app/core/widgets/error_view.dart';

/// Содержимое вкладки карточки ученика внутри `NestedScrollView`.
///
/// Подставляет `SliverOverlapInjector`, чтобы закреплённые заголовок
/// и вкладки не перекрывали начало списка, и показывает загрузку, ошибку
/// или пустое состояние на всю высоту вкладки.
class StudentTabView<T> extends StatelessWidget {
  const StudentTabView({
    super.key,
    required this.storageKey,
    required this.value,
    required this.isEmpty,
    required this.empty,
    required this.slivers,
    this.onRetry,
  });

  /// Сохраняет позицию прокрутки при переключении вкладок.
  final String storageKey;
  final AsyncValue<T> value;
  final bool Function(T data) isEmpty;
  final Widget empty;
  final List<Widget> Function(T data) slivers;
  final VoidCallback? onRetry;

  static const _maxContentWidth = 840.0;

  @override
  Widget build(BuildContext context) {
    final Widget content;
    if (value.hasValue && !value.hasError) {
      final data = value.requireValue;
      content = isEmpty(data)
          ? SliverFillRemaining(child: empty)
          : SliverLayoutBuilder(
              builder: (context, constraints) {
                final horizontal = math.max(
                  16.0,
                  (constraints.crossAxisExtent - _maxContentWidth) / 2,
                );
                return SliverPadding(
                  padding: EdgeInsets.fromLTRB(horizontal, 16, horizontal, 32),
                  sliver: SliverMainAxisGroup(slivers: slivers(data)),
                );
              },
            );
    } else if (value.hasError) {
      content = SliverFillRemaining(
        child: ErrorView(error: value.error!, onRetry: onRetry),
      );
    } else {
      content = const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return CustomScrollView(
      key: PageStorageKey<String>(storageKey),
      slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        content,
      ],
    );
  }
}

/// Заголовок раздела внутри вкладки.
class TabSectionTitle extends StatelessWidget {
  const TabSectionTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      child: Text(text, style: Theme.of(context).textTheme.titleSmall),
    ),
  );
}

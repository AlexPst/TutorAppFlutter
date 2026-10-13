import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_app/core/widgets/error_view.dart';

/// Показывает загрузку, ошибку или данные [AsyncValue].
///
/// При перезагрузке, когда данные уже есть, продолжает показывать их, а не
/// индикатор: стримы Drift переиздаются при каждом изменении БД, и мигание
/// раздражало бы.
class AsyncValueView<T> extends StatelessWidget {
  const AsyncValueView({
    super.key,
    required this.value,
    required this.data,
    this.onRetry,
  });

  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    if (value.hasValue && !value.hasError) return data(value.requireValue);
    if (value.hasError) {
      return ErrorView(error: value.error!, onRetry: onRetry);
    }
    return const Center(child: CircularProgressIndicator());
  }
}

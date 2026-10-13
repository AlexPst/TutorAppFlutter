import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/core/widgets/empty_state.dart';
import 'package:tutor_app/l10n/l10n.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key, this.title, this.message});

  /// По умолчанию — «Страница не найдена».
  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: EmptyState(
      icon: Icons.search_off,
      title: title ?? context.l10n.notFoundTitle,
      message: message,
      actionLabel: context.l10n.toStudentsList,
      onAction: () => context.go(AppRoutes.students),
    ),
  );
}

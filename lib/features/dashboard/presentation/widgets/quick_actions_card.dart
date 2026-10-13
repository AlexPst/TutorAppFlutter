import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Быстрые действия: ученик, занятие, платёж.
class QuickActionsCard extends StatelessWidget {
  const QuickActionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      (
        Icons.person_add_alt_1_outlined,
        context.l10n.studentsAddFab,
        // Форма ученика живёт во вкладке «Ученики»: после сохранения
        // откроется его карточка.
        () => context.go(AppRoutes.newStudent),
      ),
      (
        Icons.event_available_outlined,
        context.l10n.lessonsFab,
        () => context.push(AppRoutes.newLesson()),
      ),
      (
        Icons.payments_outlined,
        context.l10n.paymentShort,
        () => context.push(AppRoutes.newPayment()),
      ),
    ];
    return Row(
      children: [
        for (final (index, (icon, label, onPressed)) in actions.indexed) ...[
          if (index > 0) const SizedBox(width: 8),
          Expanded(
            child: FilledButton.tonal(
              onPressed: onPressed,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon),
                  const SizedBox(height: 4),
                  Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tutor_app/core/widgets/balance_badge.dart';
import 'package:tutor_app/features/students/presentation/models/student_list_item.dart';
import 'package:tutor_app/features/students/presentation/widgets/student_avatar.dart';
import 'package:tutor_app/l10n/l10n.dart';

class StudentTile extends StatelessWidget {
  const StudentTile({super.key, required this.item, required this.onTap});

  final StudentListItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final subjects = item.subjects.map((subject) => subject.name).join(', ');
    return ListTile(
      leading: StudentAvatar(fullName: item.student.fullName),
      title: Text(item.student.fullName),
      subtitle: Text(
        subjects.isEmpty ? context.l10n.studentNoSubjects : subjects,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: BalanceBadge(balance: item.balanceAmount),
      onTap: onTap,
    );
  }
}

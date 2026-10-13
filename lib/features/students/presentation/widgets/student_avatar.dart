import 'package:flutter/material.dart';

/// Аватар с инициалами: «Анна Петрова» → «АП».
class StudentAvatar extends StatelessWidget {
  const StudentAvatar({super.key, required this.fullName, this.radius});

  final String fullName;
  final double? radius;

  @override
  Widget build(BuildContext context) =>
      CircleAvatar(radius: radius, child: Text(initialsOf(fullName)));

  static String initialsOf(String fullName) => fullName
      .trim()
      .split(RegExp(r'\s+'))
      .where((part) => part.isNotEmpty)
      .take(2)
      .map((part) => part.characters.first.toUpperCase())
      .join();
}

import 'package:flutter/material.dart';

/// Поле формы, открывающее выбор даты или времени по нажатию.
class PickerField extends StatelessWidget {
  const PickerField({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(4),
    child: InputDecorator(
      decoration: InputDecoration(labelText: label, suffixIcon: Icon(icon)),
      child: Text(value),
    ),
  );
}

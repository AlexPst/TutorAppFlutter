import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutor_app/features/students/domain/models/grade_scale.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Выбор оценки по шкале ученика: короткие шкалы (до 11 значений) —
/// чипами, длинные (например, 0–100) — вводом числа. Повторное нажатие
/// на выбранный чип снимает оценку.
class GradePicker extends StatefulWidget {
  const GradePicker({
    super.key,
    required this.scale,
    required this.value,
    required this.onChanged,
  });

  final GradeScale scale;
  final int? value;
  final ValueChanged<int?> onChanged;

  static const maxChipGrades = 11;

  @override
  State<GradePicker> createState() => _GradePickerState();
}

class _GradePickerState extends State<GradePicker> {
  late final _input = TextEditingController(text: widget.value?.toString());

  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scale = widget.scale;
    if (scale.max - scale.min < GradePicker.maxChipGrades) {
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (var grade = scale.min; grade <= scale.max; grade++)
            ChoiceChip(
              label: Text('$grade'),
              selected: widget.value == grade,
              onSelected: (selected) =>
                  widget.onChanged(selected ? grade : null),
            ),
        ],
      );
    }
    final value = widget.value;
    return TextField(
      controller: _input,
      decoration: InputDecoration(
        labelText: context.l10n.commonGrade,
        hintText: context.l10n.commonNoGrade,
        errorText: value != null && !scale.contains(value)
            ? context.l10n.gradeRange(scale.min, scale.max)
            : null,
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: (text) => widget.onChanged(int.tryParse(text)),
    );
  }
}

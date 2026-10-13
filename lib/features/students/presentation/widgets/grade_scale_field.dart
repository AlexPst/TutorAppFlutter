import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutor_app/core/domain/field_error.dart';
import 'package:tutor_app/features/students/domain/models/grade_scale.dart';
import 'package:tutor_app/features/students/domain/student_validator.dart';
import 'package:tutor_app/l10n/l10n.dart';

enum _ScaleOption {
  fivePoint('2–5', GradeScale.fivePoint),
  tenPoint('1–10', GradeScale.tenPoint),
  percent('0–100', GradeScale.percent),
  custom(null, null);

  const _ScaleOption(this.label, this.scale);

  /// Диапазон для готовых шкал; у своей подпись переводится.
  final String? label;
  final GradeScale? scale;
}

/// Выбор шкалы оценок: готовые варианты или свой диапазон. Поля своего
/// диапазона проверяются вместе с остальной формой.
class GradeScaleField extends StatefulWidget {
  const GradeScaleField({
    super.key,
    required this.initial,
    required this.onChanged,
  });

  final GradeScale initial;

  /// Текущая шкала или `null`, пока свой диапазон введён неверно.
  final ValueChanged<GradeScale?> onChanged;

  @override
  State<GradeScaleField> createState() => _GradeScaleFieldState();
}

class _GradeScaleFieldState extends State<GradeScaleField> {
  late var _option = _ScaleOption.values.firstWhere(
    (option) => option.scale == widget.initial,
    orElse: () => _ScaleOption.custom,
  );
  late final _min = TextEditingController(text: '${widget.initial.min}');
  late final _max = TextEditingController(text: '${widget.initial.max}');

  @override
  void dispose() {
    _min.dispose();
    _max.dispose();
    super.dispose();
  }

  GradeScale? get _current {
    if (_option.scale case final scale?) return scale;
    final min = int.tryParse(_min.text.trim());
    final max = int.tryParse(_max.text.trim());
    if (min == null || max == null) return null;
    if (StudentValidator.gradeBound('$min') != null ||
        StudentValidator.gradeBound('$max') != null ||
        StudentValidator.gradeScale(min, max) != null) {
      return null;
    }
    return GradeScale(min: min, max: max);
  }

  /// Граница шкалы и заодно «от < до».
  FieldError? _checkMax(String? value) {
    final boundError = StudentValidator.gradeBound(value);
    if (boundError != null) return boundError;
    final min = int.tryParse(_min.text.trim());
    if (min == null) return null;
    return StudentValidator.gradeScale(min, int.parse(value!.trim()));
  }

  void _notify() => widget.onChanged(_current);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SegmentedButton<_ScaleOption>(
          showSelectedIcon: false,
          segments: [
            for (final option in _ScaleOption.values)
              ButtonSegment(
                value: option,
                label: Text(option.label ?? context.l10n.gradeScaleCustom),
              ),
          ],
          selected: {_option},
          onSelectionChanged: (selection) {
            setState(() => _option = selection.single);
            _notify();
          },
        ),
        if (_option == _ScaleOption.custom) ...[
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  controller: _min,
                  decoration: InputDecoration(
                    labelText: context.l10n.gradeScaleFrom,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: localizedValidator(
                    context,
                    StudentValidator.gradeBound,
                  ),
                  onChanged: (_) => _notify(),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _max,
                  decoration: InputDecoration(
                    labelText: context.l10n.gradeScaleTo,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: localizedValidator(context, _checkMax),
                  onChanged: (_) => _notify(),
                ),
              ),
            ],
          ),
        ],
        const SizedBox(height: 4),
        Text(
          context.l10n.gradeScaleHint,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

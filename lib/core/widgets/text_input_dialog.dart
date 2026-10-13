import 'package:flutter/material.dart';
import 'package:tutor_app/l10n/l10n.dart';

/// Диалог ввода текста. Возвращает введённый текст (возможно, пустой)
/// или `null`, если пользователь отменил ввод.
Future<String?> showTextInputDialog(
  BuildContext context, {
  required String title,
  required String label,
  String initialValue = '',
  String? confirmLabel,
  String? hintText,
  bool multiline = false,
  FormFieldValidator<String>? validator,
}) => showDialog<String>(
  context: context,
  builder: (_) => _TextInputDialog(
    title: title,
    label: label,
    initialValue: initialValue,
    confirmLabel: confirmLabel ?? context.l10n.commonSave,
    hintText: hintText,
    multiline: multiline,
    validator: validator,
  ),
);

class _TextInputDialog extends StatefulWidget {
  const _TextInputDialog({
    required this.title,
    required this.label,
    required this.initialValue,
    required this.confirmLabel,
    required this.hintText,
    required this.multiline,
    required this.validator,
  });

  final String title;
  final String label;
  final String initialValue;
  final String confirmLabel;
  final String? hintText;
  final bool multiline;
  final FormFieldValidator<String>? validator;

  @override
  State<_TextInputDialog> createState() => _TextInputDialogState();
}

class _TextInputDialogState extends State<_TextInputDialog> {
  final _formKey = GlobalKey<FormState>();
  late final _controller = TextEditingController(text: widget.initialValue);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pop(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(widget.title),
    content: SizedBox(
      width: 480,
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          autofocus: true,
          decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hintText,
          ),
          textCapitalization: TextCapitalization.sentences,
          minLines: widget.multiline ? 3 : 1,
          maxLines: widget.multiline ? 8 : 1,
          textInputAction: widget.multiline
              ? TextInputAction.newline
              : TextInputAction.done,
          onFieldSubmitted: widget.multiline ? null : (_) => _submit(),
          validator: widget.validator,
        ),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text(context.l10n.commonCancel),
      ),
      FilledButton(onPressed: _submit, child: Text(widget.confirmLabel)),
    ],
  );
}

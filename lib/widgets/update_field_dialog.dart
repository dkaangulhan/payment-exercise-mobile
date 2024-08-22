import 'package:flutter/material.dart';

/// The dialog can be used to update a field.
class UpdateFieldDialog extends StatefulWidget {
  /// The dialog can be used to update a field.
  const UpdateFieldDialog({
    required this.title,
    required this.initialValue,
    required this.onSaved,
    super.key,
  });

  // ignore: public_member_api_docs
  final String title;
  // ignore: public_member_api_docs
  final String initialValue;
  // ignore: public_member_api_docs
  final Future<void> Function(String) onSaved;

  /// Show the dialog.
  static Future<String?> show({
    required BuildContext context,
    required String title,
    required String initialValue,
    required Future<void> Function(String) onSaved,
  }) {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return UpdateFieldDialog(
          title: title,
          initialValue: initialValue,
          onSaved: onSaved,
        );
      },
    );
  }

  @override
  State<UpdateFieldDialog> createState() => _UpdateFieldDialogState();
}

class _UpdateFieldDialogState extends State<UpdateFieldDialog> {
  late final controller = TextEditingController(text: widget.initialValue);

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(widget.title),
      content: TextField(
        controller: controller,
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            await widget.onSaved(controller.text);
            Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}

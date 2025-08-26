import 'package:flutter/material.dart';

class AddItemDialog extends StatefulWidget {
  final ValueChanged<String> onSave;
  const AddItemDialog({super.key, required this.onSave});

  @override
  State<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final _controller = TextEditingController();

  void _submit() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) widget.onSave(text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add item'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: const InputDecoration(hintText: 'e.g. Milk'),
        onSubmitted: (_) => _submit(),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Discard')),
        ElevatedButton(onPressed: _submit, child: const Text('Save')),
      ],
    );
  }
}
import 'package:flutter/material.dart';

class DeleteTask extends StatelessWidget {
  final int index;
  final Function(int) onSaved;
  final VoidCallback onCanceled;
  const DeleteTask({
    super.key,
    required this.index,
    required this.onSaved,
    required this.onCanceled,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Confirm delete",
        style: TextStyle(color: Colors.red),
      ),
      content: const Text("Are you sure to delete this task?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () => onSaved(index),
          child: const Text(
            "Delete",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}

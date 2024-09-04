import 'package:flutter/material.dart';

class EditTask extends StatelessWidget {
  final TextEditingController controller;
  final int index;
  final Function(int) onSaved;
  final VoidCallback onCanceled;

  const EditTask({
    super.key,
    required this.controller,
    required this.index,
    required this.onSaved,
    required this.onCanceled,
  });

  @override
  Widget build(BuildContext context) {
    String taskName = controller.text;
    return AlertDialog(
      title: Text('Edit "$taskName"'),
      content: SizedBox(
        width: 300,
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "What are you going to do?",
                hintStyle: const TextStyle(
                  color: Color.fromARGB(128, 0, 0, 0),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onCanceled,
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () => onSaved(index),
                  child: const Text("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

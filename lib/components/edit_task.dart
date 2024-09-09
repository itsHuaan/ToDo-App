import 'package:flutter/material.dart';
import 'package:todo_list/components/buttons.dart';

class EditTask extends StatelessWidget {
  final TextEditingController taskNameController;
  final TextEditingController taskDescriptionController;
  final int index;
  final Function(int) onSaved;
  final VoidCallback onCanceled;

  const EditTask({
    super.key,
    required this.taskNameController,
    required this.taskDescriptionController,
    required this.index,
    required this.onSaved,
    required this.onCanceled,
  });

  @override
  Widget build(BuildContext context) {
    String taskName = taskNameController.text;
    double popupWidth = 300.0;
    return AlertDialog(
      title: Text('Edit "$taskName"'),
      content: Column(
        mainAxisSize: MainAxisSize.min, // Column takes only as much vertical space as needed
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: popupWidth,
              child: TextField(
                controller: taskNameController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelText: "Task name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: popupWidth,
              child: TextField(
                maxLines: 3,
                controller: taskDescriptionController,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelText: "Task description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Buttons(
                buttonOnPressed: onCanceled,
                buttonText: "Cancel",
              ),
              const SizedBox(width: 8), // Add spacing between buttons
              TextButton(
                onPressed: () => onSaved(index),
                child: Text(
                  "Save",
                  style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

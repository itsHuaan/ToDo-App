import 'package:flutter/material.dart';
import 'package:todo_list/buttons.dart';

class AddNewTask extends StatelessWidget {
  final taskNameController;
  final taskDescriptionController;
  VoidCallback onSaved;
  VoidCallback onCanceled;
  AddNewTask({
    super.key,
    required this.taskNameController,
    required this.taskDescriptionController,
    required this.onSaved,
    required this.onCanceled,
  });

  @override
  Widget build(BuildContext context) {
    double popupWidth = 300.0;
    return AlertDialog(
      title: const Text("Add a new task"),
      content: Container(
        constraints: BoxConstraints(
          maxWidth: popupWidth,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Makes Column take up only as much vertical space as needed
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
                  buttonText: "Cancel",
                  buttonOnPressed: onCanceled,
                ),
                Buttons(
                  buttonText: "Save",
                  buttonOnPressed: onSaved,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

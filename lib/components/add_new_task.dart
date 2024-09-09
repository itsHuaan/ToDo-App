import 'package:flutter/material.dart';
import 'package:todo_list/components/buttons.dart';

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
      backgroundColor: Theme.of(context).colorScheme.primary,
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
                  cursorColor: Theme.of(context).colorScheme.inversePrimary,
                  controller: taskNameController,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: "Task name",
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
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
                  cursorColor: Theme.of(context).colorScheme.inversePrimary,
                  maxLines: 3,
                  controller: taskDescriptionController,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: "Task description",
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
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

import 'package:flutter/material.dart';
import 'package:todo_list/buttons.dart';

class AddNewTask extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  VoidCallback onCanceled;
  AddNewTask({
    super.key,
    required this.controller,
    required this.onSaved,
    required this.onCanceled,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "Add a new task",
                hintStyle: const TextStyle(
                  color: Color.fromARGB(128, 0, 0, 0),
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

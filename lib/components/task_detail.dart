import 'package:flutter/material.dart';
import 'package:todo_list/components/buttons.dart';
import 'package:todo_list/models/database.dart';

class TaskDetail extends StatelessWidget {
  final TaskDabase db;
  final int index;
  final VoidCallback onClosed;
  const TaskDetail({
    super.key,
    required this.db,
    required this.index,
    required this.onClosed,
  });

  @override
  Widget build(BuildContext context) {
    String taskName = db.toDoList[index][0];
    String taskDescription = db.toDoList[index][1];
    bool isCompleted = db.toDoList[index][2];
    String taskCompletion = isCompleted ? "Completed" : "Incompleted";
    String taskCreated = db.toDoList[index][3];
    return SimpleDialog(
      title: const Text(
        "Task Detail",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      contentPadding: const EdgeInsets.all(20),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Text(
                      "Task Name: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(taskName),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Text(
                      "Task Description: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(taskDescription),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Text(
                      "Task Completion: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: isCompleted ? const Color.fromARGB(255, 0, 122, 4) : const Color.fromARGB(255, 199, 179, 0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Text(
                        taskCompletion,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Text(
                      "Task Created: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(taskCreated),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Buttons(
                  buttonOnPressed: onClosed,
                  buttonText: "Close",
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

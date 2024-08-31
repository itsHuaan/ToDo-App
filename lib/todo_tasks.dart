import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  final String taskCreated;
  Function(bool?)? taskOnChanged;
  Function(BuildContext) deleteTask;
  ToDoList({
    super.key,
    required this.taskName,
    required this.isCompleted,
    required this.taskCreated,
    required this.taskOnChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(0),
              ),
            ),
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.edit,
              backgroundColor: Colors.grey,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(15),
              ),
            )
          ],
        ),
        child: Material(
          elevation: 5, // Set the elevation here
          borderRadius: BorderRadius.circular(15), // Match the border radius of the container
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: isCompleted,
                      onChanged: taskOnChanged,
                      activeColor: Colors.black,
                    ),
                  ],
                ),
                // Task name with specified color
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      taskCreated,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  final String taskCreated;
  Function(bool?)? taskOnChanged;
  Function(BuildContext) deleteTask;
  Function(BuildContext) taskDetail;
  Function(BuildContext) editTask;
  ToDoList({
    super.key,
    required this.taskName,
    required this.isCompleted,
    required this.taskCreated,
    required this.taskOnChanged,
    required this.deleteTask,
    required this.taskDetail,
    required this.editTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.5,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              label: "Detail",
              onPressed: taskDetail,
              icon: Icons.info,
              foregroundColor: Colors.white,
              backgroundColor: Colors.lightBlue,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            SlidableAction(
              label: "Edit",
              onPressed: editTask,
              icon: Icons.edit,
              foregroundColor: Colors.white,
              backgroundColor: Colors.black54,
            ),
            SlidableAction(
              label: "Delete",
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
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
                Checkbox(
                  value: isCompleted,
                  onChanged: taskOnChanged,
                  activeColor: Colors.black,
                ),
                Text(
                  taskName,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                ),
                const Spacer(),
                Text(
                  isCompleted ? "Completed" : taskCreated,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

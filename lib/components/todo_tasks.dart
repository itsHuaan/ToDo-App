import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final String taskDescription;
  final bool isCompleted;
  final String taskCreated;
  Function(bool?)? taskOnChanged;
  Function(BuildContext) deleteTask;
  // Function(BuildContext) taskDetail;
  int index;
  void Function(int) taskDetail;
  Function(BuildContext) editTask;
  ToDoList({
    super.key,
    required this.taskName,
    required this.taskDescription,
    required this.isCompleted,
    required this.taskCreated,
    required this.taskOnChanged,
    required this.deleteTask,
    required this.index,
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
              label: "Edit",
              onPressed: editTask,
              icon: Icons.edit,
              foregroundColor: Colors.white,
              backgroundColor: Colors.grey.shade600,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
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
        child: GestureDetector(
          onTap: () {
            taskDetail(index);
          },
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Checkbox(
                  value: isCompleted,
                  onChanged: taskOnChanged,
                  activeColor: Theme.of(context).colorScheme.inversePrimary,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskName,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      taskCreated,
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                // Text(
                //   isCompleted ? "Completed" : "Incompleted",
                // ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: isCompleted ? const Color.fromARGB(255, 0, 122, 4) : const Color.fromARGB(255, 199, 179, 0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    isCompleted ? "Completed" : "Incompleted",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

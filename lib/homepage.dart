import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/add_new_task.dart';
import 'package:todo_list/todo_tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Text controller
  final _controller = TextEditingController();

  // ToDo list
  List toDoList = [
    [
      "Do laundry",
      false,
      DateFormat('dd/MM/yyyy').format(DateTime.now())
    ],
    [
      "Make sandwich",
      false,
      DateFormat('dd/MM/yyyy').format(DateTime.now())
    ],
    [
      "Defeat the Ender Dragon",
      false,
      DateFormat('dd/MM/yyyy').format(DateTime.now())
    ]
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        toDoList.add([
          _controller.text,
          false,
          DateFormat('dd/MM/yyyy').format(DateTime.now())
        ]);
        _controller.text = '';
        Navigator.of(context).pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Task name is empty!"),
          duration: Duration(milliseconds: 1000),
        ));
      }
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AddNewTask(
            controller: _controller,
            onSaved: saveNewTask,
            onCanceled: () => Navigator.of(context).pop(),
          );
        });
  }

  void onDeleted(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "Confirm delete",
              style: TextStyle(color: Colors.red),
            ),
            content: const Text("Are you sure to delete this task?"),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    toDoList.removeAt(index);
                  });
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlue,
        title: const Text("ToDo List"),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskName: toDoList[index][0],
            isCompleted: toDoList[index][1],
            taskCreated: toDoList[index][2],
            taskOnChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => onDeleted(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () {},
        onPressed: createNewTask,
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}

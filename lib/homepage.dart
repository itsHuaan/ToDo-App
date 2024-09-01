import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/add_new_task.dart';
import 'package:todo_list/database.dart';
import 'package:todo_list/todo_tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Reference to the hive box
  final _myBox = Hive.box("myBox");

  // Text controller
  final _controller = TextEditingController();
  TaskDabase db = TaskDabase();
  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.initialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        db.toDoList.add([
          _controller.text,
          false,
          DateFormat('dd/MM/yyyy').format(DateTime.now())
        ]);
        _controller.text = '';
        db.updateData();
        Navigator.of(context).pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Task name is empty!"),
          duration: Duration(milliseconds: 1000),
        ));
      }
    });
  }

  void cancelAddingTask() {
    setState(() {
      Navigator.of(context).pop();
      _controller.text = '';
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AddNewTask(
            controller: _controller,
            onSaved: saveNewTask,
            onCanceled: cancelAddingTask,
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
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    db.toDoList.removeAt(index);
                  });
                  db.updateData();
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        });
  }

  void onEdited() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.notification_important,
            color: Colors.white,
          ),
          SizedBox(width: 20),
          Text("I'm working on this feature!"),
        ],
      ),
      duration: Duration(milliseconds: 2000),
    ));
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
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskName: db.toDoList[index][0],
            isCompleted: db.toDoList[index][1],
            taskCreated: db.toDoList[index][2],
            taskOnChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => onDeleted(index),
            editTask: (context) => onEdited(),
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

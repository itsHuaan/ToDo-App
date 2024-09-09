import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/components/add_new_task.dart';
import 'package:todo_list/models/database.dart';
import 'package:todo_list/components/delete_task.dart';
import 'package:todo_list/components/edit_task.dart';
import 'package:todo_list/components/task_detail.dart';
import 'package:todo_list/components/todo_tasks.dart';

class HomePage extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;
  const HomePage({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Reference to the hive box
  final _myBox = Hive.box("myBox");

  // Text controller
  final _taskNameController = TextEditingController();

  final _taskDescriptionController = TextEditingController();
  TaskDabase db = TaskDabase();
  @override
  void initState() {
    if (_myBox.get("TASKS") == null) {
      db.initialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][2] = !db.toDoList[index][2];
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(
      () {
        if (_taskNameController.text.isNotEmpty) {
          db.toDoList.add([
            _taskNameController.text,
            _taskDescriptionController.text,
            false,
            DateFormat('dd/MM/yyyy').format(DateTime.now())
          ]);
          _taskNameController.clear();
          _taskDescriptionController.clear();
          db.updateData();
          Navigator.of(context).pop();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Task name is empty!"),
            duration: Duration(milliseconds: 1000),
          ));
        }
      },
    );
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AddNewTask(
          taskNameController: _taskNameController,
          taskDescriptionController: _taskDescriptionController,
          onSaved: saveNewTask,
          onCanceled: () {
            setState(() {
              Navigator.of(context).pop();
              _taskNameController.clear();
              _taskDescriptionController.clear();
            });
          },
        );
      },
    );
  }

  void deleteTask(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteTask(
          index: index,
          onSaved: onDeleted,
          onCanceled: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void onDeleted(int index) {
    setState(
      () {
        db.toDoList.removeAt(index);
      },
    );
    db.updateData();
    Navigator.of(context).pop();
  }

  void editTask(int index) {
    _taskNameController.text = db.toDoList[index][0];
    _taskDescriptionController.text = db.toDoList[index][1];
    showDialog(
      context: context,
      builder: (context) {
        return EditTask(
          taskNameController: _taskNameController,
          taskDescriptionController: _taskDescriptionController,
          index: index,
          onSaved: onEdited,
          onCanceled: () {
            Navigator.of(context).pop();
            _taskNameController.clear();
            _taskDescriptionController.clear();
          },
        );
      },
    );
  }

  void onEdited(int index) {
    setState(
      () {
        if (_taskNameController.text.isNotEmpty) {
          db.toDoList[index][0] = _taskNameController.text;
          db.toDoList[index][1] = _taskDescriptionController.text;
          _taskNameController.clear();
          _taskDescriptionController.clear();
          db.updateData();
          Navigator.of(context).pop();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Task name is empty!"),
            duration: Duration(milliseconds: 1000),
          ));
        }
      },
    );
  }

  void taskDetail(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return TaskDetail(
          db: db,
          index: index,
          onClosed: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = false;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: widget.toggleTheme,
            icon: Icon(widget.isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded),
          ),
        ],
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("ToDo"),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskName: db.toDoList[index][0],
            taskDescription: db.toDoList[index][0],
            isCompleted: db.toDoList[index][2],
            taskCreated: db.toDoList[index][3],
            taskOnChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deleteTask(index),
            index: index,
            taskDetail: (context) => taskDetail(index),
            editTask: (context) => editTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}

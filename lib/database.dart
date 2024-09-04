import 'package:hive_flutter/hive_flutter.dart';

class TaskDabase {
  List toDoList = [];
  final _myBox = Hive.box("myBox");

  void initialData() {
    toDoList = [];
  }

  void loadData() {
    toDoList = _myBox.get("TASKS");
  }

  void updateData() {
    _myBox.put("TASKS", toDoList);
  }
}

import 'package:hive_flutter/hive_flutter.dart';

class TaskDabase {
  List toDoList = [];
  final _myBox = Hive.box("myBox");

  void initialData() {
    toDoList = [];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}

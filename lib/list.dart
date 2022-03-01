import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/modules/task.dart';

class Data extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'BuyMilk'),
    Task(name: 'egg'),
    Task(name: 'Bread'),
  ];

  int get taskCount => _tasks.length;

  void addNewItem(newTaskTitle) {
    _tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  dynamic getItem(index) {
    return _tasks[index];
  }

  void checkBoxtoggler(index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void removeTask(index) {
    _tasks.removeAt(index);
    notifyListeners();
   
  }
}

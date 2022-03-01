import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String tasktitle;
  final Function(bool?)? checkBoxCallback;

  TaskTile(
      {required this.isChecked,
      required this.tasktitle,
      this.checkBoxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        tasktitle,
        style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkBoxCallback,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo/list.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(builder: (context, Data, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: () {
              SnackBar snackBar = SnackBar(
                backgroundColor: Colors.lightBlueAccent,
                content: Text(
                  Data.getItem(index).name + ' Removed',
                  style: const TextStyle(color: Colors.white),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Data.removeTask(index);
            },
            child: TaskTile(
              isChecked: Data.getItem(index).isDone,
              tasktitle: Data.getItem(index).name.toString(),
              checkBoxCallback: (newValue) {
                Data.checkBoxtoggler(index);
              },
            ),
          );
        },
        itemCount: Data.taskCount,
      );
    });
  }
}

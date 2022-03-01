import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/list.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AddTaskScreen extends StatefulWidget {
  Function? addTaskCallBack;
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String? newTaskTitle;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextField(
                  controller: textController,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (newText) {
                    newTaskTitle = newText;
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextButton(
                  onPressed: () {
                    if (newTaskTitle == null) {
                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "Opps",
                        desc: "Please Fill the TextField",
                        buttons: [
                          DialogButton(
                            child: const Text(
                              "Okay",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            color: const Color.fromRGBO(0, 179, 134, 1.0),
                            radius: BorderRadius.circular(0.0),
                          ),
                        ],
                      ).show();
                    } else {
                      Provider.of<Data>(context, listen: false)
                          .addNewItem(newTaskTitle);
                      Navigator.pop(context);
                      textController.clear();
                    }
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlueAccent),
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

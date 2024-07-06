import 'package:crud/crud_object.dart';
import 'package:crud/task_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TaskDialogScreen extends StatefulWidget {
  final id;
  const TaskDialogScreen(
    this.id, {
    super.key,
  });

  @override
  State<TaskDialogScreen> createState() => _TaskDialogScreenState();
}

class _TaskDialogScreenState extends State<TaskDialogScreen> {
  var taskController = TextEditingController();

  var ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: taskController,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                hintText: "Enter your task",
                hintStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  borderSide: BorderSide(width: 3, color: Colors.black),
                ),
              ),
            ),
          ),
          Checkbox(
            value: ischecked,
            onChanged: (value) {
              if (ischecked == false) {
                ischecked = true;
              } else {
                ischecked = false;
              }
              setState(() {});
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              style: TextButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                if (taskController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Enter the task");
                } else {
                  var object = TaskObject(
                      isCompleted: ischecked,
                      task: taskController.text.toString(),
                      taskId: widget.id);
                  Navigator.of(context).pop(object);
                }
              },
              child: const Text(
                "Save",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

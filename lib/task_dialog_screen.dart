import 'package:flutter/material.dart';

class TaskDialogScreen extends StatefulWidget {
  const TaskDialogScreen({super.key});

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
                hintText: "Enter your name",
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
              onPressed: () {},
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

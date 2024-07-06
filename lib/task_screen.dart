import 'package:crud/crud_object.dart';
import 'package:crud/task_dialog_screen.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  final CrudObject crudObject;
  const TaskScreen(this.crudObject, {super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Task Screen"),
      ),
      body: Column(
        children: [
          const Text(
            "Name",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          Text(
            widget.crudObject.name ?? "",
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          const Text(
            "Roll No.",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          Text(
            widget.crudObject.rollNo.toString(),
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          const Text(
            "Phone No.",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          Text(
            widget.crudObject.phoneNo ?? "",
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    const Text(
                      "Task",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Checkbox(value: false, onChanged: (value) {})
                  ],
                );
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const TaskDialogScreen(),
          ).then((value) {});
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}

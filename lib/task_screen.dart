import 'package:crud/crud_object.dart';
import 'package:crud/db_provider.dart';
import 'package:crud/task_dialog_screen.dart';
import 'package:crud/task_object.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  final CrudObject crudObject;
  const TaskScreen(this.crudObject, {super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  var list = <TaskObject>[];
  var dbProvider = DbProvider();
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
              itemCount: list.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var item = list[index];
                return Row(
                  children: [
                    Text(
                      item.task ?? "",
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Checkbox(value: item.isCompleted, onChanged: (value) {})
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
            builder: (context) => TaskDialogScreen(widget.crudObject.id),
          ).then((value) {
            var object = value as TaskObject;
            dbProvider.insertTaskDb(object);
            setState(() {});
          });
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

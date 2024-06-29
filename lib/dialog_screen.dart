import 'package:crud/crud_object.dart';
import 'package:crud/data_object.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogScreen extends StatefulWidget {
  final String name;
  final String rollNo;
  final String phoneNo;
  const DialogScreen(this.name, this.rollNo, this.phoneNo, {super.key});

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  var task = "Save";
  var nameController = TextEditingController();
  var rollNoController = TextEditingController();
  var phoneNoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.name.isNotEmpty) {
      nameController.text = widget.name;
    }
    if (widget.rollNo.isNotEmpty) {
      rollNoController.text = widget.rollNo;
    }
    if (widget.phoneNo.isNotEmpty) {
      phoneNoController.text = widget.phoneNo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              decoration: InputDecoration(
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
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: rollNoController,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: "Enter your Roll no.",
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
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              maxLength: 10,
              controller: phoneNoController,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: "Enter your Phone no.",
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
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              onPressed: () {
                if (nameController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Enter the Name");
                } else if (rollNoController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Enter the Roll no.");
                } else if (phoneNoController.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Enter the Phone no.");
                } else if (phoneNoController.text.length < 10) {
                  Fluttertoast.showToast(msg: "Enter the valid Phone no.");
                } else {
                  var object = DataObject(
                    nameController.text.toString(),
                    int.parse(rollNoController.text.toString()),
                    phoneNoController.text.toString(),
                  );
                  Navigator.of(context).pop(object);
                  setState(() {});
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  task,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

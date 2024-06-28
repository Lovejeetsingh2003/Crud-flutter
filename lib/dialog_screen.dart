import 'package:crud/crud_object.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogScreen extends StatefulWidget {
  final String name;
  const DialogScreen(this.name, {super.key});

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  var task = "Save";
  var nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    // if (isupdate == true) {
    //   nameController = TextEditingController(text: widget.name);
    // } else {
    //   nameController = TextEditingController(text: "Enter your name");
    // }
    // nameController = TextEditingController(text: "Enter your name");
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
                  color: Colors.black,
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
                } else {
                  Navigator.of(context).pop(nameController.text.toString());
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

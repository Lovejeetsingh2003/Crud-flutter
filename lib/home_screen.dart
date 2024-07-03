import 'package:crud/crud_object.dart';
import 'package:crud/data_object.dart';
import 'package:crud/db_provider.dart';
import 'package:crud/dialog_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var list = <CrudObject>[];
  var object = <DataObject>[];
  var dbProvider = DbProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Crud",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(5),
            itemCount: list.length,
            itemBuilder: (context, index) {
              var values = list[index];
              return Container(
                color: Colors.pink.shade100,
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            values.name ?? "",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            values.rollNo.toString(),
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            values.phoneNo ?? "",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => DialogScreen(
                                      values.name ?? "",
                                      values.rollNo.toString(),
                                      values.phoneNo ?? "")).then((value) {
                                var object = value as DataObject;
                                list[index] = (CrudObject(
                                    name: object.name,
                                    rollNo: object.rollNo,
                                    phoneNo: object.phoneNo));
                                setState(() {});
                              });
                            },
                            child: const Icon(
                              Icons.edit,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            list.remove(values);
                            setState(() {});
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.delete,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const DialogScreen("", "", ""),
          ).then((value) {
            var object = value as DataObject;
            var name = object.name;
            var roll_no = object.rollNo;
            var phone_no = object.phoneNo;
            CrudObject crudObject =
                CrudObject(name: name, phoneNo: phone_no, rollNo: roll_no);
            dbProvider.insertDb(crudObject);
            list.add(
                CrudObject(name: name, rollNo: roll_no, phoneNo: phone_no));
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

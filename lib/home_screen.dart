import 'package:crud/crud_object.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Crud",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(5),
            itemCount: list.length,
            itemBuilder: (context, index) {
              var values = list[index];
              return Container(
                color: Colors.pink.shade100,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            values.name ?? "",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              // showDialog(
                              //         barrierDismissible: false,
                              //         context: context,
                              //         builder: (context) =>
                              //             DialogScreen(values.name ?? ""))
                              //     .then((value) {
                              //   var name = value;
                              //   list.add(CrudObject(name: name));
                              //   setState(() {});
                              // });
                            },
                            child: Icon(
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
                          child: Padding(
                            padding: const EdgeInsets.all(10),
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
            builder: (context) => DialogScreen(""),
          ).then((value) {
            var name = value;
            list.add(CrudObject(name: name));
            setState(() {});
          });
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}

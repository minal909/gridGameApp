import 'dart:math';
import 'dart:ui';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateGrid extends StatefulWidget {
  @override
  _CreateGridState createState() => _CreateGridState();
}

class _CreateGridState extends State<CreateGrid> {
  TextEditingController row = TextEditingController();
  TextEditingController column = TextEditingController();
  TextEditingController alphabets = TextEditingController();

  int rowC = 2;
  int colC = 2;

  @override
  Widget build(BuildContext context) {
    String alpha = alphabets.text;
    List<String> result = alpha.split(',');

    Widget popUpMenuWidget() {
      return PopupMenuButton(
          child: Text("Let\'\s Play",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          itemBuilder: (context) => [
                PopupMenuItem(
                    child: Column(children: [
                  Text("Enter Alphabets:"),
                  TextField(
                    controller: alphabets,
                    maxLength: rowC * colC,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Add Alphabets")),
                ]))
              ]);
    }

    Widget GridBuilder() {
      return Container(
          child: GridView.builder(
              itemCount: colC * rowC,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: rowC,
                childAspectRatio: 1,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Text(
                      '${result[0]}',
                      style: TextStyle(
                          // backgroundColor: Colors.black,
                          color: Color.fromARGB(255, 224, 217, 217),
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ));
              }));
    }

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                height: 700,
                width: 700,
                padding: EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Row"),
                      TextField(
                        controller: row,
                      ),
                      Text("Column"),
                      TextField(
                        controller: column,
                      ),
                      Row(children: [
                        TextButton(
                            onPressed: () {
                              rowC = int.parse(row.text);
                              colC = int.parse(column.text);
                              setState(() {});
                            },
                            child: Container(
                              color: Colors.white,
                              child: Text(
                                "Create Grid",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )),
                        SizedBox(
                          width: 150,
                        ),
                        popUpMenuWidget(),
                      ]),
                      GridBuilder(),
                    ])),
          ])),
        ));
  }
}

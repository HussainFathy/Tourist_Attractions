import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  List img = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAnXMG9DrKYnGB5gXJFq2GMo7Pr96LBEZFBA&usqp=CAU", //piza
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsT-aoFiU-ZVYivDRxzhLRYqbMx56s2IYNPQ&usqp=CAU", //giza
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgfC26-lRgD9xS-Z9pNw-SzAvxyxrf1TFylg&usqp=CAU", //Sphinx
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTcJRnN5ZDKfikP5pbloSyymGLDftC9dTcIw&usqp=CAU", //eiffel tower
  ];

  List<String> tex = [
    "Leaning Tower of Pisa",
    "Giza Pyramids",
    "The Sphinx",
    "Eiffel tower"
  ];

  List<Text> txt = [
    Text("Leaning Tower of Pisa"),
    Text("Giza Pyramids"),
    Text("The Sphinx"),
    Text("Eiffel tower")
  ];

  int x = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tourist Attractions"),
          backgroundColor: Colors.red,
        ),
        drawer: Drawer(
            child: ListView(
          children: [
            const DrawerHeader(child: Text("header")),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 3'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        )),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Center(
                  child: Container(
                    height: 450,
                    width: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.network(
                        img[x],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  margin: EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "${tex[x]}",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1, // 40% of space
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1, // 60% of space => (6/(6 + 4))
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                x == 0 ? x = 3 : x--;
                              });
                            },
                            child: Text('Back'),
                          )),
                      Spacer(),
                      Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                x = (x + 1) % 4;
                              });
                            },
                            child: Text('Next'),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

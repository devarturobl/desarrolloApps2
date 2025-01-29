import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("UI 101 Courses"),
              actions: [
                IconButton(
                  icon: Icon(Icons.filter_1),
                  onPressed: () {},
                ),
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //titulo
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 20, bottom: 20),
                  child: Text(
                    "01 About The Courses",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ),
                //Texto
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 20),
                  child: Text(
                    "The courses tell you about the UI design how work",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                //cuadro verde

                //cuadro Gris
              ],
            )));
  }
}

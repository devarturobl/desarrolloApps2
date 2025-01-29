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
                Cuadros(
                  title: "What in the Ui\ndesign why its work",
                  number: "01",
                  color: Colors.green,
                ),
                Cuadros(
                  title: "How UI work for\nUsers",
                  number: "02",
                  color: Colors.grey,
                )
                //cuadro Gris
              ],
            )));
  }
}

class Cuadros extends StatelessWidget {
  final String title;
  final String number;
  final Color color;
  const Cuadros(
      {super.key,
      required this.title,
      required this.number,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 20),
      child: Container(
        //width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 68, 0),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    number,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("1. About UI desing",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      Text("2. Why It´s Work",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      Text("3. Why we tech UI",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "20 Min",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

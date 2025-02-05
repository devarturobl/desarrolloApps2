import 'package:flutter/material.dart';

class Mycontainer extends StatefulWidget {
  const Mycontainer({super.key});

  @override
  State<Mycontainer> createState() => _MycontainerState();
}

class _MycontainerState extends State<Mycontainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Titulo del APP"),
            Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.red,
                        width: 5.0,
                      )),
                  child: Center(
                    child: Text(
                      "Hola",
                      style: TextStyle(color: Colors.white, fontSize: 40.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 350,
              width: 350,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 100,
                    color: Colors.red,
                    //padding: EdgeInsets.all(10),
                    child: Text(
                      "Hola Rojo 1.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.blue,
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

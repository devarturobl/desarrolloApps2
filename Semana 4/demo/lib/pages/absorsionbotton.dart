import 'package:flutter/material.dart';

class MyAbsobBotton extends StatefulWidget {
  const MyAbsobBotton({super.key});

  @override
  State<MyAbsobBotton> createState() => _MyAbsobBottonState();
}

class _MyAbsobBottonState extends State<MyAbsobBotton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            width: 200,
            height: 100,
            child: AbsorbPointer(
                child: ElevatedButton(onPressed: () {}, child: null)),
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  alignment:
                      Alignment.centerLeft, // Centra el contenido del botón
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.red,
                )),
          ),
        ],
      ),
    );
  }
}

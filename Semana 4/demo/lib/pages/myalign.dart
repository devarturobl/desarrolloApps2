import 'package:flutter/material.dart';

class Myaling extends StatefulWidget {
  const Myaling({super.key});

  @override
  State<Myaling> createState() => _MyalingState();
}

class _MyalingState extends State<Myaling> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      color: Colors.blueGrey,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Hello World',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyAlignAnimate extends StatefulWidget {
  const MyAlignAnimate({super.key});

  @override
  State<MyAlignAnimate> createState() => _MyAlignAnimateState();
}

class _MyAlignAnimateState extends State<MyAlignAnimate> {
  bool mover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Expanded(
        child: Container(
          height: 300,
          color: Colors.black87,
          child: GestureDetector(
            onTap: () {
              setState(() {
                mover = !mover;
              });
            },
            child: AnimatedAlign(
              alignment: mover ? Alignment.topRight : Alignment.bottomLeft,
              duration: const Duration(seconds: 1),
              child: Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

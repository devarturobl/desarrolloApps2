import 'package:flutter/material.dart';

class Myexpanded extends StatefulWidget {
  const Myexpanded({super.key});

  @override
  State<Myexpanded> createState() => _MyexpandedState();
}

class _MyexpandedState extends State<Myexpanded> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          //flex: 1,
          child: Container(
            color: Colors.amber,
          ),
        ),
        Expanded(
          //flex: 2,
          child: Container(
            color: Colors.blue,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: const Color.fromARGB(255, 33, 243, 61),
          ),
        )
      ],
    );
  }
}

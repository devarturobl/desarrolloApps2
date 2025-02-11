import 'package:flutter/material.dart';

class Mylist extends StatefulWidget {
  const Mylist({super.key});

  @override
  State<Mylist> createState() => _MylistState();
}

class _MylistState extends State<Mylist> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Expanded(
            child: Container(
              height: 200,
              color: Colors.amber,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Expanded(
            child: Container(
              height: 200,
              color: Colors.red,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Expanded(
            child: Container(
              height: 200,
              color: Colors.blue,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Expanded(
            child: Container(
              height: 200,
              color: Colors.pink,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Expanded(
            child: Container(
              height: 200,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}

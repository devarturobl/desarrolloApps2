import 'package:flutter/material.dart';

class Mycolumn extends StatefulWidget {
  const Mycolumn({super.key});

  @override
  State<Mycolumn> createState() => _MycolumnState();
}

class _MycolumnState extends State<Mycolumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.amber,
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.blue,
        ),
      ],
    );
  }
}

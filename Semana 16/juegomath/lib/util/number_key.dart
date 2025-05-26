import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:juegomath/const.dart';

class MyButton extends StatelessWidget {
  final String child;
  final VoidCallback onTap;

  MyButton({Key? key, required this.child, required this.onTap})
      : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    Color? buttonColor = Colors.deepPurple[400];
    if (child == 'C') {
      buttonColor = Colors.green;
    } else if (child == 'Del') {
      buttonColor = Colors.red;
    } else if (child == '=') {
      buttonColor = Colors.deepPurple;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(child, style: whiteTextStyle),
          ),
        ),
      ),
    );
  }
}

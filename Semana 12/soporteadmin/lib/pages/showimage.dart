import 'package:flutter/material.dart';

class ShowImage extends StatefulWidget {
  final String text;

  const ShowImage({super.key, required this.text});

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imagen Adjunta'),
      ),
      body: Center(
        child: Container(
          child: Image.network(widget.text),
        ),
      ),
    );
  }
}

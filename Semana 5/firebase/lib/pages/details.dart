import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final Color color; // Parámetro para el color de fondo
  final String mitexto;

  const DetailsPage({super.key, required this.color, required this.mitexto});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color, // Usa el color proporcionado
      appBar: AppBar(
        title: Text(widget.mitexto),
      ),
      body: Center(
        child: Text(
          widget.mitexto,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}

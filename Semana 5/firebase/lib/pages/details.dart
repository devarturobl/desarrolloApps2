import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final Color color; // Parámetro para el color de fondo

  const DetailsPage({super.key, required this.color});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color, // Usa el color proporcionado
      appBar: AppBar(
        title: const Text("Details Page"),
      ),
      body: const Center(
        child: Text(
          "Richard",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}

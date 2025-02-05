import 'package:flutter/material.dart';

class Mycard extends StatelessWidget {
  const Mycard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "My card",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          TheCard()
        ],
      ),
    );
  }
}

class TheCard extends StatelessWidget {
  const TheCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 250,
        width: 500,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/back.jpg'), // Imagen local
              fit: BoxFit.cover, // Ajusta la imagen al tamaño del container
            ),
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

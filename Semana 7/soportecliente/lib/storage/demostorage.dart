import 'package:flutter/material.dart';
import 'dart:io';

class Demostorage extends StatefulWidget {
  const Demostorage({super.key});

  @override
  State<Demostorage> createState() => _DemostorageState();
}

class _DemostorageState extends State<Demostorage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Almacenamiento de datos"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Almacenamiento de datos"),
      ),
    );
  }
}
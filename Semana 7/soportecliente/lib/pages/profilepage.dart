import 'package:flutter/material.dart';
import 'package:soportecliente/auth/auth_gate.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return AuthGate();
  }
}
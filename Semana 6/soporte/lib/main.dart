import 'package:flutter/material.dart';
import 'package:soporte/pages/login_page.dart';

void main() {
  runApp(const ServicesT());
}

class ServicesT extends StatelessWidget {
  const ServicesT({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoginPage(),
    );
  }
}

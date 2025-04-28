import 'package:flutter/material.dart';
import 'package:soporte/auth/auth_gate.dart';

//Paquetes de Supabase
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://ofmidkxhnrwmyakxgwvy.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9mbWlka3hobnJ3bXlha3hnd3Z5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU4NjYwMDIsImV4cCI6MjA2MTQ0MjAwMn0.X3-n_L-gh20x2F-STrfzDqu2hGkX54xmcfESCLxvMko',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 10, 8, 128)),
        useMaterial3: true,
      ),
      home: AuthGate(),
    );
  }
}

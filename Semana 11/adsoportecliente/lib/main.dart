import 'package:flutter/material.dart';
import 'package:soportecliente/auth/auth_gate.dart';
//import 'package:soportecliente/storage/demostorage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() async {
  Supabase.initialize(
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJuZmd0bmZ1eWNxb3ZwemphdHlkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE2MjAzMjUsImV4cCI6MjA1NzE5NjMyNX0.ehyrrrHEmUtn5Zn2j4FBw7ee16Dt7fpT5TAMH-7lmpo",
    url: "https://bnfgtnfuycqovpzjatyd.supabase.co",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.material(
      title: 'Soporte Cliente',
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
        darkTheme: ShadThemeData(
          brightness: Brightness.dark,
          colorScheme: const ShadSlateColorScheme.dark(),
        )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:soportecliente/auth/auth_service.dart';
import 'package:soportecliente/pages/loginpage.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  final authService = AuthService();
  void logout() async {
    try {
      await authService.singOut();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Loginpage()));
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error:$e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hola: ${authService.getCurrentUserEmail() ?? 'No user'}"),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: logout,
              child: Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}

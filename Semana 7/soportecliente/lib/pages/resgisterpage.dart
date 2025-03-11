import 'package:flutter/material.dart';
import 'package:soportecliente/auth/auth_service.dart';
import 'package:soportecliente/pages/loginpage.dart';

class Resgisterpage extends StatefulWidget {
  const Resgisterpage({super.key});

  @override
  State<Resgisterpage> createState() => _ResgisterpageState();
}

class _ResgisterpageState extends State<Resgisterpage> {
  // get auth service
  final authService = AuthService();
  // textcontroller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  //sing up function
  void singUp() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Password and Confirm Password must be same")));
      return;
    }

    try {
      await authService.singUpWithEmailAndPassword(email, password);
      Navigator.pop(context);
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
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: "Password"),
          ),
          TextField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(labelText: "Confirm Password"),
          ),
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
            onPressed: singUp,
            child: Text("Sing Up"),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Loginpage()));
              },
              child: Center(child: Text("¿Ya tienes cuenta?, Sing In"))),
        ],
      ),
    );
  }
}

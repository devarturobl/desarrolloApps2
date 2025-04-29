import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:soportecliente/auth/auth_service.dart';
import 'package:soportecliente/pages/profilepage.dart';
import 'package:soportecliente/pages/resgisterpage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final authService = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      await authService.singInWithEmailAndPassword(email, password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Profilepage()));
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }
  final formKey = GlobalKey<ShadFormState>();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[100],
      body: Center(
        child: ShadForm(
          key: formKey,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Bienvenido",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Inicia sesión para continuar",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 30),
                ShadInputFormField(
                  id: 'username',
                  controller: _emailController,
                  label: const Text('Correo  Electrónico'),
                  placeholder: const Text('Enter your username'),
                  validator: (v) {
                    if (v.length < 2) {
                      return 'Username must be at least 2 characters.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height:10),
                ShadInputFormField(
                  id: 'pass',
                  controller: _passwordController,
                  obscureText: _obscureText,
                  label: const Text('Contraseña'),
                  placeholder: const Text('Enter your password'),
                  trailing: GestureDetector(onTap: (){
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                  },
                      child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,)),
                  validator: (v) {
                    if (v.length < 2) {
                      return 'Username must be at least 2 characters.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ShadButton(
                  child: const Text('Iniciar sesión'),
                  onPressed: () {
                    if (formKey.currentState!.saveAndValidate()) {
                      print(
                          'validation succeeded with ${formKey.currentState!.value}');
                      login();
                    } else {
                      print('validation failed');
                    }
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Resgisterpage()));
                  },
                  child: const Text(
                    "¿No tienes cuenta? Regístrate",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

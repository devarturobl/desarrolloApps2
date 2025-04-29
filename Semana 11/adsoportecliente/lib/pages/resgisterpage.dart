import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:soportecliente/auth/auth_service.dart';
import 'package:soportecliente/pages/loginpage.dart';

class Resgisterpage extends StatefulWidget {
  const Resgisterpage({super.key});

  @override
  State<Resgisterpage> createState() => _ResgisterpageState();
}

class _ResgisterpageState extends State<Resgisterpage> {
  final authService = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _showPassword = true;
  bool _showConfirmPassword = true;
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();

  void singUp() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
    final name = _nameController.text;
    final lastName = _lastNameController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Las contraseñas no coinciden")),
      );
      return;
    }

    try {
      await authService.singUpWithEmailAndPassword(name,lastName, email, password);
      Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[100],
      body: Center(
        child: ShadCard(
          width: 400,
          title: const Text("Crea tu cuenta"),
          description: const Text(
            "Regístrate para acceder",
            style: TextStyle(fontSize: 16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ShadInputFormField(
                  id: 'username',
                  controller: _nameController,
                  label: const Text('Nombre'),
                  placeholder: const Text('Enter your username'),
                  description: const Text('This is your public display name.'),
                  validator: (v) {
                    if (v.length < 2) {
                      return 'Username must be at least 2 characters.';
                    }
                    return null;
                  },
                ),
                ShadInputFormField(
                  id: 'lastname',
                  controller: _lastNameController,
                  label: const Text('Lastname'),
                  placeholder: const Text('Enter your lastname'),

                  validator: (v) {
                    if (v.length < 2) {
                      return 'Username must be at least 2 characters.';
                    }
                    return null;
                  },
                ),
                ShadInputFormField(
                  id: 'email',
                  controller: _emailController,
                  label: const Text('email'),
                  placeholder: const Text('Enter your email'),

                  validator: (v) {
                    if (v.length < 2) {
                      return 'Username must be at least 2 characters.';
                    }
                    return null;
                  },
                ),
                ShadInputFormField(
                  id: 'password',
                  obscureText: _showPassword,
                  controller: _passwordController,
                  label: const Text('Password'),
                  placeholder: const Text('Enter your password'),
                  trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      child: Icon(_showPassword
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  validator: (v) {
                    if (v.length < 2) {
                      return 'Username must be at least 2 characters.';
                    }
                    return null;
                  },
                ),
                ShadInputFormField(
                  id: 'confirm_password',
                  obscureText: _showConfirmPassword,
                  controller: _confirmPasswordController,
                  label: const Text('Confirm Password'),
                  placeholder: const Text('Enter your confirm password'),
                  trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                          _showConfirmPassword = !_showConfirmPassword;
                        });
                      },
                      child: Icon(_showConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  validator: (v) {
                    if (v.length < 2) {
                      return 'Username must be at least 2 characters.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ShadButton(
                  child: const Text("Registrarse"),
                  onPressed: ()=> singUp(),
                ),
                const SizedBox(height: 20),
                TextButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Loginpage()));
                  },
                  child: const Text(
                  "¿Ya tienes cuenta? Inicia Sesión",
                    style: TextStyle(
                      color: Colors.blue,
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

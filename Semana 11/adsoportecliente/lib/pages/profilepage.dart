import 'package:flutter/material.dart';
import 'package:soportecliente/auth/auth_service.dart';
import 'package:soportecliente/pages/creates.dart';
import 'package:soportecliente/pages/historytickets.dart';
import 'package:soportecliente/pages/inprocess.dart';
import 'package:soportecliente/pages/loginpage.dart';
import 'package:soportecliente/pages/under_review.dart';
import 'package:soportecliente/service/supabase_service.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  final authService = AuthService();
  final ticketService = TicketService();

  void logout() async {
    try {
      await authService.singOut();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Loginpage()));
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userEmail =
        authService.getCurrentUserEmail() ?? 'Usuario desconocido';

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 1, 19, 33),
          title: const Text("Dashboard Administrador Soporte Tecnico",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 1, 19, 33)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Administrador',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage('assets/profile_placeholder.png'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      userEmail,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.new_label),
                title: const Text('Creados'),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Creates())),
              ),
              ListTile(
                leading: const Icon(Icons.reviews),
                title: const Text('En Revisión'),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UnderReview())),
              ),
              ListTile(
                leading: const Icon(Icons.work),
                title: const Text('En Proceso'),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const InProcess())),
              ),
              ListTile(
                leading: const Icon(Icons.safety_check_sharp),
                title: const Text('Resuelto'),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HistoryTickets())),
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Cerrar Sesion'),
                onTap: () {
                  authService.singOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Loginpage()));
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Text("Bienvenido"),
        ));
  }
}

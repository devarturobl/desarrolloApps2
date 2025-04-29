import 'package:flutter/material.dart';
import 'package:soportecliente/auth/auth_service.dart';
import 'package:soportecliente/model/ticket.dart';
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
  bool isExtended = true;
  int selectedIndex = 0;

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

  Widget _buildHeader(String userEmail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        CircleAvatar(
          radius: 20,
          child: Text(userEmail[0].toUpperCase()),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
  Widget _buildBadgeIcon({
    required IconData icon,
    required Stream<List<Ticket>> stream,
  }) {
    return Stack(
      children: [
        Icon(icon),
        StreamBuilder<List<Ticket>>(
          stream: stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const SizedBox();
            final count = snapshot.data!.length;
            if (count == 0) return const SizedBox();
            return Positioned(
              right: 0,
              top: 0,
              child: Badge.count(
                count: count,
                child: SizedBox(width: 0, height: 0),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildNavigationContent() {
    final List<NavigationRailDestination> destinations = [
      const NavigationRailDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home_filled),
        label: Text('Home'),
      ),
      NavigationRailDestination(
        icon: _buildBadgeIcon(
          icon: Icons.new_label_outlined,
          stream: ticketService.createsTickets(),
        ),
        selectedIcon: const Icon(Icons.new_label),
        label: Text('Creados'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.remove_red_eye_outlined),
        selectedIcon: Icon(Icons.remove_red_eye),
        label: Text('En revision'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.work_outline),
        selectedIcon: Icon(Icons.work),
        label: Text('En Proceso'),
      ),

      const NavigationRailDestination(
        icon: Icon(Icons.check_circle_outline),
        selectedIcon: Icon(Icons.check_circle),
        label: Text('Resuelto'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.logout),
        label: Text('Cerrar Sesión'),
      ),
    ];

    return NavigationRail(
      extended: isExtended,
      backgroundColor: const Color.fromARGB(255, 1, 19, 33),
      selectedIndex: selectedIndex,
      onDestinationSelected: (int index) {
        setState(() {
          selectedIndex = index;
        });
        switch (index) {
          case 0:
            setState(() {
              selectedIndex = 0;
            });
            break;
          case 1:
            setState(() {
              selectedIndex = 1;
            });
            break;
          case 2:
            setState(() {
              selectedIndex = 2;
            });
            break;
          case 3:
            setState(() {
              selectedIndex = 3;
            });
            break;
          case 4:
            setState(() {
              selectedIndex = 4;
            });
            break;
          case 5:
            logout();
            break;
        }
      },
      labelType: isExtended
          ? NavigationRailLabelType.none
          : NavigationRailLabelType.none,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildHeader(
            authService.getCurrentUserEmail() ?? 'Usuario desconocido'),
      ),
      destinations: destinations,
    );
  }

  Widget _buildContent() {
    switch (selectedIndex) {
      case 0:
        return const Center(child: Text("Bienvenido"));
      case 1:
        return const Creates();
      case 2:
        return const UnderReview();
      case 3:
        return const InProcess();
      case 4:
        return const HistoryTickets();
      default:
        return const Center(child: Text("Bienvenido"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 19, 33),
        title: const Text("Dashboard Administrador Soporte Tecnico",
            style: TextStyle(fontWeight: FontWeight.bold)),
        leading: Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: IconButton(
            icon: Icon(isExtended ? Icons.menu_open : Icons.menu, size: 30),
            onPressed: () {
              setState(() {
                isExtended = !isExtended;
              });
            },
          ),
        ),
      ),
      body: Row(
        children: [
          _buildNavigationContent(),
          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }
}

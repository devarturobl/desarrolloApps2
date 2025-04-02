import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soportecliente/auth/auth_service.dart';
import 'package:soportecliente/model/ticket.dart';
import 'package:soportecliente/pages/add_ticket.dart';
import 'package:soportecliente/pages/historytickets.dart';
import 'package:soportecliente/pages/loginpage.dart';
import 'package:soportecliente/pages/showimage.dart';
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
        title: const Text("Dashboard",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 1, 19, 33)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Soporte Tecnico',
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
              leading: const Icon(Icons.add),
              title: const Text('Levantar ticket'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddTicket())),
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Historico de tickets'),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Loginpage()));
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder<List<Ticket>>(
        stream: ticketService
            .getUserTickets(userEmail), // Pasa el userEmail al stream
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final tickets = snapshot.data!;
          if (tickets.isEmpty) {
            return const Center(child: Text('No tienes tickets registrados.'));
          }

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                String formattedDate = ticket.createdAt != null
                    ? DateFormat('kk:mm - dd-MM-yyyy').format(ticket.createdAt!)
                    : 'Fecha no disponible';
                if (ticket.stateticket != 'Resuelto') {
                  return GestureDetector(
                    onLongPress: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: Text("¿Deseas Finalizar Ticket?"),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      String formattedDate2 =
                                          DateTime.now().toIso8601String();
                                      ticketService.updateTicketClose(
                                          ticket, formattedDate2);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Profilepage()));
                                    },
                                    child: Text("Si"),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("No")),
                                ],
                              ));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: _getColorForState(ticket.stateticket.toString()),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black54),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(ticket.details.toString()),
                                  const SizedBox(height: 5),
                                  if (Uri.tryParse(
                                              ticket.multimedia.toString()) !=
                                          null &&
                                      Uri.tryParse(
                                              ticket.multimedia.toString())!
                                          .isAbsolute) ...[
                                    GestureDetector(
                                      onTap: () async {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ShowImage(
                                                    text: ticket.multimedia
                                                        .toString())));
                                      },
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.attach_file,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'Ver adjunto',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ],
                              )),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              width: 210,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black54),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Enviado: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(formattedDate),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Estado: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        ticket.stateticket.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          );
        },
      ),
    );
  }

  Color _getColorForState(String state) {
    switch (state) {
      case 'Creado':
        return Colors.blue;
      case 'En Revisión':
        return Colors.yellow;
      case 'En Proceso':
        return Color.fromARGB(191, 239, 108, 0);
      case 'Asignado':
        return Color(0xFF43A047);
      case 'Resuelto':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}

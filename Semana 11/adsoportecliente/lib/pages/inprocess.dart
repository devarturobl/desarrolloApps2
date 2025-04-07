import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soportecliente/auth/auth_service.dart';
import 'package:soportecliente/model/ticket.dart';
import 'package:soportecliente/service/supabase_service.dart';

class InProcess extends StatefulWidget {
  const InProcess({super.key});

  @override
  State<InProcess> createState() => _InProcessState();
}

class _InProcessState extends State<InProcess> {
  final authService = AuthService();
  final ticketService = TicketService();

  @override
  Widget build(BuildContext context) {
    final userEmail =
        authService.getCurrentUserEmail() ?? 'Usuario desconocido';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tickets en Processo de Resolución"),
        centerTitle: true,
      ),
      body: StreamBuilder<List<Ticket>>(
        stream: ticketService
            .closedTickets(userEmail), // Pasa el userEmail al stream
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
                    : 'no disponible';
                if (ticket.stateticket == 'En Proceso') {
                  return Card(
                    color: Color.fromARGB(191, 239, 108, 0),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black54),
                            child: Text(ticket.details.toString())),
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
                                      "Por: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(ticket.userapp.toString()),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Atiende: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(ticket.assigned.toString()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
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
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soportecliente/auth/auth_service.dart';
import 'package:soportecliente/model/ticket.dart';
import 'package:soportecliente/service/supabase_service.dart';

class HistoryTickets extends StatefulWidget {
  const HistoryTickets({super.key});

  @override
  State<HistoryTickets> createState() => _HistoryTicketsState();
}

class _HistoryTicketsState extends State<HistoryTickets> {
  final authService = AuthService();
  final ticketService = TicketService();

  @override
  Widget build(BuildContext context) {
    final userEmail =
        authService.getCurrentUserEmail() ?? 'Usuario desconocido';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Historial de Ticket Resueltos"),
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
                String formattedDate2 = ticket.changeState != null
                    ? DateFormat('kk:mm - dd-MM-yyyy')
                        .format(ticket.changeState!)
                    : 'no disponible';
                if (ticket.stateticket == 'Resuelto') {
                  return Card(
                    color: Colors.green,
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
                                      "Resuelto: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(formattedDate2),
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
                                    ),
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

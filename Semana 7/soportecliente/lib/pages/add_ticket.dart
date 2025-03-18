import 'package:flutter/material.dart';
import 'package:soportecliente/auth/auth_service.dart';
import 'package:soportecliente/model/ticket.dart';
import 'package:soportecliente/pages/profilepage.dart';
import 'package:soportecliente/service/supabase_service.dart';

class AddTicket extends StatefulWidget {
  const AddTicket({super.key});

  @override
  State<AddTicket> createState() => _AddTicketState();
}

class _AddTicketState extends State<AddTicket> {
  final authService = AuthService();
  final _detailsController = TextEditingController();
  final ticketDatabase = TicketService();

  void addNewTicket() {
    ticketDatabase.createTicket(Ticket(
      userapp: authService.getCurrentUserEmail().toString(),
      details: _detailsController.text,
      multimedia: '',
      stateticket: 'Creado',
    ));
    _detailsController.clear();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Profilepage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Abrir Ticket de Soporte"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: _detailsController,
                      decoration: const InputDecoration(
                        labelText: 'Redacte el problema',
                        hintText: 'Escriba aquí los detalles de su problema',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      maxLines: null, // Se adapta automáticamente
                      minLines: 5, // Altura mínima inicial
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addNewTicket,
              child: const Text('Enviar Ticket'),
            ),
          ],
        ),
      ),
    );
  }
}

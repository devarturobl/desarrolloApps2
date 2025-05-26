import 'package:soporteadministrador/model/ticket.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TicketService {
  final database = Supabase.instance.client.from('service');

  // Crear ticket
  Future createTicket(Ticket newTicket) async {
    await database.insert(newTicket.toMap());
  }

  //Leer tickets filtrados por userEmail
  Stream<List<Ticket>> getUserTickets(String userApp) {
    return database
        .stream(primaryKey: ['id'])
        .eq('userapp', userApp)
        .order('id', ascending: false)
        .map((data) =>
            data.map((ticketMap) => Ticket.fromMap(ticketMap)).toList());
  }

  Stream<List<Ticket>> closedTickets() {
    return database
        .stream(primaryKey: ['id'])
        //.eq('stateticket', 'Creado')
        .order('changeState', ascending: false)
        .map((data) =>
            data.map((ticketMap) => Ticket.fromMap(ticketMap)).toList());
  }

  // Actualizar ticket General
  Future updateTicket(Ticket oldTicket, String newDetails) async {
    await database.update({'details': newDetails}).eq('id', oldTicket.id!);
  }

  // Actualizar estado del ticket por soporte
  Future updateTicketState(Ticket oldTicket, String stateTicket) async {
    await database.update({'stateticket': stateTicket}).eq('id', oldTicket.id!);
  }

  // Actualizar estado del ticket por usuario
  Future updateTicketClose(Ticket ticket, String formattedDate) async {
    await database
        .update({'stateticket': 'Resuelto', 'changeState': formattedDate}).eq(
            'id', ticket.id!);
  }

  // Eliminar ticket
  Future deleteTicket(Ticket ticket) async {
    await database.delete().eq('id', ticket.id!);
  }
}

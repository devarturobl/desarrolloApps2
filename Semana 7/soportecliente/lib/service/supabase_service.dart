import 'package:soportecliente/model/ticket.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//Crud de la app
class TicketService {
  //Recuperar base de datos
  final database = Supabase.instance.client.from('service');

  //Crear ticket tomando el modelo del ticket
  Future createTicket(Ticket newTicket) async {
    await database.insert(newTicket.toMap());
  }

  //Leer ticket
  final stream = Supabase.instance.client.from('service').stream(
    primaryKey: ['id'],
  ).map((data) => data.map((ticketMap) => Ticket.fromMap(ticketMap)).toList());

  //Actualizar ticket
  Future updateTicket(Ticket oldTicket, String newDetails) async {
    await database.update({'details': newDetails}).eq('id', oldTicket.id!);
  }

  //Eliminar ticket
  Future deleteTicket(Ticket ticket) async {
    await database.delete().eq('id', ticket.id!);
  }
}

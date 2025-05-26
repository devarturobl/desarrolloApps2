import 'package:flutter/material.dart';
import 'package:soporteadministrador/auth/auth_service.dart';
import 'package:soporteadministrador/model/ticket.dart';
import 'package:soporteadministrador/pages/profilepage.dart';
import 'package:soporteadministrador/service/supabase_service.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddTicket extends StatefulWidget {
  const AddTicket({super.key});

  @override
  State<AddTicket> createState() => _AddTicketState();
}

class _AddTicketState extends State<AddTicket> {
  final authService = AuthService();
  final _detailsController = TextEditingController();
  final ticketDatabase = TicketService();
  String ruta = '';

  File? _imageFile;

  //pick Image

  Future pickImage2() async {
    //picker
    final ImagePicker picker = ImagePicker();

    //pick from gallery
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    //update image preview
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  Future pickImage() async {
    //picker
    final ImagePicker picker = ImagePicker();

    //pick from gallery
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    //update image preview
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  void addNewTicket() async {
    String? imageUrl = await uploadImage(); // Esperar a que la imagen suba

    ticketDatabase.createTicket(Ticket(
      userapp: authService.getCurrentUserEmail().toString(),
      details: _detailsController.text,
      multimedia: imageUrl ?? '', // Guardar la URL si está disponible
      stateticket: 'Creado',
    ));

    _detailsController.clear();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Profilepage()),
    );
  }

  Future<String?> uploadImage() async {
    if (_imageFile == null) return null;

    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final path = "uploads/$fileName";

    try {
      await Supabase.instance.client.storage
          .from("images")
          .upload(path, _imageFile!);
      String publicUrl =
          Supabase.instance.client.storage.from("images").getPublicUrl(path);

      return publicUrl; // Devolver la URL pública
    } catch (e) {
      print("Error al subir imagen: $e");
      return null;
    }
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
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        ElevatedButton.icon(
                            onPressed: pickImage,
                            icon: Icon(Icons.camera_alt),
                            label: const Text('Tomar una foto')),
                        ElevatedButton.icon(
                            onPressed: pickImage2,
                            icon: Icon(Icons.camera_alt),
                            label: const Text('Seleccionar una foto')),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _imageFile != null
                        ? Image.file(_imageFile!)
                        : const Text("No hay imagen seleccionada"),
                    /*const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: uploadImage,
                      child: const Text("Subir imagen"),
                    ),*/
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

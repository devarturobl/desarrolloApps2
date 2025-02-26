import 'package:flutter/material.dart';
import 'package:firebase/services/firestore.dart';

class MyDetails extends StatefulWidget {
  final Color color; // Color de fondo
  final String mitexto; // Texto inicial
  final String docID;

  const MyDetails(
      {super.key,
      required this.color,
      required this.mitexto,
      required this.docID});

  @override
  State<MyDetails> createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
  final FirestoreService firestoreService = FirestoreService();
  late TextEditingController textController; // Inicializado en initState

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador con el texto recibido
    textController = TextEditingController(text: "${widget.mitexto}\n");

    textController.selection = TextSelection.fromPosition(
      TextPosition(offset: textController.text.length),
    );
  }

  @override
  void dispose() {
    textController
        .dispose(); // Libera el controlador cuando se cierra la pantalla
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: widget.color, // Usa el color proporcionado
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text("Editar Nota"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          //cursorColor: Colors.black,
          controller: textController,
          maxLines: null, // Permite múltiples líneas
          keyboardType: TextInputType.multiline,
          style: const TextStyle(fontSize: 18), // Tamaño del texto
          decoration: const InputDecoration(
            hintText: "Escribe tu nota aquí...",
            border:
                InputBorder.none, // Sin borde para una experiencia más limpia
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          firestoreService.updateDetailsNote(widget.docID, textController.text);
          Navigator.pop(context);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

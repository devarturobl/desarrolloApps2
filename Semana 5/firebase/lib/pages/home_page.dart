import 'package:firebase/services/firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //FireStore Service
  final FirestoreService firestoreService = FirestoreService();

  //Text controller
  final TextEditingController textController = TextEditingController();

  //LLamado a funcion
  void openNoteBox() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      firestoreService.addNote(textController.text);

                      textController.clear();

                      Navigator.pop(context);
                    },
                    child: Text("Add")),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO LIST"),
      ),
      body: Center(child: Text("Mis Notas")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openNoteBox();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

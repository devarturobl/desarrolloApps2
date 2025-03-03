import 'package:cloud_firestore/cloud_firestore.dart';
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
  void openNoteBox({String? docID}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      if (docID == null) {
                        firestoreService.addNote(textController.text);
                      } else {
                        firestoreService.updateNote(docID, textController.text);
                      }

                      textController.clear();

                      Navigator.pop(context);
                    },
                    child: Text("Save")),
              ],
            ));
  }

  void deleteBox({String? docID}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("¿Deseas eliminar la nota?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      firestoreService.deleteNote(docID!);
                      Navigator.pop(context);
                    },
                    child: Text("Si")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("No")),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(child: Text("MIS NOTAS")),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: firestoreService.getNotesStream(),
          builder: (context, snapshot) {
            //Si hay datos
            if (snapshot.hasData) {
              List noteList = snapshot.data!.docs;
              return ListView.builder(
                itemBuilder: (context, index) {
                  //Extraemos el id para el update y el delete
                  DocumentSnapshot document = noteList[index];
                  String docID = document.id;
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(noteList[index]['note']),
                        //Text(docID),
                        Row(children: [
                          GestureDetector(
                              onTap: () {
                                openNoteBox(docID: docID);
                              },
                              child: Icon(Icons.edit)),
                          SizedBox(width: 20),
                          GestureDetector(
                              onTap: () {
                                deleteBox(docID: docID);
                              },
                              child: Icon(Icons.delete)),
                        ])
                      ],
                    ),
                  );
                },
                itemCount: noteList.length,
              );
            } else {
              return Center(
                child: Text("Aun no hay notas"),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openNoteBox();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

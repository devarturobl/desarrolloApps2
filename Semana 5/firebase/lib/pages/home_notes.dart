//import 'package:firebase/pages/details.dart';
import 'package:firebase/pages/mydetails.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/services/firestore.dart';
import 'package:intl/intl.dart';

class HomeNotes extends StatefulWidget {
  const HomeNotes({super.key});

  @override
  State<HomeNotes> createState() => _HomeNotesState();
}

class _HomeNotesState extends State<HomeNotes> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController textController = TextEditingController();

  //LLamado a funcion
  void openNoteBox({String? docID}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Titulo Nota"),
              content: TextField(
                controller: textController,
              ),
              actions: [
                ElevatedButton.icon(
                    onPressed: () {
                      if (docID == null) {
                        firestoreService.addNote(textController.text);
                      } else {
                        firestoreService.updateNote(docID, textController.text);
                      }

                      textController.clear();

                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.save),
                    label: Text("Guardar")),
              ],
            ));
  }

  // Lista de colores para los contenedores
  final List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.brown,
    Colors.indigo,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DocumentSnapshot> noteList = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columnas
                  crossAxisSpacing: 15.0, // Espacio horizontal
                  mainAxisSpacing: 15.0, // Espacio vertical
                  childAspectRatio: 1.2, // Relación de aspecto
                ),
                itemCount: noteList.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = noteList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyDetails(
                                    color: colors[index % colors.length],
                                    mitexto: document['details'],
                                    docID: document.id,
                                  )));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: colors[index %
                            colors
                                .length], // Asigna color de la lista de forma cíclica
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: Text(
                              document['title'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateFormat('dd/MM/yyyy HH:mm').format(
                                  (document['timestamp'] as Timestamp).toDate(),
                                ),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                              Icon(Icons.delete, color: Colors.white)
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: Text("Aún no hay notas"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openNoteBox();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //Get Collection Ubicar la coleccion de firebase
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  //Create
  Future<void> addNote(String note) {
    return notes.add({
      'note' : note,
      'timestamp': Timestamp.now()
    });
  }

  //Read

  //Updae

  //Delete
}

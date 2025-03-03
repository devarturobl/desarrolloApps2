import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //Get Collection Ubicar la coleccion de firebase
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes1');

  //Create
  Future<void> addNote(String note) {
    return notes.add({
      'note' : note,
      'timestamp': Timestamp.now()
    });
  }

  //Read
  Stream<QuerySnapshot> getNotesStream() {
   final notesStream = notes.orderBy('timestamp', descending: true).snapshots();
   //final notesStream = notes.snapshots();
   return notesStream;
  }


  //Updae

  Future<void> updateNote (String docID, String newNote){
    return notes.doc(docID).update(
      {
        'note': newNote,
        'timestamp': Timestamp.now()
      }
    );
  }

  //Delete
  Future<void> deleteNote(String docID){
    return notes.doc(docID).delete();
  } 
}

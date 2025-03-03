import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //Get Collection Ubicar la coleccion de firebase
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('mynotes');

  //Create
  Future<void> addNote(String note) {
    return notes.add({
      'title' : note,
      'details': note,
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

  Future<void> updateNote (String docID, String titleNote){
    return notes.doc(docID).update(
      {
        'title': titleNote,
        'timestamp': Timestamp.now()
      }
    );
  }

  //Update details notes
  Future<void> updateDetailsNote (String docID, String detailsNote){
    return notes.doc(docID).update(
      {
        'details': detailsNote,
        'timestamp': Timestamp.now()
      }
    );
  }

  //Delete
  Future<void> deleteNote(String docID){
    return notes.doc(docID).delete();
  } 
}

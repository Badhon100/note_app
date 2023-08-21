import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_app/model/note_model.dart';

class NoteRepositoryController{
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  void addNoteToFirestire({
    required title,
    required description
  }) async{
    final timeSent = DateTime.now();
    final collection = await firestore.collection("Notes").doc();
    NoteModel noteModel = NoteModel(
      title: title, 
      description: description, 
      timeSent: timeSent, 
      userId: auth.currentUser!.uid, 
      noteId: collection.id
    );
    await collection.set(noteModel.toMap());
  }
}
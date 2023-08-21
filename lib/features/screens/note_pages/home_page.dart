import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/features/screens/add_note/add_note_page.dart';
import 'package:note_app/features/widgets/note_tile.dart';
import 'package:note_app/model/note_model.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff252525),
        title: Text(
          "Noteapp",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.amber[200]
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Notes").where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(), 
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final noteDataMap = snapshot.data!.docs[index];
              NoteModel noteModel = NoteModel.fromMap(noteDataMap.data() as Map<String, dynamic>);
              return NoteTile(
                noteModel: noteModel,
              );
            },
          );
        }
      ),
      floatingActionButton: SizedBox(
        height: 80,
        width: 65,
        child: FloatingActionButton(
          backgroundColor: Colors.amber[200],
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context)=> const AddNotePage()),
            );
          },
          child: const Icon(Icons.add, color: Colors.deepOrangeAccent, size: 32, weight: 30,),
        ),
      )
    );
  }
}
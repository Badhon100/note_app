import 'package:flutter/material.dart';
import 'package:note_app/controller/note_repository_controller.dart';
import 'package:note_app/features/screens/note_pages/note_page_screen.dart';
import 'package:note_app/model/note_model.dart';
import 'package:intl/intl.dart';

class NoteTile extends StatelessWidget {
  final NoteModel noteModel;
  const NoteTile({
    super.key,
    required this.noteModel
    });

  @override
  Widget build(BuildContext context) {
    final String date = DateFormat("MMM dd, yyy").format(noteModel.timeSent.toDate());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
              context, 
              MaterialPageRoute(builder: (context)=> NotePageScren(noteModel: noteModel,)),
            );
        },
        onLongPress: (){
          NoteRepositoryController().deleteNoteOnFireStore(noteModel.noteId);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber[200],
            borderRadius: BorderRadius.circular(8)
          ),
          child: Column(
            children: [
              Text(
                noteModel.title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black
                ),
              ),
              Text(date)
            ],
          ),
        ),
      ),
    );
  }
}
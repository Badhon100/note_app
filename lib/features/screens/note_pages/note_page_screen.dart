import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/features/screens/edit_note.dart/edit_note_screen.dart';
import 'package:note_app/model/note_model.dart';

class NotePageScren extends StatelessWidget {
  final NoteModel noteModel;
  const NotePageScren({
    super.key,
    required this.noteModel
  });
  

  @override
  Widget build(BuildContext context) {
    final String date = DateFormat("MMM dd, yyy").format(noteModel.timeSent.toDate());
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                      icon: Icon(Icons.arrow_back_ios_new, size: 32, color: Colors.amber[200],)
                  ),
                  Column(
                    children: [
                      Text(
                        noteModel.title,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      Text(date),
                    ],
                  ),
                  IconButton(
                    onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context)=> EditNoteScreen(noteId: noteModel.noteId)),
                      );
                    }, 
                      icon: Icon(Icons.edit, size: 32, color: Colors.amber[200],)
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                noteModel.description,
                  style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
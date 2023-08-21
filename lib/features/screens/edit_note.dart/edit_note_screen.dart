import 'package:flutter/material.dart';
import 'package:note_app/controller/note_repository_controller.dart';
import 'package:note_app/features/screens/note_pages/home_page.dart';
import 'package:note_app/features/widgets/custom_button.dart';

class EditNoteScreen extends StatefulWidget {
  final String noteId;
  final String title;
  final String description;
  const EditNoteScreen({
    super.key, 
    required this.noteId, 
    required this.title,
    required this.description
  });

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  
  @override
  Widget build(BuildContext context) {
    String title = widget.title;
    String description = widget.description;
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff252525),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.white24
                    ),
                  ) ,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                autofocus: false,
                maxLines: 10,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: description,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.white24
                    ),
                  ),
                ),
              ),
            ),
            CustomButoon(
              onTap: (){
                NoteRepositoryController().editNoteOnFirestore(
                  title: title, 
                  description: description,
                  noteId: widget.noteId
                );
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=> const Homepage()),
                );
              },
              text: "Update",
            ),
          ],
        ),
      ),
    );
  }
}
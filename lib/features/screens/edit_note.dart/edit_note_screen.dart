import 'package:flutter/material.dart';
import 'package:note_app/controller/note_repository_controller.dart';
import 'package:note_app/features/screens/note_pages/home_page.dart';
import 'package:note_app/features/widgets/custom_button.dart';

class EditNoteScreen extends StatefulWidget {
  final noteId;
  const EditNoteScreen({super.key, required this.noteId});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: titleController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.white24
                    ),
                  ) ,
                  hintText: "Title"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: descriptionController,
                maxLines: 10,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.white24
                    ),
                  ),
                  hintText: "Type something..."
                ),
              ),
            ),
            CustomButoon(
              onTap: (){
                NoteRepositoryController().editNoteOnFirestore(
                  title: titleController.text, 
                  description: descriptionController.text,
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
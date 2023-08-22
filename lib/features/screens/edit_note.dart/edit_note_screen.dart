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

    TextEditingController titleController = TextEditingController(text: widget.title);
    TextEditingController descriptionController = TextEditingController(text: widget.description);
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
                controller: titleController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.white24
                    ),
                  ) ,
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide:  const BorderSide(color: Colors.white24),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                autofocus: false,
                maxLines: 10,
                style: const TextStyle(color: Colors.white),
                controller: descriptionController,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.white24
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide:  const BorderSide(color: Colors.white24),
                  ),
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
                Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(builder: (context)=> const Homepage()),
                  (route) => false,
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
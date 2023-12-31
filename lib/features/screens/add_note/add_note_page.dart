import 'package:flutter/material.dart';
import 'package:note_app/controller/note_repository_controller.dart';
import 'package:note_app/features/screens/note_pages/home_page.dart';
import 'package:note_app/features/widgets/custom_button.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
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
                decoration:  InputDecoration(
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
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.white24
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide:  const BorderSide(color: Colors.white24),
                  ),
                  hintText: "Type something..."
                ),
              ),
            ),
            CustomButoon(
              onTap: (){
                NoteRepositoryController().addNoteToFirestire(
                  title: titleController.text, 
                  description: descriptionController.text
                );
                Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(builder: (context)=> const Homepage()),
                  (route) => false,
                );
              },
              text: "Save",
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:note_app/features/widgets/custom_button.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController commentController = TextEditingController();
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
                controller: commentController,
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
              onTap: (){},
              text: "Save",
            ),
          ],
        ),
      ),
    );
  }
}
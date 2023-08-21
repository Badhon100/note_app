import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        child: Column(
          children: [
            Text(
              noteModel.title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(date),
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
    );
  }
}
import 'package:flutter/material.dart';
import 'package:note_app/features/screens/add_note/add_note_page.dart';

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
      body: Column(
        children: [
          SizedBox(),
        ],
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
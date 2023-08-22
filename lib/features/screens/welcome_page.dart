import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({super.key});

  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  void signInAnonymously()async{
    await FirebaseAuth.instance.signInAnonymously();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: Center(
            child: InkWell(
              onTap: signInAnonymously,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Welcome to Noteapp",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber[200]
                    ),
                  ),
                  Icon(Icons.edit_calendar_rounded, size: 150, color: Colors.amber[200],),
                  Text(
                    "Tap anywhere to continue",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber[200]
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
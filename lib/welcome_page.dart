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
      body: Center(
        child: InkWell(
          onTap: signInAnonymously,
          child: Text(
            "Welcome to Noteapp",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.amber[200]
            ),
          ),
        ),
      ),
    );
  }
}
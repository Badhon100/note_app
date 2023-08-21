import 'package:flutter/material.dart';

class CustomButoon extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButoon({
    super.key,
    required this.onTap,
    required this.text
    });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height*0.06,
        width: MediaQuery.of(context).size.width*0.9,
        decoration: BoxDecoration(
          color: Colors.amber[200],
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.greenAccent,
              fontSize: 26,
              fontWeight: FontWeight.bold
            ),
            ),
          ), 
      ),
    );
  }
}
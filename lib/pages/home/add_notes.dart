import 'package:flutter/material.dart';

class AddNotesPage extends StatelessWidget {
  const AddNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color(0xFFF9F5EF),
    body: Container (),
    appBar: AppBar(
      backgroundColor: Colors.transparent,
    elevation: 0,
    leading: const Icon(Icons.arrow_back, color: Colors.black),
    title: const Text(
      "Add notes",
      style: TextStyle(color: Colors.black),
       ),
      ),
    );  
  }
}

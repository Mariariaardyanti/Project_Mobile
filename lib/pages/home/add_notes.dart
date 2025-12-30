import 'package:flutter/material.dart';

class NoteAppBar extends StatelessWidget {
  const NoteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
      title: const Text("Add notes", style: TextStyle(color: Colors.black)),
      actions: const [
        Icon(Icons.star, color: Colors.brown),
        SizedBox(width: 10),
        Icon(Icons.notifications_none),
        SizedBox(width: 12),
      ],
    );
  }
}

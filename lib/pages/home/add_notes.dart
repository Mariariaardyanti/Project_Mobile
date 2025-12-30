import 'package:flutter/material.dart';

class AddNotesPage extends StatelessWidget {
  const AddNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Add notes",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF8B6B2E),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Get Pro",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const Icon(Icons.notifications_none, color: Colors.black),
          const SizedBox(width: 10),
          const Icon(Icons.person_outline, color: Colors.black),
          const SizedBox(width: 12),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Last Edit: 03.00 pm",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 12),

            const Text(
              "Title",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),

            Container(
              width: double.infinity,
              height: 320,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8EE),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const TextField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Write your note here...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

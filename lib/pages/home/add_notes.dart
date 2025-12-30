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
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
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

            const SizedBox(height: 8),
            Row(
              children: List.generate(
                5,
                (index) => Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: [
                      Colors.white,
                      Color(0xFFFFE6A7),
                      Color(0xFFE6F0FF),
                      Color(0xFFE8FFE8),
                      Color(0xFFFFE8E8),
                    ][index],
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8EE),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Title",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.push_pin_outlined, size: 18),
                            SizedBox(width: 8),
                            Icon(Icons.notifications_none, size: 18),
                            SizedBox(width: 8),
                            Icon(Icons.archive_outlined, size: 18),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Type your note",
                          border: InputBorder.none,
                        ),
                        maxLines: null,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.add_box_outlined),
                            SizedBox(width: 12),
                            Icon(Icons.text_fields),
                            SizedBox(width: 12),
                            Icon(Icons.more_vert),
                          ],
                        ),

                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8B6B2E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                          ),
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

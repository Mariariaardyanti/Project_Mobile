import 'package:flutter/material.dart';
import 'package:project_mobile/pages/home/homepage.dart';

class Members extends StatelessWidget {
  const Members({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 5),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.workspace_premium,
                                size: 18,
                                color: Colors.white,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "Get Pro",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.notifications_none),
                        const SizedBox(width: 12),
                        const Icon(Icons.person_2_outlined, size: 24),
                        SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  "My notes",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 36),
                Text(
                  "Project Team Members",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 16),

                // ===== PROJECT TEAM =====
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF6E9),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Created as a learning project, this app combines notes, tasks, and collaboration features. Meet the people behind this project and learn a little about what they built",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // ===== BOTTOM NAV =====
      bottomNavigationBar: BottomNavigationBar(
  currentIndex: 0,
  onTap: (index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => Homepage()),
      );
    }
  },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.amber[50], // background icon
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.home_outlined, size: 30),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100], // background icon
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.add, size: 30),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100], // background icon
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.sticky_note_2_outlined, size: 28),
            ),
          ),
        ],
      ),
    );
  }
}

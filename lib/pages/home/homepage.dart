import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool task1 = false;
  bool task2 = false;
  bool task3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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

                const SizedBox(height: 16),
                // ===== SEARCH BAR =====
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: "Search...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // ===== CARD 1 =====
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFCF7),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                0.1,
                              ), // warna shadow
                              blurRadius: 6,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: const Text(
                          "Project Team Members",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Created as a learning project, this app combines notes, tasks, and collaboration features.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 2,
                              ),
                              visualDensity: VisualDensity.compact,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: const Text(
                              "Details",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // ===== CARD 2 =====
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F8FF),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                0.1,
                              ), // warna shadow
                              blurRadius: 6,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: const Text(
                          "To-Do List",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                            height: 24,
                            child: Checkbox(
                              value: task1,
                              onChanged: (value) {
                                setState(() {
                                  task1 = value!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "Finish essay draft",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                            height: 24,
                            child: Checkbox(
                              value: task2,
                              onChanged: (value) {
                                setState(() {
                                  task2 = value!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "Group project sync",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(width: 8),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                            height: 24,
                            child: Checkbox(
                              value: task3,
                              onChanged: (value) {
                                setState(() {
                                  task3 = value!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "Submit assignment on LMS",
                            style: TextStyle(fontSize: 12),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 2,
                              ),
                              visualDensity: VisualDensity.compact,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: const Text(
                              "Details",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),

                      // JARAK KE BUTTON
                      // button di bawah, rata kanan
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
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        currentIndex: 0,
        elevation: 0,
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

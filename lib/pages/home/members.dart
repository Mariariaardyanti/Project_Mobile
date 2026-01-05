import 'package:project_mobile/services/fcm_notification_service.dart';
import 'package:project_mobile/pages/home/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:project_mobile/pages/home/add_notes.dart';
import 'package:project_mobile/pages/home/profile.dart';

class Members extends StatefulWidget {
  const Members({super.key});

  @override
  State<Members> createState() => _MembersState();
}

class _MembersState extends State<Members> {
  bool task1 = false;
  bool task2 = false;
  bool task3 = false;
  bool _isNotifHovered = false;

  // ===== FCM =====
  final FCMNotificationService _fcmService = FCMNotificationService();
  List<String> _notifications = [];

  @override 
  void initState() {
    super.initState();

    _fcmService.init(
      onMessageReceived: (String message) {
        setState(() {
          if (!_notifications.contains(message)) {
            _notifications.insert(0, message);
          }
        });
      },
    );
  }


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
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (_) {
                            setState(() => _isNotifHovered = true);
                          },
                          onExit: (_) {
                            setState(() => _isNotifHovered = false);
                          },
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NotificationPage(
                                    notifications: _notifications,
                                  ),
                                ),
                              );
                            },
                            child: AnimatedScale(
                              scale: _isNotifHovered ? 1.1 : 1.0,
                              duration: const Duration(milliseconds: 150),
                              child: Stack(
                                children: [
                                  const Icon(Icons.notifications_none),
                                  if (_notifications.isNotEmpty)
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),



                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfilePage(),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.person_2_outlined,
                            size: 24,
                          ),
                        ),

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

                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
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
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        currentIndex: 0,
        elevation: 0,
        onTap: (index) {
          if (index == 1) {

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddNotesPage(),
              ),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.amber[50],
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
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.add, size: 30),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.sticky_note_2_outlined, size: 28),
            ),
          ),
        ],
      ),

    );
  }
}

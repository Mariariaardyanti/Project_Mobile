import 'package:flutter/material.dart';
import 'package:project_mobile/pages/home/notification_page.dart';
import 'package:project_mobile/pages/notes/add_notes.dart';
import 'package:project_mobile/pages/profile/profile.dart';

class ProfileMaria extends StatelessWidget {
  const ProfileMaria({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> notifications = [];

    return Scaffold(
      backgroundColor: Colors.white,

      // ===== APP BAR (GET PRO, NOTIF, PROFILE DI ATAS) =====
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Profile Member',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              children: [
                // GET PRO
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

                // NOTIFICATION
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationPage(
                          notifications: notifications,
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      const Icon(Icons.notifications_none),
                      if (notifications.isNotEmpty)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                // PROFILE
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  },
                  child: const Icon(Icons.person_2_outlined, size: 24),
                ),
              ],
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                color: const Color(0xffFFF6EA),
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xffF58529),
                                  Color(0xffDD2A7B),
                                  Color(0xff8134AF),
                                  Color(0xff515BD4),
                                ],
                              ),
                            ),
                            child: const CircleAvatar(
                              radius: 38,
                              backgroundImage:
                                  AssetImage('assets/images/maria_P.png'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Maria Euphrasia',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  '1123150050',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'TI SE 23 M',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Keahlian : Flutter Basic',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.black54,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),
                      const Text(
                        'Memiliki keahlian dasar dalam pengembangan aplikasi menggunakan Flutter, termasuk pembuatan '
                        'tampilan antarmuka (UI) dengan widget dasar, pengelolaan layout, navigasi antar halaman, serta '
                        'penggunaan asset seperti gambar dan ikon. Terbiasa menerapkan konsep StatelessWidget dan '
                        'StatefulWidget untuk membangun aplikasi yang terstruktur dan mudah dikembangkan.',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.black54,
                          height: 1.4,
                        ),
                      ),

                      const Divider(height: 24, thickness: 0.6),

                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        children: const [
                          Image(
                            image: AssetImage('assets/images/maria1.jpg'),
                            fit: BoxFit.cover,
                          ),
                          Image(
                            image: AssetImage('assets/images/maria2.jpg'),
                            fit: BoxFit.cover,
                          ),
                          Image(
                            image: AssetImage('assets/images/maria3.jpg'),
                            fit: BoxFit.cover,
                          ),
                          Image(
                            image: AssetImage('assets/images/maria4.jpg'),
                            fit: BoxFit.cover,
                          ),
                          Image(
                            image: AssetImage('assets/images/maria5.jpg'),
                            fit: BoxFit.cover,
                          ),
                          Image(
                            image: AssetImage('assets/images/maria6.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // ===== BOTTOM NAV =====
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        elevation: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddNotesPage()),
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

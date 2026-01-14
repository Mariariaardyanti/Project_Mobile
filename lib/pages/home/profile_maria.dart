import 'package:flutter/material.dart';
import 'package:project_mobile/pages/home/notification_page.dart';
import 'package:project_mobile/pages/notes/add_notes.dart';
import 'package:project_mobile/pages/profile/profile.dart';
import 'package:project_mobile/pages/home/homepage.dart';


class ProfileMaria extends StatelessWidget {
  const ProfileMaria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'maria_euphrasia',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                  // FOTO + BIO (INSTAGRAM STYLE)
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
                              AssetImage('assets/images/profile.jpg'),
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
                              'Memotret perjalanan, menemukan damai di Goa Maria.',
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
                    'Menjalani peran sebagai mahasiswi Teknologi Informasi sekaligus bekerja '
                    'sebagai admin di salah satu toko mengajarkan saya tentang kedisiplinan '
                    'dan tanggung jawab. Melalui fotografi dan perjalanan ke Goa Maria, saya '
                    'menemukan keseimbangan antara kesibukan sehari-hari dan ketenangan batin.',
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
                        image: AssetImage('assets/images/post1.jpg'),
                        fit: BoxFit.cover,
                      ),
                      Image(
                        image: AssetImage('assets/images/post2.jpg'),
                        fit: BoxFit.cover,
                      ),
                      Image(
                        image: AssetImage('assets/images/post3.jpg'),
                        fit: BoxFit.cover,
                      ),
                      Image(
                        image: AssetImage('assets/images/post4.jpg'),
                        fit: BoxFit.cover,
                      ),
                      Image(
                        image: AssetImage('assets/images/post5.jpg'),
                        fit: BoxFit.cover,
                      ),
                      Image(
                        image: AssetImage('assets/images/post6.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
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

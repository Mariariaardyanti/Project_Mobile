import 'package:flutter/material.dart';

class ProfileMaria extends StatelessWidget {
  const ProfileMaria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // tetap putih
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
            color: const Color(0xffFFF6EA), // card putih
            elevation: 1, // shadow tipis
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // FOTO PROFILE
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
                      radius: 42,
                      backgroundImage:
                          AssetImage('assets/images/profile.jpg'),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // BIO
                  const Text(
                    'Maria Euphrasia',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    '1123150050',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'TI SE 23 M',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Menyukai cahaya, doa, dan langkah kecil dalam perjalanan.\nMemotret momen, berjalan ke Goa Maria.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black54,
                      height: 1.3,
                    ),
                  ),

                  const Divider(height: 24, thickness: 0.6),

                  // GRID FOTO
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
    );
  }
}

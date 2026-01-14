import 'package:flutter/material.dart';


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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
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
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        const Text(
                            'Maria Euphrasia',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                            ),
                       ),

                       const Text('Programmer Setengah Magang 💻'),
                       const Text('Flutter • Firebase • UI/UX'),
                       const Text('Belajar pelan-pelan yang penting konsisten'),
                       const Divider(
                        thickness: 0.6,
                        height: 24,
                        ),
                    ],
                ),
             ),
          ],
        ),
      ),
    );
  }
}

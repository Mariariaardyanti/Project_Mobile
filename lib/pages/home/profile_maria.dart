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
              child: const CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

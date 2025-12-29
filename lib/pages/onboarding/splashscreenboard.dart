import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_mobile/pages/splash/splashscreen1.dart';

class SplashScreenBoard extends StatefulWidget {
  const SplashScreenBoard({super.key});

  @override
  State<SplashScreenBoard> createState() => _SplashScreenPageBoard();
}

class _SplashScreenPageBoard extends State<SplashScreenBoard> {
  @override
  void initState() {
    super.initState();

    // Delay 3 detik lalu pindah halaman
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SplashScreenPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              "B O A R D",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.brown[800],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "One board for every one.",
              style: TextStyle(fontSize: 12, color: Colors.brown),
            ),
          ],
        ),
      ),
    );
  }
}

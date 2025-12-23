import 'package:flutter/material.dart';
import 'package:project_mobile/pages/splashscreen1.dart';

class SplashScreenBoard extends StatelessWidget {
  const SplashScreenBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              "B O A R D",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.brown[800],
              ),
            ),

            SizedBox(height: 10),
            Text(
              "One board for everyone.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.0, color: Colors.brown),
            ),

            SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.only(left: 40, right: 40),
              child: SizedBox(
                height: 44,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SplashScreenPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF745624),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

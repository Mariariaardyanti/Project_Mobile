import 'package:flutter/material.dart';

class SplashScreen4 extends StatelessWidget {
  const SplashScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SizedBox(height: 30),
          Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber[50],
                image: DecorationImage(
                image: AssetImage("assets/images/logo kampus.png"),
              ),
            ),
          ),

          SizedBox(height: 15),
          Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFedede9),
              ),
            ),

            SizedBox(width: 10),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFedede9),
                ),
              ),

              SizedBox(width: 10),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF745624),
                ),
              ),

              SizedBox(height: 20),
              Text(
                "Institut Teknologi dan\nBisnis Bina Sarana Global",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[800],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Kampus modern yang menggabungkan\nkeunggulan di bidang teknologi",
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF745624),
                  ),
                  child: const Text(
                    'Let’s get started',
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

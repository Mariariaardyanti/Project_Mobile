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
                image: AssetImage("assets/images/imageee.png"),
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project_mobile/pages/login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Create Account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Fill your information bellow or register\nwith your social account.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 50),
              Text(
                "Name",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 5),
              TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'ex. Helen',
                  hintStyle: TextStyle(color: Color(0xFFC2C2C2)),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue[700]!, width: 2),
                  ),
                ),
              ),

              SizedBox(height: 10),
              Text(
                "Email",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 5),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'example@gmail.com',
                  hintStyle: TextStyle(color: Color(0xFFC2C2C2)),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue[700]!, width: 2),
                  ),
                ),
              ),

              SizedBox(height: 10),
              Text(
                "Password",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Input your Password',
                  hintStyle: TextStyle(color: Color(0xFFC2C2C2)),
                  suffixIcon: const Icon(Icons.visibility_outlined),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue[700]!, width: 2),
                  ),
                ),
              ),

              SizedBox(height: 25),
              //button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF745624),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(height: 30),

              //bikin line
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[300])),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Or sign up with',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey[300])),
                ],
              ),

              SizedBox(height: 30),

              //social login button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //facebook
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFF745624), width: 1.5),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 25,
                      onPressed: () {
                        //facebook login
                      },
                      icon: const Icon(
                        Icons.facebook,
                        color: Color(0xFF745624),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  //google
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFF745624), width: 1.5),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 30,
                      onPressed: () {
                        //google login
                      },
                      icon: const Icon(
                        Icons.g_mobiledata,
                        color: Color(0xFF745624),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  //apple
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFF745624), width: 1.5),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 25,
                      onPressed: () {
                        //apple login
                      },
                      icon: const Icon(Icons.apple, color: Color(0xFF745624)),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: "Sign in",
                        style: TextStyle(
                          color: Color(0xFF745624),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

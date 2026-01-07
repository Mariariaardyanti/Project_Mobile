import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';
import 'pages/onboarding/splashscreenboard.dart';
import 'pages/home/members.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: 'https://jcpuynzpwaahzupeegnm.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpjcHV5bnpwd2FhaHp1cGVlZ25tIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjU0MTg4NjIsImV4cCI6MjA4MDk5NDg2Mn0.GIFj_MPLS6t_RQDK2tDhHphAs8K_zgrAfnh_y0iTm3Y',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Board",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        fontFamily: 'Poppins',
      ),
      home: const Members(),
    );
  }
}

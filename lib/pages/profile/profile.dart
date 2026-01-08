import 'package:flutter/material.dart';
import 'package:project_mobile/pages/notes/add_notes.dart';
import 'package:project_mobile/pages/home/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   User? user;
  final ImagePicker _picker = ImagePicker();

   @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }


  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String uid) {
    return FirebaseFirestore.instance.collection('users').doc(uid).get();
  }

  //pick image
  Future<File?> pickImage() async {
    final picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (picked == null) return null;
    return File(picked.path);
  }

  //upload ke supabase
   Future<String> uploadProfileImage(File file) async {
    final supabase = Supabase.instance.client;
    final path = 'uploads/profile/${user!.uid}.jpg';

    await supabase.storage
        .from('bucket_imagess')
        .upload(
          path,
          file,
          fileOptions: const FileOptions(upsert: true),
        );

    return supabase.storage
        .from('bucket_imagess')
        .getPublicUrl(path);
  }


  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return const Scaffold(body: Center(child: Text("User not logged in")));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B5E3C),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.workspace_premium,
                              size: 14,
                              color: Colors.white,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "Get Pro",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.notifications_none, size: 20),
                      const SizedBox(width: 12),
                      const Icon(Icons.person_outline, size: 20),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "Profile",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF6E9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage("assets/profile.jpg"),
                    ),
                    const SizedBox(height: 6),
                    FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      future: getUserData(currentUser.uid),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text(
                            "-",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }

                        if (snapshot.hasError ||
                            !snapshot.hasData ||
                            snapshot.data!.data() == null) {
                          return Text(
                            currentUser.email!.split('@').first,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }

                        final data = snapshot.data!.data()!;
                        return Text(
                          data['name'] ?? currentUser.email!.split('@').first,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: const [
                            Text(
                              "61",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text("Friend", style: TextStyle(fontSize: 11)),
                          ],
                        ),
                        Container(
                          height: 24,
                          width: 1,
                          color: Colors.black12,
                          margin: const EdgeInsets.symmetric(horizontal: 14),
                        ),
                        Column(
                          children: const [
                            Text(
                              "20",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text("Group", style: TextStyle(fontSize: 11)),
                          ],
                        ),
                        Container(
                          height: 24,
                          width: 1,
                          color: Colors.black12,
                          margin: const EdgeInsets.symmetric(horizontal: 14),
                        ),
                        Column(
                          children: const [
                            Text(
                              "0",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text("Post", style: TextStyle(fontSize: 11)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF6E9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Personal",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8B5E3C),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: const [
                        Icon(Icons.edit_outlined, size: 18),
                        SizedBox(width: 10),
                        Text("Edit profile", style: TextStyle(fontSize: 13)),
                        Spacer(),
                        Icon(Icons.chevron_right, size: 18),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: const [
                        Icon(Icons.group_outlined, size: 18),
                        SizedBox(width: 10),
                        Text(
                          "Invite your friend",
                          style: TextStyle(fontSize: 13),
                        ),
                        Spacer(),
                        Icon(Icons.chevron_right, size: 18),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF6E9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Setting",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8B5E3C),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: const [
                        Icon(Icons.language, size: 18),
                        SizedBox(width: 10),
                        Text("Language", style: TextStyle(fontSize: 13)),
                        Spacer(),
                        Icon(Icons.chevron_right, size: 18),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: const [
                        Icon(Icons.help_outline, size: 18),
                        SizedBox(width: 10),
                        Text("Help Center", style: TextStyle(fontSize: 13)),
                        Spacer(),
                        Icon(Icons.chevron_right, size: 18),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF6E9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Support us",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8B5E3C),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Icon(Icons.camera_alt_outlined, size: 18),
                        SizedBox(width: 10),
                        Text(
                          "Follow us on instagram",
                          style: TextStyle(fontSize: 13),
                        ),
                        Spacer(),
                        Icon(Icons.chevron_right, size: 18),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Icon(Icons.star_border, size: 18),
                        SizedBox(width: 10),
                        Text("Rate us", style: TextStyle(fontSize: 13)),
                        Spacer(),
                        Icon(Icons.chevron_right, size: 18),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home_outlined, size: 28),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepage()),
                );
              },
            ),
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                color: Color(0xFFFFF1D6),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.add, size: 30),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddNotesPage(),
                    ),
                  );
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.sticky_note_2_outlined, size: 26),
              onPressed: () {
                // Navigator ke NotesPage
              },
            ),
          ],
        ),
      ),
    );
  }
}

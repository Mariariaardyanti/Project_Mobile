import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),

              // ===== TOP BAR =====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B5E3C),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.workspace_premium, size: 14, color: Colors.white),
                            SizedBox(width: 4),
                            Text(
                              "Get Pro",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.notifications_none, size: 20),
                      const SizedBox(width: 12),
                      const Icon(Icons.person_outline, size: 20),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 10),

              const Text(
                "Profile",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // ===== PROFILE CARD =====
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF6E9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                        radius: 28, backgroundImage: AssetImage("assets/profile.jpg")),
                    const SizedBox(height: 6),
                    const Text(
                      "Maria Eupharsia",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),

                    // ===== STAT ROW =====
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: const [
                            Text("61",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            SizedBox(height: 2),
                            Text("Friend", style: TextStyle(fontSize: 11)),
                          ],
                        ),
                        Container(
                            height: 24,
                            width: 1,
                            color: Colors.black12,
                            margin: const EdgeInsets.symmetric(horizontal: 14)),
                        Column(
                          children: const [
                            Text("20",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            SizedBox(height: 2),
                            Text("Group", style: TextStyle(fontSize: 11)),
                          ],
                        ),
                        Container(
                            height: 24,
                            width: 1,
                            color: Colors.black12,
                            margin: const EdgeInsets.symmetric(horizontal: 14)),
                        Column(
                          children: const [
                            Text("0",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
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

              // ===== PERSONAL SECTION =====
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF6E9),
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
                          color: Color(0xFF8B5E3C)),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: const [
                        Icon(Icons.note_outlined, size: 18),
                        SizedBox(width: 10),
                        Text("Mood tracker", style: TextStyle(fontSize: 13)),
                        Spacer(),
                        Icon(Icons.chevron_right, size: 18),
                      ],
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
                        Text("Invite your friend", style: TextStyle(fontSize: 13)),
                        Spacer(),
                        Icon(Icons.chevron_right, size: 18),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // ===== SETTING SECTION =====
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF6E9),
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
                          color: Color(0xFF8B5E3C)),
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

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF6E9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Support us",
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF8B5E3C)),
                    ),

                    SizedBox(height: 6),
                    Row(
                      children: const [
                        Icon(Icons.camera_alt_outlined, size: 18),
                        SizedBox(width: 10),
                        Text("Follow us on instagram", style: TextStyle(fontSize: 13)),
                        Spacer(),
                        Icon(Icons.chevron_right, size: 18),
                      ],
                    ),
                    SizedBox(height: 6),
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
    );
  }
}

import 'package:project_mobile/services/fcm_notification_service.dart';
import 'package:project_mobile/pages/home/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:project_mobile/pages/notes/add_notes.dart';
import 'package:project_mobile/pages/profile/profile.dart';

class Member_Ari extends StatefulWidget {
  const Member_Ari({super.key});

  @override
  State<Member_Ari> createState() => _Member_AriState();
}

class _Member_AriState extends State<Member_Ari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // ===== TOMBOL KEMBALI =====
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Member",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
                    Row(
                      children: [
                        const Text(
                          "Project Team Members",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          ">",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Ari Purwo Aji",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFCF7),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          const Text(
                            "< Project Team Members",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 161, 145, 139),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Created as a learning project, this app combines notes, tasks, and collaboration features. Meet the people behind this project and learn a little about what they built",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 111, 101, 66),
                            ),
                          ),

                          // ===== DETAIL MEMBER ARI =====
                          const SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF3E0),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                    0.1,
                                  ), // warna shadow
                                  blurRadius: 6,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Hello I’am… 👋",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown,
                                  ),
                                ),
                                const SizedBox(height: 16),

                                // ===== NAMA LENGKAP =====
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 4),
                                      width: 56,
                                      height: 56,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.amber[50],
                                        image: const DecorationImage(
                                          image: AssetImage(
                                            'assets/images/lockscreen.jpg',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.1,
                                            ),
                                            blurRadius: 6,
                                            offset: const Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 24),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Nama",
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "Ari Purwo Aji",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.brown,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          SizedBox(height: 4),
                                          Text(
                                            "NIM",
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "1123150126",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.brown,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            "KELAS",
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "TI 23 M SE",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.brown,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            "KEAHLIAN",
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "Menganalisa & Merancang Sistem",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.brown,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                // ===== GARIS PEMISAH =====
                                const SizedBox(height: 20),
                                Divider(
                                  thickness: 0.8,
                                  color: Colors.brown.withOpacity(0.3),
                                ),

                                // ===== ROLE IN PROJECT =====
                                const SizedBox(height: 16),
                                Text(
                                  "Role in Project :",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown.shade700,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Terlibat dalam proses analisis kebutuhan, perancangan alur aplikasi, dan pengembangan antarmuka sebagai bagian dari pembelajaran pengembangan aplikasi mobile.",
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 1.5,
                                    color: Colors.brown.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

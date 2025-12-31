import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ===== BODY =====
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== TOP BAR =====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B5E3C),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.workspace_premium,
                                size: 16, color: Colors.white),
                            SizedBox(width: 6),
                            Text(
                              "Get Pro",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.notifications_none),
                      const SizedBox(width: 12),
                      const Icon(Icons.person_outline),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 24),

              // ===== TITLE =====
              const Text(
                "Profile",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // ===== PROFILE CARD =====
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF6E9),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 38,
                      backgroundImage: AssetImage("assets/profile.jpg"),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Ilene Ziegler",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 14),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        _ProfileStat(title: "Friend", value: "61"),
                        _Divider(),
                        _ProfileStat(title: "Group", value: "20"),
                        _Divider(),
                        _ProfileStat(title: "Post", value: "0"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ===== PERSONAL =====
              const _SectionTitle(title: "Personal"),
              _MenuItem(
                icon: Icons.notifications_none,
                title: "Mood tracker",
              ),
              _MenuItem(
                icon: Icons.edit_outlined,
                title: "Edit profile",
              ),
              _MenuItem(
                icon: Icons.group_outlined,
                title: "Invite your friend",
              ),

              const SizedBox(height: 16),

              // ===== SETTING =====
              const _SectionTitle(title: "Setting"),
              _MenuItem(
                icon: Icons.language,
                title: "Language",
              ),
              _MenuItem(
                icon: Icons.help_outline,
                title: "Help Center",
              ),

              const SizedBox(height: 16),

              // ===== SUPPORT =====
              const _SectionTitle(title: "Support us"),
              _MenuItem(
                icon: Icons.camera_alt_outlined,
                title: "Follow us on instagram",
              ),
              _MenuItem(
                icon: Icons.star_border,
                title: "Rate us",
              ),
            ],
          ),
        ),
      ),

      // ===== BOTTOM NAV =====
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            _bottomItem(Icons.home_outlined),
            _bottomItem(Icons.add),
            _bottomItem(Icons.bar_chart_outlined),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomItem(IconData icon) {
    return BottomNavigationBarItem(
      label: '',
      icon: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(icon, size: 28),
      ),
    );
  }
}

// ===== WIDGET KECIL =====

class _ProfileStat extends StatelessWidget {
  final String title;
  final String value;

  const _ProfileStat({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 1,
      color: Colors.grey.shade300,
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _MenuItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6E9),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(title)),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

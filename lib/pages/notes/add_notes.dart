import 'package:flutter/material.dart';
import 'package:project_mobile/pages/profile/profile.dart';
import 'package:project_mobile/pages/home/notification_page.dart';

class AddNotesPage extends StatelessWidget {
  const AddNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "Add notes",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.workspace_premium,
                          size: 18,
                          color: Colors.white,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Get Pro",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.notifications_none, color: Colors.black),
                  const SizedBox(width: 12),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                    child: const Icon(Icons.person_2_outlined, size: 24),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Last Edit: 03.00 pm",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 6),
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 6),
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6A7),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 6),
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Color(0xFFE6F0FF),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 6),
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Color(0xFFE8FFE8),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 6),
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE8E8),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                  ),
                ],
              ),

              ],
            ),

            const SizedBox(height: 16),

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8EE),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Title",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.push_pin_outlined, size: 18),
                            SizedBox(width: 8),
                            Icon(Icons.notifications_none, size: 18),
                            SizedBox(width: 8),
                            Icon(Icons.archive_outlined, size: 18),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Type your note",
                          border: InputBorder.none,
                        ),
                        maxLines: null,
                      ),
                    ),

                  Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Row(
      children: [
        PopupMenuButton(
          icon: const Icon(Icons.add_box_outlined),
          offset: const Offset(0, -160), // popup tepat di atas icon
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          itemBuilder: (context) => const [
            PopupMenuItem(
              height: 36,
              child: Row(
                children: [
                  Icon(Icons.check_box_outlined, size: 18),
                  SizedBox(width: 10),
                  Text("Checkboxes", style: TextStyle(fontSize: 13)),
                ],
              ),
            ),
            PopupMenuItem(
              height: 36,
              child: Row(
                children: [
                  Icon(Icons.image_outlined, size: 18),
                  SizedBox(width: 10),
                  Text("Add image", style: TextStyle(fontSize: 13)),
                ],
              ),
            ),
            PopupMenuItem(
              height: 36,
              child: Row(
                children: [
                  Icon(Icons.brush_outlined, size: 18),
                  SizedBox(width: 10),
                  Text("Drawing", style: TextStyle(fontSize: 13)),
                ],
              ),
            ),
            PopupMenuItem(
              height: 36,
              child: Row(
                children: [
                  Icon(Icons.mic_none, size: 18),
                  SizedBox(width: 10),
                  Text("Recording", style: TextStyle(fontSize: 13)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(width: 12),
        const Icon(Icons.text_fields),
        const SizedBox(width: 12),
        PopupMenuButton(
  icon: const Icon(Icons.more_vert),
  offset: const Offset(0, -170), 
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  itemBuilder: (context) => const [
    PopupMenuItem(
      height: 36,
      child: Row(
        children: [
          Icon(Icons.delete_outline, size: 18),
          SizedBox(width: 10),
          Text("Delete", style: TextStyle(fontSize: 13)),
        ],
      ),
    ),
    PopupMenuItem(
      height: 36,
      child: Row(
        children: [
          Icon(Icons.copy_outlined, size: 18),
          SizedBox(width: 10),
          Text("Make a copy", style: TextStyle(fontSize: 13)),
        ],
      ),
    ),
    PopupMenuItem(
      height: 36,
      child: Row(
        children: [
          Icon(Icons.send_outlined, size: 18),
          SizedBox(width: 10),
          Text("Send", style: TextStyle(fontSize: 13)),
        ],
      ),
    ),
    PopupMenuItem(
      height: 36,
      child: Row(
        children: [
          Icon(Icons.person_add_alt_1_outlined, size: 18),
          SizedBox(width: 10),
          Text("Collaborator", style: TextStyle(fontSize: 13)),
        ],
      ),
    ),
  ],
),

      ],
    ),

    ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8B6B2E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
      ),
      child: const Text(
        "Save",
        style: TextStyle(color: Colors.white),
      ),
    ),
  ],
),

                  ],
                ),
              ),
            ),
          ],
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
              onPressed: () {},
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
                onPressed: () {},
              ),
            ),

            IconButton(
              icon: const Icon(Icons.sticky_note_2_outlined, size: 26),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

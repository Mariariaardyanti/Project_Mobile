import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'package:project_mobile/models/note_model.dart';
import 'package:project_mobile/services/notes_service.dart';
import 'package:project_mobile/pages/notes/add_notes.dart';


class WorkspacePage extends StatefulWidget {
  const WorkspacePage({super.key});

  @override
  State<WorkspacePage> createState() => _WorkspacePageState();
}

class _WorkspacePageState extends State<WorkspacePage> {
  final NotesService _notesService = NotesService();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Scaffold(
        body: Center(child: Text('Please login first')),
      );
    }

    return const Scaffold(
      appBar: const _WorkspaceAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: _notesService.getUserNotes(user.uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            final docs = snapshot.data?.docs ?? [];
            if (docs.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.note_alt_outlined, size: 56, color: Colors.grey[400]),
                      const SizedBox(height: 12),
                      Text(
                        'Belum ada catatan',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const AddNotesPage()),
                          );
                        },
                        child: const Text('Buat Catatan'),
                      ),
                    ],
                  ),
                ),
              );
            }

            final notes = docs.map((d) => Note.fromFirestore(d)).toList();

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: ListView.separated(
                itemCount: notes.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return  _WorkspaceCard(
                    note: note,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AddNotesPage(note: note),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class _WorkspaceAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _WorkspaceAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Workspace', style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_list, color: Colors.black),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _WorkspaceCard extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;

  const _WorkspaceCard({
    required this.note,
    required this.onTap,
  });

  String _shortContent(String text) {
    if (text.length <= 80) return text;
    return text.substring(0, 80) + '…';
  }

  String _relativeStatus(DateTime? date) {
    if (date == null) return '';
    final now = DateTime.now();
    final diff = date.difference(DateTime(now.year, now.month, now.day));

    if (diff.inDays == 0) return 'Today';
    if (diff.inDays == 1) return 'Tomorrow';
    if (diff.isNegative && diff.inDays == -1) return 'Yesterday';
    if (diff.inDays < 7 && diff.inDays > 1) return '${diff.inDays} days';
    return DateFormat('MMM dd').format(date);
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Today':
        return Colors.red.shade400;
      case 'Tomorrow':
        return Colors.orange.shade400;
      case 'Yesterday':
        return Colors.grey.shade600;
      default:
        return Colors.green.shade400;
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = note.title;
    final desc = note.content;
    final firstLabel = note.labels.isNotEmpty ? note.labels.first : null;
    final statusText = _relativeStatus(note.updatedAt);
    
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F6F5),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                if (statusText.isNotEmpty)
                 Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _statusColor(statusText).withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      statusText,
                      style: TextStyle(
                        fontSize: 11,
                        color: _statusColor(statusText),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),

            Text(
              _shortContent(desc),
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 12),
            
          ],
        ),
      ),
    );
  }
}


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

    return const scaffold(
      appBar: const _WorkspaceAppBar(),
    );
  }
}

class _WorkspaceAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _WorkspaceAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Workspace'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


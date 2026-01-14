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
    return const Scaffold();
  }
}


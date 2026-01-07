import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
   final String id;
  final String title;
  final String content;
  final List<String> labels;
  final List<String> imageUrls;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String userId;
  final bool isPinned;
  final bool isArchived;
  
  Note({
    required this.id,
    required this.title,
    required this.content,
    this.labels = const [],
    this.imageUrls = const [],
    this.createdAt,
    this.updatedAt,
    required this.userId,
    this.isPinned = false,
    this.isArchived = false,
  });
}


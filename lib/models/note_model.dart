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

  factory Note.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Note(
      id: doc.id,
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      labels: List<String>.from(data['labels'] ?? []),
      imageUrls: List<String>.from(data['imageUrls'] ?? []),
       createdAt: data['createdAt'] != null 
          ? (data['createdAt'] as Timestamp).toDate() 
          : null,
       updatedAt: data['updatedAt'] != null 
          ? (data['updatedAt'] as Timestamp).toDate() 
          : null,
      userId: data['userId'] ?? '',
      isPinned: data['isPinned'] ?? false,
      isArchived: data['isArchived'] ?? false,

    );
  }

  //convert note to map for firestore
   Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'labels': labels,
      'imageUrls': imageUrls,
      'createdAt': createdAt != null 
          ? Timestamp.fromDate(createdAt!) 
          : FieldValue.serverTimestamp(),
      'updatedAt': updatedAt != null 
          ? Timestamp.fromDate(updatedAt!) 
          : FieldValue.serverTimestamp(),
      'userId': userId,
      'isPinned': isPinned,
      'isArchived': isArchived,
    };
  }

  
}

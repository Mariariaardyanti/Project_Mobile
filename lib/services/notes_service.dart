import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_mobile/models/note_model.dart';

class NotesService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collection = 'notes';

  //create notes
  Future<void> addNote(Note note) async {
    try {
      await _firestore.collection(collection).add(note.toMap());
    } catch (e) {
      print('Error adding note: $e');
      rethrow;
    }
  }

  //read semua notes user (tidak di arsipkan)
   Stream<QuerySnapshot> getUserNotes(String userId) {
    return _firestore
        .collection(collection)
        .where('userId', isEqualTo: userId)
        .where('isArchived', isEqualTo: false)
        .orderBy('isPinned', descending: true)
        .orderBy('updatedAt', descending: true)
        .snapshots();
  }

  //read notes yang diarsipkan
   Stream<QuerySnapshot> getArchivedNotes(String userId) {
    return _firestore
        .collection(collection)
        .where('userId', isEqualTo: userId)
        .where('isArchived', isEqualTo: true)
        .orderBy('updatedAt', descending: true)
        .snapshots();
  }

  //read notes berdasarkan labels
  Stream<QuerySnapshot> getNotesByLabel(String userId, String label) {
    return _firestore
        .collection(collection)
        .where('userId', isEqualTo: userId)
        .where('labels', arrayContains: label)
        .where('isArchived', isEqualTo: false)
        .orderBy('updatedAt', descending: true)
        .snapshots();
  }

  //update notes
  Future<void> updateNote(String noteId, Note note) async {
    try {
      await _firestore.collection(collection).doc(noteId).update({
        'title': note.title,
        'content': note.content,
        'labels': note.labels,
        'imageUrls': note.imageUrls,
        'isPinned': note.isPinned,
        'isArchived': note.isArchived,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error updating note: $e');
      rethrow;
    }
  }

}

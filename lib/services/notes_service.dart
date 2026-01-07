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

}

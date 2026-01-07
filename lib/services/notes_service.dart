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

}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class ImageService {
  final SupabaseClient _supabase = Supabase.instance.client;
  final ImagePicker _picker = ImagePicker();

  final String _bucketName = 'Board';

  // ================= PICK IMAGE =================
  Future<XFile?> pickFromGallery() async {
    return await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
  }

  Future<XFile?> pickFromCamera() async {
    return await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );
  }

  // ================= UPLOAD IMAGE =================
  Future<String?> uploadImage(XFile image) async {
    try {
      final fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${image.name}';
      final filePath = 'uploads/$fileName';

      if (kIsWeb) {
        final bytes = await image.readAsBytes();
        await _supabase.storage
            .from(_bucketName)
            .uploadBinary(filePath, bytes);
      } else {
        final file = File(image.path);
        await _supabase.storage.from(_bucketName).upload(filePath, file);
      }

      return _supabase.storage.from(_bucketName).getPublicUrl(filePath);
    } catch (e) {
      debugPrint('Upload error: $e');
      return null;
    }
  }

  // ================= DELETE IMAGE =================
  Future<bool> deleteImage(String imageUrl) async {
    try {
      final uri = Uri.parse(imageUrl);
      final fileName = uri.pathSegments.last;
      final filePath = 'uploads/$fileName';

      await _supabase.storage.from(_bucketName).remove([filePath]);
      return true;
    } catch (e) {
      debugPrint('Delete error: $e');
      return false;
    }
  }
}
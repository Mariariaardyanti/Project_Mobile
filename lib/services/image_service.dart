import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class ImageService {
  final _supabase = Supabase.instance.client;
  final _bucketName = 'Board';
  final _picker = ImagePicker();

  //upload image
   Future<String?> uploadImage(XFile image) async {
    try {
      final fileName = '${DateTime.now().millisecondsSinceEpoch}_${image.name}';
      final filePath = 'uploads/$fileName';

      // Upload
      if (kIsWeb) {
        final bytes = await image.readAsBytes();
        await _supabase.storage.from(_bucketName).uploadBinary(filePath, bytes);
      } else {
        final file = File(image.path);
        await _supabase.storage.from(_bucketName).upload(filePath, file);
      }

      // Get URL
      final url = _supabase.storage.from(_bucketName).getPublicUrl(filePath);
      return url;
    } catch (e) {
      debugPrint('Upload error: $e');
      return null;
    }
  }

  //delete image
  Future<bool> deleteImage(String imageUrl) async {
    try {
      // Extract path dari URL
      // Contoh URL: https://xxx.supabase.co/storage/v1/object/public/notes-images/uploads/123456.jpg
      final uri = Uri.parse(imageUrl);
      final path = uri.pathSegments.last; 
      final filePath = 'uploads/$path';

      await _supabase.storage.from(_bucketName).remove([filePath]);
      return true;
    } catch (e) {
      debugPrint('Delete error: $e');
      return false;
    }
  }

  

  }


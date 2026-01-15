import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_mobile/pages/profile/profile.dart';
import 'package:project_mobile/models/note_model.dart';
import 'package:project_mobile/services/notes_service.dart';
import 'package:project_mobile/services/image_service.dart';

class AddNotesPage extends StatefulWidget {
  final Note? note; // Null = tambah baru, ada value = edit

  const AddNotesPage({super.key, this.note});

  @override
  State<AddNotesPage> createState() => _AddNotesPageState();
}

class _AddNotesPageState extends State<AddNotesPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final NotesService _notesService = NotesService();
  final ImageService _imageService = ImageService();

  bool _isLoading = false;
  bool _isUploadingImage = false;
  bool _isPinned = false;
  bool _isArchived = false;

  // Labels
  List<String> _selectedLabels = [];
  final List<String> _availableLabels = [
    'Random Thoughts',
    'Project Updates',
    'Life',
    'Self-Growth',
    'Gratitude',
  ];

  // Images
  List<String> _imageUrls = [];

  @override
  void initState() {
    super.initState();
    // Jika mode edit, load data note
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
      _selectedLabels = List.from(widget.note!.labels);
      _imageUrls = List.from(widget.note!.imageUrls);
      _isPinned = widget.note!.isPinned;
      _isArchived = widget.note!.isArchived;
    }
  }

  // SAVE NOTE
  Future<void> _saveNote() async {
    if (_isLoading) return;
    
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();

    if (title.isEmpty || content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Title dan content wajib diisi')),
      );
      return;
    }

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('User belum login')));
      return;
    }

    setState(() => _isLoading = true);

    try {
      final note = Note(
        id: widget.note?.id ?? '', // Kosong jika tambah baru
        title: title,
        content: content,
        userId: user.uid,
        labels: _selectedLabels,
        imageUrls: _imageUrls,
        createdAt: widget.note?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
        isPinned: _isPinned,
        isArchived: _isArchived,
      );

      if (widget.note == null) {
        // Mode tambah baru
        await _notesService.addNote(note);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Catatan berhasil disimpan!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        // Mode edit
        await _notesService.updateNote(widget.note!.id, note);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Catatan berhasil diupdate!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      }

      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Gagal menyimpan: $e')));
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  // ADD IMAGE
  Future<void> _addImage() async {
    try {
      setState(() => _isUploadingImage = true);

      // Pilih sumber
      final source = await showDialog<String>(
        context: context,
        builder: (context) => SimpleDialog(
          title: const Text('Pilih Sumber'),
          children: [
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 'gallery'),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Icon(Icons.photo_library),
                    SizedBox(width: 16),
                    Text('Gallery'),
                  ],
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 'camera'),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Icon(Icons.camera_alt),
                    SizedBox(width: 16),
                    Text('Camera'),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

      if (source == null) {
        setState(() => _isUploadingImage = false);
        return;
      }

      // Pick image
      XFile? image;
      if (source == 'gallery') {
        image = await _imageService.pickFromGallery();
      } else {
        image = await _imageService.pickFromCamera();
      }

      if (image == null) {
        setState(() => _isUploadingImage = false);
        return;
      }

      // Upload ke Supabase
      final imageUrl = await _imageService.uploadImage(image);

      if (imageUrl != null) {
        setState(() {
          _imageUrls.add(imageUrl);
          _isUploadingImage = false;
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Gambar berhasil diupload!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        setState(() => _isUploadingImage = false);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Upload gagal!'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      setState(() => _isUploadingImage = false);
      debugPrint('Error: $e');
    }
  }

  // REMOVE IMAGE
  Future<void> _removeImage(int index) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Gambar?'),
        content: const Text('Gambar akan dihapus dari catatan ini.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      final imageUrl = _imageUrls[index];
      final deleted = await _imageService.deleteImage(imageUrl);

      if (deleted) {
        setState(() => _imageUrls.removeAt(index));
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Gambar dihapus')));
        }
      }
    }
  }

  // DELETE NOTE
  Future<void> _deleteNote() async {
    if (widget.note == null) return;

    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Catatan?'),
        content: const Text('Catatan akan dihapus permanen.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        // Hapus semua gambar dari Supabase
        for (var imageUrl in _imageUrls) {
          await _imageService.deleteImage(imageUrl);
        }

        // Hapus note dari Firestore
        await _notesService.deleteNote(widget.note!.id);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Catatan berhasil dihapus')),
          );
          Navigator.pop(context);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: $e')));
        }
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.note == null ? "Add notes" : "Edit notes",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.workspace_premium,
                          size: 18,
                          color: Colors.white,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Get Pro",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.notifications_none, color: Colors.black),
                  const SizedBox(width: 12),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                    child: const Icon(Icons.person_2_outlined, size: 24),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Last Edit: ${_formatTime()}",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 6),
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 6),
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE6A7),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 6),
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6F0FF),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 6),
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8FFE8),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 6),
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE8E8),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8EE),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: TextField(
                            controller: _titleController,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            decoration: const InputDecoration(
                              hintText: "Title",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                _isPinned
                                    ? Icons.push_pin
                                    : Icons.push_pin_outlined,
                                size: 18,
                                color: _isPinned ? Colors.brown : Colors.black,
                              ),
                              onPressed: () {
                                setState(() => _isPinned = !_isPinned);
                              },
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.notifications_none, size: 18),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: Icon(
                                _isArchived
                                    ? Icons.archive
                                    : Icons.archive_outlined,
                                size: 18,
                                color: _isArchived
                                    ? Colors.brown
                                    : Colors.black,
                              ),
                              onPressed: () {
                                setState(() => _isArchived = !_isArchived);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Show uploaded images
                    if (_imageUrls.isNotEmpty) ...[
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _imageUrls.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 12),
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      image: NetworkImage(_imageUrls[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 4,
                                  right: 16,
                                  child: GestureDetector(
                                    onTap: () => _removeImage(index),
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],

                    // Loading indicator saat upload
                    if (_isUploadingImage)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                      ),

                    Expanded(
                      child: TextField(
                        controller: _contentController,
                        decoration: const InputDecoration(
                          hintText: "Type your note",
                          border: InputBorder.none,
                        ),
                        maxLines: null,
                        expands: true,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            PopupMenuButton(
                              icon: const Icon(Icons.add_box_outlined),
                              offset: const Offset(0, -160),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              onSelected: (value) {
                                if (value == 'image') {
                                  _addImage();
                                }
                              },
                              itemBuilder: (context) => const [
                                PopupMenuItem(
                                  value: 'checkbox',
                                  child: Row(
                                    children: [
                                      Icon(Icons.check_box_outlined, size: 18),
                                      SizedBox(width: 10),
                                      Text("Checkboxes"),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'image',
                                  child: Row(
                                    children: [
                                      Icon(Icons.image_outlined, size: 18),
                                      SizedBox(width: 10),
                                      Text("Add image"),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'drawing',
                                  child: Row(
                                    children: [
                                      Icon(Icons.brush_outlined, size: 18),
                                      SizedBox(width: 10),
                                      Text("Drawing"),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'recording',
                                  child: Row(
                                    children: [
                                      Icon(Icons.mic_none, size: 18),
                                      SizedBox(width: 10),
                                      Text("Recording"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 12),
                            const Icon(Icons.text_fields),
                            const SizedBox(width: 12),
                            PopupMenuButton(
                              icon: const Icon(Icons.more_vert),
                              offset: const Offset(0, -170),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              onSelected: (value) {
                                if (value == 'delete') {
                                  _deleteNote();
                                }
                              },
                              itemBuilder: (context) => const [
                                PopupMenuItem(
                                  value: 'delete',
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete_outline, size: 18),
                                      SizedBox(width: 10),
                                      Text("Delete"),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'copy',
                                  child: Row(
                                    children: [
                                      Icon(Icons.copy_outlined, size: 18),
                                      SizedBox(width: 10),
                                      Text("Make a copy"),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'send',
                                  child: Row(
                                    children: [
                                      Icon(Icons.send_outlined, size: 18),
                                      SizedBox(width: 10),
                                      Text("Send"),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'collaborator',
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.person_add_alt_1_outlined,
                                        size: 18,
                                      ),
                                      SizedBox(width: 10),
                                      Text("Collaborator"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 12),
                            PopupMenuButton(
                              offset: const Offset(0, -250),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFF1D6),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: const Row(
                                  children: [
                                    Text(
                                      "Labels",
                                      style: TextStyle(fontSize: 11),
                                    ),
                                    SizedBox(width: 2),
                                    Icon(Icons.keyboard_arrow_down, size: 14),
                                  ],
                                ),
                              ),
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                  enabled: false,
                                  height: 28,
                                  child: Text(
                                    "Labels",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                ..._availableLabels.map((label) {
                                  final isSelected = _selectedLabels.contains(
                                    label,
                                  );
                                  return PopupMenuItem(
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          _selectedLabels.remove(label);
                                        } else {
                                          _selectedLabels.add(label);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          label,
                                          style: const TextStyle(fontSize: 11),
                                        ),
                                        Checkbox(
                                          value: isSelected,
                                          onChanged: null,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: _isLoading ? null : _saveNote,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8B6B2E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: _isLoading
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  "Save",
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime() {
    final now = DateTime.now();
    final hour = now.hour > 12 ? now.hour - 12 : now.hour;
    final period = now.hour >= 12 ? 'pm' : 'am';
    return '${hour.toString().padLeft(2, '0')}.${now.minute.toString().padLeft(2, '0')} $period';
  }
}

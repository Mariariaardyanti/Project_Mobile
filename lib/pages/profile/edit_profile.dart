import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfile extends StatefulWidget {
  final Map<String, dynamic> userData;

  const EditProfile({super.key, required this.userData});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _teamController = TextEditingController();
  final _roleInTeamController = TextEditingController();

  bool _isLoading = false;
  fb.User? user;
  String? _selectedRole;
  final List<String> _roles = ['users'];

  @override
  void initState() {
    super.initState();
    user = fb.FirebaseAuth.instance.currentUser;

    _nameController.text = widget.userData['name'] ?? '';
    _emailController.text = widget.userData['email'] ?? '';
    _teamController.text = widget.userData['team'] ?? '';
    _roleInTeamController.text = widget.userData['roleInTeam'] ?? '';
    _selectedRole = widget.userData['role'] ?? 'users';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _teamController.dispose();
    _roleInTeamController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        // Update Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .update({
              'name': _nameController.text.trim(),
              'team': _teamController.text.trim(),
              'roleInTeam': _roleInTeamController.text.trim(),
              'role': _selectedRole,
              // Note: email dan photoUrl tidak diupdate di sini
            });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile updated!'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context, true); // Return true to indicate success
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
          );
        }
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
  }
}

import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final List<String> notifications;

  const NotificationPage({
    super.key,
    required this.notifications,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: notifications.isEmpty
        ? const Center(
            child: Text("Belum ada notifikasi"),
          )

    );
  }
}

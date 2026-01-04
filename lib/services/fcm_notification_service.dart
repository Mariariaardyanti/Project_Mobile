import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FCMNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> init({
    required Function(String message) onMessageReceived,
  }) async {

    NotificationSettings settings =
        await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (kDebugMode) {
      print('🔔 Notification permission: ${settings.authorizationStatus}');
    }

    String? token = await _firebaseMessaging.getToken();
    if (kDebugMode) {
      print('📱 FCM Token: $token');
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('📩 Notifikasi masuk (foreground)');
        print('Title: ${message.notification?.title}');
        print('Body: ${message.notification?.body}');
      }

      final notificationBody =
          message.notification?.body ?? 'Notifikasi tanpa pesan';

      onMessageReceived(notificationBody);
    });
    
  }
}
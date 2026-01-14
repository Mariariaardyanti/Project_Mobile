import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
    FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel channel =
      AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  static Future<void> initialize() async {
  }
}
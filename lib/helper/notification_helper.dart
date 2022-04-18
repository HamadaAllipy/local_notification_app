import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {

  static final FlutterLocalNotificationsPlugin _notification = FlutterLocalNotificationsPlugin();
  static const InitializationSettings _initializationSettings = InitializationSettings(
    iOS: IOSInitializationSettings(),
    android: AndroidInitializationSettings('@mipmap/ic_launcher',),
  );
  static void sendNotification({required String title, required String body}) {
    _notification.initialize(_initializationSettings);
    _notification.show(0, title, body, const NotificationDetails(
      android: AndroidNotificationDetails('channelId', 'channelName'),
    ));
  }
}
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin _notification =
      FlutterLocalNotificationsPlugin();

  static final BehaviorSubject onNotification = BehaviorSubject<String?>();

  static initNotification() async {
    /// android
    const AndroidInitializationSettings androidSetting =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    /// ios
    const IOSInitializationSettings iosSetting = IOSInitializationSettings();

    /// setting
    const InitializationSettings settings = InitializationSettings(
      android: androidSetting,
      iOS: iosSetting,
    );

    /// initialize
    await _notification.initialize(
      settings,
      onSelectNotification: (payload){
        onNotification.add(payload);
      },
    );
  }

  static showNotification({String? title, String? body}) async {
    _notification.show(
      0,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName'),
        iOS: IOSNotificationDetails(),
      ),
      payload: 'hamada.abs',
    );
  }
}

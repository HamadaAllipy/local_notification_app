import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

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
      onSelectNotification: (payload) {
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

  static showScheduledNotification({
    String? title,
    String? body,
    required DateTime scheduleDate,
  }) async {
    tz.initializeTimeZones();
    _notification.zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.from(scheduleDate, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName'),
        iOS: IOSNotificationDetails(),
      ),
      payload: 'hamada.abs',
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
  static showScheduledNotificationDaily({
    String? title,
    String? body,
  }) async {
    tz.initializeTimeZones();
    _notification.periodicallyShow(
      0,
      title,
      body,
      RepeatInterval.daily,
      const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName'),
        iOS: IOSNotificationDetails(),
      ),
      payload: 'hamada.abs',
      androidAllowWhileIdle: true,
    );
  }
}

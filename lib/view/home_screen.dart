import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../helper/notification_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                NotificationHelper.sendNotification(title: 'title', body: 'body');
              },
              child: const Text(
                'Simple Notification',
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Scheduled notification',
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Remove notification',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendNotification({
    String? title,
    String? body,
  }) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const InitializationSettings initializationSettings =
        InitializationSettings(
            iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      const NotificationDetails(),
    );
  }
}

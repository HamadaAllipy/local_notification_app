import 'package:flutter/material.dart';
import 'package:local_notifications/helper/notification_helper.dart';
import 'package:local_notifications/view/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    NotificationHelper.initNotification();
    listenNotification();
    super.initState();
  }

  listenNotification() {
    NotificationHelper.onNotification.stream.listen(onClickedNotification);
  }

  void onClickedNotification(payload) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return SecondScreen(
            pay: payload,
          );
        },
      ),
    );
  }

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
                NotificationHelper.showNotification(
                  title: 'title',
                  body: 'body',
                );
              },
              child: const Text(
                'Simple Notification',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                NotificationHelper.showScheduledNotification(
                  scheduleDate: DateTime.now().add(const Duration(seconds: 5)),
                );
                const snackBar =  SnackBar(
                  content: Text(
                    'Scheduled in 5 seconds',
                  ),
                );
                ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(snackBar);
              },
              child: const Text(
                'Scheduled notification',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                NotificationHelper.showScheduledNotificationDaily();
              },
              child: const Text(
                'Periodically Show',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                NotificationHelper.showScheduledNotificationSpecificTime();
              },
              child: const Text(
                'showScheduledNotificationSpecificTime',
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
}

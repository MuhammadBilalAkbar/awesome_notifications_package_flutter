import 'package:flutter/material.dart';

import 'package:awesome_notifications/awesome_notifications.dart';

import '/widgets/notification_button.dart';
import '/services/notification_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    NotificationService.setListeners(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Colors.grey[200]!,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NotificationButton(
                  text: 'Normal Notification',
                  onPressed: () async =>
                      await NotificationService.showNotification(
                    title: 'Title of the notification',
                    body: 'Body of the notification',
                  ),
                ),
                NotificationButton(
                  text: 'Notification With Summary',
                  onPressed: () async =>
                      await NotificationService.showNotification(
                    title: 'Title of the notification',
                    body: 'Body of the notification',
                    summary: 'Small summary',
                    notificationLayout: NotificationLayout.Inbox,
                  ),
                ),
                NotificationButton(
                  text: 'Progress Bar Notification',
                  onPressed: () async =>
                      await NotificationService.showNotification(
                    title: 'Title of the notification',
                    body: 'Body of the notification',
                    summary: 'Small summary',
                    notificationLayout: NotificationLayout.ProgressBar,
                  ),
                ),
                NotificationButton(
                  text: 'Message Notification',
                  onPressed: () async =>
                      await NotificationService.showNotification(
                    title: 'Title of the notification',
                    body: 'Body of the notification',
                    summary: 'Small summary',
                    notificationLayout: NotificationLayout.Messaging,
                  ),
                ),
                NotificationButton(
                  text: 'Big Image Notification',
                  onPressed: () async =>
                      await NotificationService.showNotification(
                    title: 'Title of the notification',
                    body: 'Body of the notification',
                    summary: 'Small summary',
                    notificationLayout: NotificationLayout.BigPicture,
                    bigPicture:
                        'https://files.tecnoblog.net/wp-content/uploads/2019/09/emoji.jpg',
                  ),
                ),
                NotificationButton(
                  text: 'Action Buttons Notification',
                  onPressed: () async =>
                      await NotificationService.showNotification(
                    title: 'Title of the notification',
                    body: 'Body of the notification',
                    summary: 'Small summary',
                    payload: {'navigate': 'true'},
                    actionButtons: [
                      NotificationActionButton(
                        key: 'navigate',
                        label: 'Check it out',
                        actionType: ActionType.SilentAction,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
                NotificationButton(
                  text: 'Scheduled Notification',
                  onPressed: () async =>
                      await NotificationService.showNotification(
                    title: 'Scheduled Notification',
                    body: 'Notification was fired after 5 seconds',
                    scheduled: true,
                    interval: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesome_notifications_package_flutter/screens/notification_screen.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static Future<void> initializeNotification(BuildContext context) async {
    await AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      // 'resource://drawable/res_app_icon',
      null,
      [
        NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          onlyAlertOnce: true,
          playSound: true,
          criticalAlerts: true,
          locked: true,
          enableLights: true,
        )
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'basic_channel_group',
          channelGroupName: 'Basic group',
        ),
      ],
      debug: true,
    );

    await AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) async {
        if (!isAllowed) {
          await AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );

    await AwesomeNotifications().setListeners(
      onNotificationCreatedMethod: (_) async =>
          debugPrint('onNotificationCreatedMethod'),
      onNotificationDisplayedMethod: (_) async =>
          debugPrint('onNotificationDisplayedMethod'),
      onDismissActionReceivedMethod: (_) async =>
          debugPrint('onDismissActionReceivedMethod'),
      onActionReceivedMethod: (receivedAction) async {
        debugPrint('onActionReceivedMethod');
        final payload = receivedAction.payload ?? {};
        if (payload['navigate'] == 'true') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const NotificationScreen(),
            ),
          );
        }
      },
    );
  }

  static Future<void> showNotification({
    required final String title,
    required final String body,
    final actionType = ActionType.Default,
    final notificationLayout = NotificationLayout.Default,
    final bool scheduled = false,
    final String? summary,
    final Map<String, String>? payload,
    final NotificationCategory? category,
    final String? bigPicture,
    final List<NotificationActionButton>? actionButtons,
    final int? interval,
  }) async {
    assert(!scheduled || (scheduled && interval != null));

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: 'basic_channel',
        title: title,
        body: body,
        actionType: actionType,
        notificationLayout: notificationLayout,
        summary: summary,
        category: category,
        payload: payload,
        bigPicture: bigPicture,
      ),
      actionButtons: actionButtons,
      schedule: scheduled
          ? NotificationInterval(
              interval: interval,
              timeZone:
                  await AwesomeNotifications().getLocalTimeZoneIdentifier(),
              preciseAlarm: true,
            )
          : null,
    );
  }
}

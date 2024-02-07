import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    try {
      print("Initializing notifications...");

      AndroidInitializationSettings initializationSettingsAndroid =
          const AndroidInitializationSettings('flutter_logo');

      var initializationSettingsIOS = DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
          onDidReceiveLocalNotification:
              (int id, String? title, String? body, String? payload) async {});

      var initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS);

      await notificationsPlugin.initialize(initializationSettings,
          onDidReceiveNotificationResponse:
              (NotificationResponse notificationResponse) async {});
    } catch (e) {
      print('Error in initNotification: $e');
    }
  }

  notificationDetails() {
    try {
      print("Generating notification details...");
      return const NotificationDetails(
          android: AndroidNotificationDetails('channelId', 'channelName',
              importance: Importance.max),
          iOS: DarwinNotificationDetails());
    } catch (e) {
      print("Error in notificationDetails: $e");
    }
  }

  Future<void> showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    try {
      print("Showing notification...");
      var details = await notificationDetails();
      if (details != null) {
        return notificationsPlugin.show(id, title, body, details);
      } else {
        print("Notification details are null");
      }
    } catch (e) {
      print("Error in showNotification: $e");
    }
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'notification.dart';

class FirebaseMsg {
  Future<void> initFCM() async {

    // Listen to foreground messages
    FirebaseMessaging.onMessage.listen(handleForegroundNotification);

    // Listen to messages when app is opened from notification
    FirebaseMessaging.onMessageOpenedApp.listen(handleNotification);

    // Handle initial message (when app is opened from terminated state)
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        handleNotification(message);
      }
    });

    // NOTE: Background handler is registered in main.dart
  }
}

// Handle foreground messages (when app is active)
Future<void> handleForegroundNotification(RemoteMessage message) async {
  print("📱 Foreground message received: ${message.messageId}");

  final storage = FlutterSecureStorage();
  final isLoggedIn = await storage.read(key: 'isLoggedIn');

  if (isLoggedIn != 'true') {
    print("🔕 Skipping notification: user not logged in");
    return;
  }

  final title = message.notification?.title ?? message.data['title'];
  final body = message.notification?.body ?? message.data['body'];

  if (title != null && body != null) {
    await flutterLocalNotificationsPlugin.show(
      message.messageId.hashCode,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'default_channel',
          'Default',
          channelDescription: 'Default notification channel',
          importance: Importance.max,
          priority: Priority.high,
          showWhen: true,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
    );
  }
}

// Background message handler (must be top-level function)
@pragma('vm:entry-point')
Future<void> handleNotification(RemoteMessage message) async {
  print("🔔 Background message received: ${message.messageId}");

  // Initialize Firebase for background context
  await Firebase.initializeApp();

  const AndroidInitializationSettings androidSettings =
  AndroidInitializationSettings('@mipmap/ic_launcher');
  const DarwinInitializationSettings iosSettings = DarwinInitializationSettings();
  const InitializationSettings initSettings =
  InitializationSettings(android: androidSettings, iOS: iosSettings);

  await flutterLocalNotificationsPlugin.initialize(initSettings);

  final storage = FlutterSecureStorage();
  final isLoggedIn = await storage.read(key: 'isLoggedIn');

  if (isLoggedIn != 'true') {
    print("🔕 Skipping notification: user not logged in");
    return;
  }

  final title = message.notification?.title ?? message.data['title'];
  final body = message.notification?.body ?? message.data['body'];

  print("📝 Title: $title, Body: $body");

  if (title != null && body != null) {
    await flutterLocalNotificationsPlugin.show(
      message.messageId?.hashCode ?? title.hashCode,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'default_channel',
          'Default',
          channelDescription: 'Default notification channel',
          importance: Importance.max,
          priority: Priority.high,
          showWhen: true,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
    );
  }
}
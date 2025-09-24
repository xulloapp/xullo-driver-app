import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/features/notification/presentation/controller/state/notification_state.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../presentation/controller/notification_provider.dart';

class NotificationPermissionService {
  static const storage = FlutterSecureStorage();

  static Future<void> checkAndUpdatePermissionStatus(WidgetRef ref) async {
    try {
      final status = await Permission.notification.status;
      final storedPermission = await storage.read(key: 'notification-permission');

      // If permission is granted but we haven't stored it yet, or if it was previously denied
      if (status.isGranted && (storedPermission == null || storedPermission == 'false')) {

        // Get FCM token and update API
        final msgService = FirebaseMessaging.instance;
        final token = await msgService.getToken();

        if (token != null) {
          await ref
              .read(notificationNotifierProvider.notifier)
              .update(token);
        }
      }
      // If permission is denied but we have it stored as granted
      else if (!status.isGranted && storedPermission == 'true') {
        await storage.write(key: 'notification-permission', value: 'false');
      }

      // Set up a listener to respond to state changes
      listenToNotificationState(ref);
    } catch (e) {
      print('Error checking notification permission: $e');
    }
  }

  static void listenToNotificationState(WidgetRef ref) {
    ref.listen(notificationNotifierProvider, (previous, next) {
      next.when(
        sucess: () async {
          await storage.write(key: 'notification-permission', value: 'true');
        },
        initial: () {},
        loading: () {},
        error: (error) {},
      );
    });
  }
}

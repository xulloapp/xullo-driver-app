import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/core/configs/router-configs/router_name.dart';
import 'package:xullo/core/widgets/app_button.dart'; // Assuming this is your custom button widget
import 'package:xullo/features/notification/presentation/controller/state/notification_state.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../controller/notification_provider.dart';

class NotificationPermissionScreen extends StatefulHookConsumerWidget {
  const NotificationPermissionScreen({super.key});

  @override
  NotificationPermissionScreenState createState() => NotificationPermissionScreenState();
}

class NotificationPermissionScreenState extends ConsumerState<NotificationPermissionScreen> with WidgetsBindingObserver{
  static const storage = FlutterSecureStorage();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // 🔄 Called when app resumes from background (like returning from settings)
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      final status = await Permission.notification.status;
      if (status.isGranted) {
        await storage.write(
          key: 'notification-permission',
          value: true.toString(),
        );
        final msgService = FirebaseMessaging.instance;
        var token =await msgService.getToken();
        await ref
            .read(notificationNotifierProvider.notifier)
            .update(token!);
      }
    }
  }

  void _requestPermission(BuildContext context) async {
    final msgService = FirebaseMessaging.instance;
    final status = await msgService.requestPermission();
    if(status.authorizationStatus == AuthorizationStatus.authorized ||
        status.authorizationStatus == AuthorizationStatus.provisional){
      await storage.write(key: 'notification-permission',value: true.toString());
      var token =await msgService.getToken();
      await ref
          .read(notificationNotifierProvider.notifier)
          .update(token!);
    }
    final notificationStatus = await Permission.notification.status;
    if(notificationStatus.isPermanentlyDenied){
      await openAppSettings();
    }
  }

  void _cancelPermission(BuildContext context) async {
    await storage.write(key: 'notification-permission',value: true.toString());
    context.goNamed(RouteNames.dashboard);
  }

  @override
  Widget build(BuildContext context) {

    ref.listen(notificationNotifierProvider, (prev, next) {
      next.when(
        sucess: (){
          context.goNamed(RouteNames.dashboard);
        },
        initial: () {  },
        loading: () {  },
        error: (CustomError message) {  },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Permission'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2,),
            const Text(
              'We need your permission to send notifications.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 4,),
            AppButton(
              text: 'Allow Notifications',
              onPressed: () => _requestPermission(context),
            ),
            SizedBox(height: 16,),
            AppButton(
              text: 'cancel',
              backgroundColor: Theme.of(context).colorScheme.secondary,
              textColor: Theme.of(context).colorScheme.primary,
              onPressed: () => _cancelPermission(context),
            ),
          ],
        ),
      ),
    );
  }
}

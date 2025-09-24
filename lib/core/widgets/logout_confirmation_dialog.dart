

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/auth/presentation/controller/auth/auth_provider.dart';

Future<void> showLogoutConfirmationDialog(
    BuildContext context, WidgetRef ref) async {
  Future<void> signOut(BuildContext context, WidgetRef ref) async {
    await ref.read(authNotifierProvider.notifier).signOut();
  }

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Logout"),
      content: const Text("Are you sure you want to logout?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
            await FlutterSecureStorage().write(key: 'isLoggedIn', value: 'false');
            signOut(context, ref);
          },
          child: const Text("Logout",style: TextStyle(color: Colors.red),),
        ),

      ],
    ),
  );
}

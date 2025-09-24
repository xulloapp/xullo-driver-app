import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/configs/router-configs/router_name.dart';
import 'auth/presentation/controller/auth/auth_provider.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 2)).then((_) {
        if (!context.mounted) {
          return;
        }
        _getCurrentUser(ref, context);
      });
      return null;
    }, []);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/icon/logo-white.png",height: 128,width: 128),
            const SizedBox(height: 24),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  void _getCurrentUser(WidgetRef ref, BuildContext context) async {
    final user = await ref.read(authNotifierProvider.notifier).getCurrentUser();
    const storage = FlutterSecureStorage();
    if (!context.mounted) {
      return;
    }

    if (user != null) {
      context.goNamed(RouteNames.pin);
      return;
    }

    context.goNamed(RouteNames.signIn);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:xullo/features/pin/presentation/controller/state/pin_state.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/configs/router-configs/router_name.dart';
import '../controller/pin_provider.dart';

class PinScreen extends ConsumerStatefulWidget {
  const PinScreen({super.key});

  @override
  ConsumerState<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends ConsumerState<PinScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    ref.listen(pinNotifierProvider, (previous, next) {
      next.when(
        success: () {
          ref.read(pinVerifiedProvider.notifier).state = true;

          final pendingRedirect = ref.read(pendingRedirectProvider);
          if (pendingRedirect != null) {
            // Reset state
            ref.read(pendingRedirectProvider.notifier).state = null;
            context.go(pendingRedirect);
          } else {
            context.go(RouteNames.dashboard);
          }
        },
        error: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.message)),
          );
          controller.clear();
        },
          initial: () {
          return const SizedBox.shrink();
      }, loading: () { return const CircularProgressIndicator(); }
      );
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Enter Pin',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Text(
                "Please enter your 4-digit PIN to continue",
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Pinput(
                  controller: controller,
                  length: 6,
                  onCompleted: _onCompleted,
                  obscureText: true,
                  autofocus: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onCompleted(String value) async {
    await ref.read(pinNotifierProvider.notifier).verifyPin(value);

  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/core/configs/router-configs/router_name.dart';
import 'package:xullo/features/auth/presentation/controller/auth/state/auth_state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../features/auth/presentation/controller/auth/auth_provider.dart';
import 'logout_confirmation_dialog.dart';
import 'custom_drawer_tile.dart';

class CustomDrawer extends HookConsumerWidget {
  final int selectedIndex;
  final List<NavigationDestination> destinations;
  final void Function(int) onTabTapped;
  const CustomDrawer({
    super.key,
    required this.selectedIndex,
    required this.destinations,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(authNotifierProvider);
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            SizedBox(height: 42),
            Row(
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        8,
                      ), // Optional: Add border radius if needed
                      child: SizedBox(
                        height: 84,
                        width: 128,
                        child: Image.asset(
                          "assets/icon/logo-white.png",
                          fit: BoxFit.cover, // Ensures the image fills the box
                        ),
                      ),
                    ),
                    userAsync.maybeWhen(
                      orElse: () {
                        return const SizedBox.shrink();
                      },
                      success: (user) {
                        return Center(child: Text(user.email));
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Divider(color: Theme.of(context).colorScheme.secondary),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 8),
                children: List.generate(destinations.length, (index) {
                  final destination = destinations[index];
                  final selected = selectedIndex == index;
                  return CustomDrawerTile(
                    icon: destination.icon,
                    title: destination.label,
                    selected: selected,
                    onTap: () {
                      onTabTapped(index);
                      Navigator.pop(context);
                    },
                  );
                }),
              ),
            ),
            CustomDrawerTile(
              icon: Icon(Icons.support_agent_outlined),
              title: "Customer Support",
              selected: false,
              onTap: () async {
                await launchUrl(
                  Uri.parse('https://xullo.co.nz'),
                  mode: LaunchMode.externalApplication,
                );
                Navigator.pop(context);
              },
            ),
            // Logout button at the bottom
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              leading: Icon(
                Icons.power_settings_new,
                color: Theme.of(context).colorScheme.error,
              ),
              title: Text(
                'Logout',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              onTap: () => showLogoutConfirmationDialog(context, ref),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

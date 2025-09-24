import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/core/widgets/custom_drawer.dart';
import 'package:xullo/core/widgets/logout_confirmation_dialog.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  void onTabTapped(int index) {
    navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final selectedIndex = navigationShell.currentIndex;


    final destinations = const [
      NavigationDestination(
        icon: Icon(Icons.home_outlined,),
        label: 'Dashboard',
      ),
      NavigationDestination(
        icon: Icon(Icons.notes_outlined),
        selectedIcon: Icon(Icons.notes),
        label: 'Trips',
      ),
      NavigationDestination(
        icon: Icon(Icons.car_repair_outlined),
        selectedIcon: Icon(Icons.car_repair),
        label: 'Vehicles',
      ),
      NavigationDestination(
        icon: Icon(Icons.apartment_outlined),
        selectedIcon: Icon(Icons.apartment),
        label: 'Companies',
      ),
      NavigationDestination(
        icon: Icon(Icons.credit_card_outlined),
        selectedIcon: Icon(Icons.credit_card),
        label: 'License',
      ),
      NavigationDestination(
        icon: Icon(Icons.person_outline),
        selectedIcon: Icon(Icons.person),
        label: 'Profile',
      ),
      NavigationDestination(
        icon: Icon(Icons.policy_outlined),
        selectedIcon: Icon(Icons.policy),
        label: 'Enforcement',
      ),
      NavigationDestination(
        icon: Icon(Icons.policy_outlined),
        selectedIcon: Icon(Icons.policy),
        label: 'Violation',
      ),

    ];

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(destinations[selectedIndex].label)),
        actions: [IconButton(onPressed: () => showLogoutConfirmationDialog(context, ref),icon: Icon(Icons.power_settings_new),)],
      ),
      drawer: CustomDrawer(
        selectedIndex : selectedIndex,
        destinations: destinations,
        onTabTapped: onTabTapped,
      ),
      body: navigationShell,
    );
  }
}

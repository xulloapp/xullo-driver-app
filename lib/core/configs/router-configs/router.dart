

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:xullo/core/configs/router-configs/router_name.dart';
import 'package:xullo/features/auth/presentation/controller/auth/auth_provider.dart';
import 'package:xullo/features/auth/presentation/controller/auth/state/auth_state.dart';
import 'package:xullo/features/enforcement/presentation/screen/enforcement_screen.dart';
import 'package:xullo/features/forget-password/presentation/screen/forget_password_screen.dart';
import 'package:xullo/features/license/presentation/screen/license_screen.dart';
import 'package:xullo/features/log/domain/entities/log.dart';
import 'package:xullo/features/log/presentation/screen/components/form_page_1.dart';
import 'package:xullo/features/log/presentation/screen/components/form_page_2.dart';
import 'package:xullo/features/log/presentation/screen/components/form_page_3.dart';
import 'package:xullo/features/pin/presentation/screen/pin_screen.dart';
import 'package:xullo/features/company/presentation/screens/company_screen.dart';
import 'package:xullo/features/sample/sample.dart';
import 'package:xullo/features/trip/presentation/screen/trip_screen.dart';
import 'package:xullo/features/vehicle/presentation/screens/vehicle_screen.dart';
import 'package:xullo/features/violation/presentation/screens/violation_screen.dart';

import '../../../features/auth/presentation/screens/sign_in_screen.dart';
import '../../../features/auth/presentation/screens/sign_up_screen.dart';
import '../../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../../features/log/presentation/screen/components/log_form_screen.dart';
import '../../../features/log/presentation/screen/log_screen.dart';
import '../../../features/main_screen.dart';
import '../../../features/notification/presentation/screen/notificationpermission_screen.dart';
import '../../../features/pin/presentation/controller/pin_provider.dart';
import '../../../features/profile/presentation/screens/profile_screen.dart';
import '../../../features/splash_screen.dart';
import '../../../features/trip/presentation/screen/components/trip_log_screen.dart';
import '../../helpers/index.dart';

part 'redirection.dart';
part 'refresh_listener.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: RouteNames.splash,
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text("page not found"),
      ),
    ),
    redirect: (context, state) {
      final redirect = handleRedirect(context, state,ref);
      return redirect;
    },
    refreshListenable: _refreshListener(ref),
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          name: RouteNames.splash,
          path: RouteNames.splash,
          builder: (context, state) {
            return const SplashScreen();
          }),
      GoRoute(
          name: RouteNames.signUp,
          path: RouteNames.signUp,
          builder: (context, state) => const SignUpScreen()),
      GoRoute(
          name: RouteNames.notificationPermission,
          path: RouteNames.notificationPermission,
          builder: (context, state) => const NotificationPermissionScreen()),
      GoRoute(
          name: RouteNames.signIn,
          path: RouteNames.signIn,
          builder: (context, state) => const SignInScreen()),
      GoRoute(
          name: RouteNames.pin,
          path: RouteNames.pin,
          builder: (context, state) => const PinScreen()),
      GoRoute(
          name: RouteNames.log,
          path: RouteNames.log,
          builder: (context, state) => LogScreen( extra : state.extra as String)),
      GoRoute(
          name: RouteNames.tripLog,
          path: RouteNames.tripLog,
          builder: (context, state) => TripLogScreen( extra : state.extra as String)),
      GoRoute(
          name: RouteNames.logForm,
          path: RouteNames.logForm,
          builder: (context, state) {
            final args = state.extra as LogFormArgs;
            return LogFormScreen(
              trip_id: args.trip_id,
              uid: args.uid,
            );
          }),
      GoRoute(
          name: RouteNames.form1,
          path: RouteNames.form1,
          builder: (context, state) => const FormPage1()),
      GoRoute(
          name: RouteNames.form2,
          path: RouteNames.form2,
          builder: (context, state) => FormPage2( extra : state.extra as Log)),
      GoRoute(
          name: RouteNames.form3,
          path: RouteNames.form3,
          builder: (context, state) => FormPage3( extra : state.extra as Log)),
      GoRoute(
          name: RouteNames.forget_password,
          path: RouteNames.forget_password,
          builder: (context, state) => ForgetpasswordScreen( extra : state.extra as String)),
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return MainScreen(
              navigationShell: navigationShell,
            );
          },
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                  name: RouteNames.dashboard,
                  path: RouteNames.dashboard,
                  builder: (context, state) => const DashboardScreen()),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  name: RouteNames.trip,
                  path: RouteNames.trip,
                  builder: (context, state) => const TripScreen()),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  name: RouteNames.vehicle,
                  path: RouteNames.vehicle,
                  builder: (context, state) => const VehicleScreen()),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  name: RouteNames.company,
                  path: RouteNames.company,
                  builder: (context, state) => const CompanyScreen()),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  name: RouteNames.license,
                  path: RouteNames.license,
                  builder: (context, state) => LicenseScreen()),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  name: RouteNames.profile,
                  path: RouteNames.profile,
                  builder: (context, state) => ProfileScreen()),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  name: RouteNames.enforcement,
                  path: RouteNames.enforcement,
                  builder: (context, state) => EnforcementScreen()),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  name: RouteNames.violation,
                  path: RouteNames.violation,
                  builder: (context, state) => ViolationScreen()),
            ])
          ]),
    ]);
});
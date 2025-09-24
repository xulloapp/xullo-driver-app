import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/core/configs/router-configs/router_name.dart';
import 'package:xullo/core/helpers/index.dart';
import 'package:xullo/features/auth/presentation/controller/auth/state/auth_state.dart';
import 'package:xullo/features/dashboard/presentation/controller/state/dashboard_state.dart';
import 'package:xullo/features/dashboard/presentation/screens/components/timehelper.dart';
import 'package:xullo/features/trip/domain/entities/trip.dart';
import 'package:timezone/timezone.dart' as tz;
import '../../../../core/handlers/error-handler/error_handler.dart';
import '../../../auth/presentation/controller/auth/auth_provider.dart';
import '../../../notification/domain/services/notification_service.dart';
import '../controller/dashboard_provider.dart';

class DashboardScreen extends StatefulHookConsumerWidget {
  const DashboardScreen({super.key});

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends ConsumerState<DashboardScreen> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Check permission status when dashboard loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      NotificationPermissionService.checkAndUpdatePermissionStatus(ref);
    });
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Check permission status when app resumes
      NotificationPermissionService.checkAndUpdatePermissionStatus(ref);
    }
  }


  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(authNotifierProvider);
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final padding = 20.0;
    final boxSpacing = 16.0;
    final totalPadding = padding * 2 + boxSpacing;
    final boxWidth = (screenWidth - totalPadding) / 2;
    final List<String> messages = [
      "Welcome back, {name} - your logbook’s tuned up for today’s journey.",
      "Hey {name}, your driving records are ready to check.",
      "Kia ora, {name}! Your logbook’s loaded.",
      "Engine’s on, {name}? Let’s go!",
      "Ready when you are, {name}",
      "{name}, your dashboard for today is ready.",
      "Cruise mode on, {name}",
      "All set, {name} - your logbook’s prepped and waiting for today’s trip."
    ];
    final runningTrip = useState<Trip?>(null);
    final isLoading = useState(true);

    final dashboardData = useState<Object>({});
    final isDashboardLoading = useState(true);

    final welcomeMessage = useState<String?>(null);


    useEffect(() {
      // Set the welcome message only once on initial load
      final random = Random();
      final message = messages[random.nextInt(messages.length)];
      welcomeMessage.value = message;
      Future.microtask(() =>
          ref.read(dashboardNotifierProvider.notifier).checkCurrentTrip());
      Future.microtask(() =>
          ref.read(dashboardNotifierProvider.notifier).dashboard());
      return null;
    }, []);

    ref.listen(dashboardNotifierProvider, (prev, next) {
      next.when(
          error: (error) {
            isLoading.value = false;
          },
          success: (trip) {
            runningTrip.value = trip;
            isLoading.value = false;
          },
          loading: () {
            isLoading.value = true;
          },
          initial: () {},
          dashboardLoading: () {
            isDashboardLoading.value = true;
          },
          dashboardSuccess: (Object data) {
            dashboardData.value = data;
            isDashboardLoading.value = false;
          },
          dashboardError: (CustomError message) {
            isDashboardLoading.value = false;
          });
    });


    return Scaffold(
      body: IgnorePointer(
        ignoring: isLoading.value,
        child: RefreshIndicator(
          onRefresh: () async {
            final random = Random();
            final message = messages[random.nextInt(messages.length)];
            welcomeMessage.value = message;
            await ref
                .read(dashboardNotifierProvider.notifier)
                .checkCurrentTrip();
            await ref.read(dashboardNotifierProvider.notifier).dashboard();
          },
          child: userAsync.maybeWhen(
            success: (user) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, top: 16, bottom: 16),
                      child: Text( welcomeMessage.value!.replaceAll("{name}", user.first_name),
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.start,),
                    ),
                    Divider(color: Theme
                        .of(context)
                        .colorScheme
                        .secondary,),
                    SizedBox(height: 16,),
                    Center(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Center(
                            child: Column(
                              children: [
                                // 🔵 First two boxes side-by-side
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: boxWidth,
                                      decoration: BoxDecoration(
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .primary,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 16),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text("Current Status",
                                                style: TextStyle(
                                                    fontSize: 12, color: Theme
                                                    .of(context)
                                                    .colorScheme
                                                    .inversePrimary)),
                                            SizedBox(height: 16,),
                                            Row(
                                              children: [
                                                Icon(Icons.watch_later_outlined,
                                                    size: 18, color: Theme
                                                        .of(context)
                                                        .colorScheme
                                                        .inversePrimary),
                                                SizedBox(width: 4),
                                                Text(
                                                  (dashboardData.value as Map<
                                                      dynamic,
                                                      dynamic>)['current_status'] ??
                                                      "Idle time",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Theme
                                                        .of(context)
                                                        .colorScheme
                                                        .inversePrimary,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: boxSpacing),
                                    Container(
                                      width: boxWidth,
                                      decoration: BoxDecoration(
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .secondary,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 16),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            const Text("Until End of Rest",
                                                style: TextStyle(fontSize: 12)),
                                            const SizedBox(height: 16),
                                            RestWorkCountdown(
                                                restEndIso: (dashboardData
                                                    .value as Map<
                                                    dynamic,
                                                    dynamic>)['rest'],
                                                isWorking: ((dashboardData
                                                    .value as Map<
                                                    dynamic,
                                                    dynamic>)['current_status'] ==
                                                    true))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 16),

                                // 🔵 Full width box (Cumulative Periods)
                                Container(
                                  width: screenWidth - padding * 2,
                                  decoration: BoxDecoration(
                                    color: Theme
                                        .of(context)
                                        .colorScheme
                                        .secondary,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text("Cumulative Work Period",
                                                  style: TextStyle(
                                                      fontSize: 12)),
                                              SizedBox(height: 16),
                                              Text(
                                                (dashboardData.value as Map<
                                                    dynamic,
                                                    dynamic>)['cumulative_work_period'] ??
                                                    "00:00 / 70:00",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Theme
                                                      .of(context)
                                                      .colorScheme
                                                      .primary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text("Cumulative Work Day",
                                                    style: TextStyle(
                                                        fontSize: 12)),
                                                SizedBox(height: 16),
                                                Text(
                                                  (dashboardData.value as Map<
                                                      dynamic,
                                                      dynamic>)['cumulative_work_day'] ??
                                                      "00:00 / 13:00",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Theme
                                                        .of(context)
                                                        .colorScheme
                                                        .primary,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // const SizedBox(height: 16),
                                //
                                // // 🔵 End of 24 Hour Break
                                // Container(
                                //   width: screenWidth - padding * 2,
                                //   decoration: BoxDecoration(
                                //     color: Theme.of(context).colorScheme.secondary,
                                //     borderRadius: BorderRadius.circular(6),
                                //   ),
                                //   child: Padding(
                                //     padding: const EdgeInsets.symmetric(horizontal: 16 ,vertical: 16),
                                //     child: Row(
                                //       children: [
                                //         const Expanded(
                                //           child: Text("End of 24 Hour Break", style: TextStyle(fontSize: 12), textAlign: TextAlign.start,),
                                //         ),
                                //         Text("|" , style: TextStyle(fontSize: 12 )),
                                //          Expanded(
                                //           child: Text(
                                //             (dashboardData.value as Map<dynamic, dynamic>)['end_of_24h_break'] ?? "error",
                                //             textAlign: TextAlign.center,
                                //             style: TextStyle(
                                //               fontSize: 16,
                                //               color: Theme.of(context).colorScheme.primary,
                                //             ),
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                SizedBox(height: 56,),
                                // 🔵 End of 24 Hour Break
                                ElevatedButton(
                                  onPressed: isLoading.value
                                      ? null // automatically disables button
                                      : () async {
                                    // your create log action
                                    runningTrip.value == null ? context.go(
                                        RouteNames.form1) : context.go(
                                        RouteNames.log,
                                        extra: runningTrip.value!.uid
                                            .toString());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(
                                        screenWidth - padding * 2, 100),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    backgroundColor: Theme
                                        .of(context)
                                        .colorScheme
                                        .primary,
                                    disabledBackgroundColor: Theme
                                        .of(context)
                                        .colorScheme
                                        .secondary,
                                  ),
                                  child: Text(
                                    isLoading.value
                                        ? "Log syncing, please wait"
                                        : runningTrip.value == null
                                        ? "Create Log"
                                        : "View Log",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Theme
                                          .of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
            orElse: () => const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}


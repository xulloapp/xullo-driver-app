import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/core/configs/router-configs/router_name.dart';
import 'package:xullo/features/log/domain/entities/log.dart';
import 'package:xullo/features/log/presentation/controller/state/log_state.dart';
import 'package:xullo/features/log/presentation/screen/components/buildTripCard.dart';
import 'package:xullo/features/trip/domain/entities/trip.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:timelines_plus/timelines_plus.dart';
import '../../../../../core/handlers/error-handler/error_handler.dart';
import '../../../../../core/helpers/index.dart';
import '../../../../log/presentation/controller/log_provider.dart';
import '../../../../log/presentation/screen/components/comment.dart';

class TripLogScreen extends HookConsumerWidget {
  final String extra;
  const TripLogScreen({super.key, required this.extra});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logs = useState<List<Log>>([]);
    final trip = useState<Trip?>(null);
    final isLoading = useState(true);
    final isFinishLoading = useState(false);

    useEffect(() {
      Future.microtask(() => ref.read(logNotifierProvider.notifier).getAllLogs(extra));
      return null;
    }, []);

    ref.listen(logNotifierProvider, (prev, next) {
      next.when(
          error: (error) {
            isLoading.value = false;
            isFinishLoading.value = false;
          },
          success: (data){
            trip.value = data;
            logs.value = data.logs;
            isLoading.value = false;
          },
          createForm1: (log){
          },
          createForm2: (log){
          },
          createForm3: (log){
          },
          loading:() {
            isLoading.value = true;
          },
          initial: () {  },
          loadingFullForm: () {  },
          createFullForm: (Log data) {
            logs.value = [...logs.value,data];
            isLoading.value = false;
          },
          errorFullForm: (CustomError message) {  },
          finishLog: (data) {
            context.go(RouteNames.dashboard);
            isFinishLoading.value = false;
          },
          loadingLog: () {
            isFinishLoading.value = true;
          },
          updateFullForm: (Log log) {
            final updatedList = logs.value.map((c) {
              return c.uid == log.uid ? log : c;
            }).toList();
            logs.value = updatedList;
            isLoading.value = false;
          }, comment: (Trip data) {  }, loadingComment: () {  }, errorComment: (CustomError message) {  }, loadingForm1: () {  }, loadingForm2: () {  }, loadingForm3: () {  }
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Trip details")),
        leading: IconButton(onPressed: (){
          context.pop();

        }, icon: Icon(Icons.arrow_back)),
      ),
      body: isLoading.value
          ? const Center(child: CircularProgressIndicator())
          :RefreshIndicator(
        onRefresh: () async {
          await ref.read(logNotifierProvider.notifier).getAllLogs(extra);
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            if (trip.value != null)
              buildTripCard(trip.value!, context)
            else
              const SizedBox(height: 100, child: Center(child: CircularProgressIndicator())),

            const SizedBox(height: 16),

            if (logs.value.isEmpty)
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Center(child: Text("No Trips available.")),
              )
            else
              Column(
                children: [
                  if (trip.value != null) Comment(tripId: trip.value!.uid,value: trip.value!.comment),
                  TimelineTheme(
                    data: TimelineThemeData(
                      nodePosition: 0.2,
                      indicatorPosition: 0.2,
                    ),
                    child: FixedTimeline.tileBuilder(
                      builder: TimelineTileBuilder.connectedFromStyle(
                        contentsAlign: ContentsAlign.basic,
                        itemCount: logs.value.length,

                        // left side
                        oppositeContentsBuilder: (context, index) {
                          final log = logs.value[index];
                          final prevLog = index > 0 ? logs.value[index - 1] : null;

                          String? durationText;
                          if (prevLog != null) {
                            final start = DateTime.parse(prevLog.start_date.toString());
                            final end = DateTime.parse(log.start_date.toString());
                            final diff = end.difference(start);
                            final hours = diff.inHours;
                            final minutes = diff.inMinutes % 60;
                            durationText = "${hours}h ${minutes}m";
                          }

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      formatLogTime(log.start_date.toString()),
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                    Text(
                                      formatLogDate(log.start_date.toString()),
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                                if (durationText != null)
                                  Text(
                                    durationText,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: Colors.grey),
                                  ),
                              ],
                            ),
                          );
                        },

                        // right side
                        contentsBuilder: (context, index) {
                          final log = logs.value[index];
                          return SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Card(
                                color: Theme.of(context).colorScheme.secondary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // LEFT SIDE (location, time, icon) -> WRAPS
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              log.location ?? "Unknown location",
                                              style: Theme.of(context).textTheme.titleMedium,
                                              softWrap: true,
                                              overflow: TextOverflow.visible, // allow multi-line
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              timeago.format(DateTime.parse(log.start_date.toString())),
                                              style: Theme.of(context).textTheme.bodySmall,
                                            ),
                                            const SizedBox(height: 4),
                                            log.type ? const Icon(Icons.timer) : const SizedBox.shrink(),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(width: 8),

                                      // RIGHT SIDE (fixed odometer)
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            log.odometer.toString(),
                                            style: Theme.of(context).textTheme.bodySmall,
                                          ),
                                          Text(
                                            "Km",
                                            style: Theme.of(context).textTheme.bodySmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },

                        connectorStyleBuilder: (context, index) =>
                        ConnectorStyle.solidLine,
                        indicatorStyleBuilder: (context, index) =>
                        IndicatorStyle.dot,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

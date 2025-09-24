import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/core/configs/router-configs/router_name.dart';
import 'package:xullo/features/trip/domain/entities/trip.dart';
import 'package:xullo/features/trip/presentation/controller/state/trip_state.dart';
import 'package:xullo/features/trip/presentation/screen/components/buildTripCard.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../controller/trip_provider.dart';
class TripScreen extends HookConsumerWidget {
  const TripScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trips = useState([]);
    final isLoading = useState(true);

    useEffect(() {
      Future.microtask(() => ref.read(tripNotifierProvider.notifier).getAllTrips());
      return null;
    }, []);

    ref.listen(tripNotifierProvider, (prev, next) {
      next.when(
          error: (error) {
            isLoading.value = false;
          },
          success: (log){
            trips.value = log;
            isLoading.value = false;
          },
          loading:() {
            isLoading.value = true;
          },
          initial: () {  });
    });

    return Scaffold(
      body: isLoading.value
          ? const Center(child: CircularProgressIndicator())
          :RefreshIndicator(
        onRefresh: () async {
          await ref.read(tripNotifierProvider.notifier).getAllTrips();
        },
        child: trips.value.isEmpty
            ? ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [
            SizedBox(height: 300), // Give some height so pull can trigger
            Center(child: Text('No Trips available.')),
          ],
        )
            : ListView.builder(
          itemCount: trips.value.length,
          itemBuilder: (context, index) {
            final Trip trip = trips.value[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              child: GestureDetector(
                onTap: (){
                  context.push(RouteNames.tripLog, extra: trip.uid);
                },
                  child: buildTripScreenCard(trip, context)),
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   heroTag: 'from_trip_screen',
      //   onPressed: () => context.go(RouteNames.form1),
      //   child: Icon(Icons.add, color: Theme.of(context).colorScheme.tertiary),
      // ),
    );
  }
}

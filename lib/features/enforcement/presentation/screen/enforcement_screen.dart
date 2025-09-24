import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/core/configs/router-configs/router_name.dart';
import 'package:xullo/features/trip/domain/entities/trip.dart';
import 'package:xullo/features/trip/presentation/controller/state/trip_state.dart';
import 'package:xullo/features/trip/presentation/screen/components/buildTripCard.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../trip/presentation/controller/trip_provider.dart';
import 'components/form.dart';

class EnforcementScreen extends HookConsumerWidget {
  const EnforcementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trips = useState([]);
    final isLoading = useState(true);

    final selectedTrips = useState<Set<String>>({});

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
            final isSelected =
            selectedTrips.value.contains(trip.uid);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Stack(
                children: [
                  // make the whole card tappable
                  GestureDetector(
                    onTap: () {
                      final newSet = {...selectedTrips.value};
                      if (isSelected) {
                        newSet.remove(trip.uid.toString());
                      } else {
                        newSet.add(trip.uid.toString());
                      }
                      selectedTrips.value = newSet;
                    },
                    child: buildTripScreenCard(trip, context),
                  ),

                  // selection indicator (overlayed)
                  Positioned(
                    top: 12,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        final newSet = {...selectedTrips.value};
                        if (isSelected) {
                          newSet.remove(trip.uid.toString());
                        } else {
                          newSet.add(trip.uid.toString());
                        }
                        selectedTrips.value = newSet;
                      },
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                        child: Icon(
                          isSelected ? Icons.check : Icons.add,
                          size: 16,
                          color: isSelected
                              ? Colors.white
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: selectedTrips.value.isNotEmpty
          ? FloatingActionButton.extended(
        heroTag: 'send_email_fab',
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          EnforcementFormDialog.show(context, selected: selectedTrips.value.toList());
          selectedTrips.value = {};
        },
        icon: const Icon(Icons.email),
        label: const Text("Send Email"),
      )
          : null
    );
  }
}

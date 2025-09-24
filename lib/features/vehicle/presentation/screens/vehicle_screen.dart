import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/features/vehicle/domain/entities/vehicle.dart';
import 'package:xullo/features/vehicle/presentation/controller/vehicle/state/vehicle_state.dart';
import 'package:xullo/features/vehicle/presentation/controller/vehicle/vehicle_provider.dart';
import 'package:xullo/features/vehicle/presentation/controller/vehicle/vehicle_type_provider.dart';
import 'components/form.dart';

class VehicleScreen extends HookConsumerWidget {
  const VehicleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicles = useState([]);
    final isLoading = useState(true);

    useEffect(() {
      Future.microtask(() => ref.read(vehicleNotifierProvider.notifier).getAllVehicles());
      Future.microtask(() => ref.read(vehicleTypeNotifierProvider.notifier).getAllVehicleTypes());
      return null;
    }, []);

    ref.listen(vehicleNotifierProvider, (prev, next) {
      next.when(
          initial: () {},
          loading: () {
            isLoading.value = true;
          },
          success: (data) {
            vehicles.value = data;
            isLoading.value = false;
          },
          create: (data) {
            vehicles.value = [...vehicles.value, data];
            isLoading.value = false;
          },
          update: (data) {
            final updatedList = vehicles.value.map((c) {
              return c.uid == data.uid ? data : c;
            }).toList();
            vehicles.value = updatedList;
            isLoading.value = false;
          },
          delete: (data) {
            final updatedList = vehicles.value.where((c) => c.uid != data.uid).toList();
            vehicles.value = updatedList;
            isLoading.value = false;
          },
          error: (error) {
            isLoading.value = false;
          }, loadingForm: () {  });
    });

    return Scaffold(
      body: isLoading.value
          ? const Center(child: CircularProgressIndicator())
          :RefreshIndicator(
        onRefresh: () async {
          await ref.read(vehicleNotifierProvider.notifier).getAllVehicles();
          await ref.read(vehicleTypeNotifierProvider.notifier).getAllVehicleTypes();
        },
        child: vehicles.value.isEmpty
            ? ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [
            SizedBox(height: 300), // Give some height so pull can trigger
            Center(child: Text('No vehicle available.')),
          ],
        )
            : ListView.builder(
          itemCount: vehicles.value.length,
          itemBuilder: (context, index) {
            final Vehicle vehicle = vehicles.value[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Theme.of(context).colorScheme.secondary,
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 16),
                  title: Row(
                    children: [
                      Text(vehicle.registration),
                      const SizedBox(width: 4),
                      vehicle.ruc ? Icon(Icons.paid_outlined , color: Colors.green,) : const SizedBox.shrink()
                    ],
                  ),
                  subtitle: Text(vehicle.odometer.toString()),
                  onTap: () {
                    VehicleFormDialog.show(context, uid: vehicle.uid);
                  },
                  trailing: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Confirm Deletion'),
                            content: const Text('Are you sure you want to delete ?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                        );

                        if (confirm == true) {
                          await ref
                              .read(vehicleNotifierProvider.notifier)
                              .deleteVehicle(vehicle.uid.toString());
                        }
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'from_vehicle_screen',
        onPressed: () => VehicleFormDialog.show(context),
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.tertiary),
      ),
    );
  }
}

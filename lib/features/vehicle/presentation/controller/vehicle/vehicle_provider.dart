
import 'package:xullo/features/vehicle/domain/entities/vehicle.dart';
import 'package:xullo/features/vehicle/domain/repositories/vehicle_repo.dart';
import 'package:xullo/features/vehicle/presentation/controller/vehicle/state/vehicle_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'vehicle_provider.g.dart';

@Riverpod(keepAlive: true)
class VehicleNotifier extends _$VehicleNotifier {
  late VehicleRepo _vehicleRepo;
  @override
  VehicleState build() {
    _vehicleRepo = ref.read(vehicleRepositoryProvider);
    return const VehicleState.initial();
  }



  Future<void> getAllVehicles() async {
    state = const VehicleState.loading();
    final result = await _vehicleRepo.getAllVehicle();
    state = result.fold(
          (error) => VehicleState.error(error),
          (vehicles) => VehicleState.success(vehicles),
    );
  }
  Future<Vehicle?> getVehicleById(String uid) async {
    final result = await _vehicleRepo.getVehicleById(uid);
    return result.fold(
          (error) {
        state = VehicleState.error(error);
        return null;
      },
          (vehicle) {
        return vehicle;
      },
    );
  }
  Future<void> createVehicle(Vehicle vehicle) async {
    state = const VehicleState.loadingForm();
    final result = await _vehicleRepo.createVehicle(vehicle);
    state = result.fold(
          (error) => VehicleState.error(error),
          (newVehicle) => VehicleState.create(newVehicle),
    );
  }

  Future<void> updateVehicle(String uid, Object updatedVehicle) async {
    state = const VehicleState.loadingForm();
    final result = await _vehicleRepo.updateVehicle(uid, updatedVehicle);
    state = result.fold(
          (error) => VehicleState.error(error),
          (vehicle) {

        return VehicleState.update(vehicle);
      },
    );
  }

  Future<void> deleteVehicle(String uid) async {
    state = const VehicleState.loading();

    final result = await _vehicleRepo.deleteVehicle(uid);

    state = result.fold(
          (error) => VehicleState.error(error),
          (vehicle) {
        return VehicleState.delete(vehicle);
      },
    );
  }

}

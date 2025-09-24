import 'package:xullo/features/vehicle/domain/entities/vehicle_type.dart';
import 'package:xullo/features/vehicle/presentation/controller/vehicle/state/vehicle_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xullo/features/vehicle/domain/repositories/vehicle_repo.dart';

part 'vehicle_type_provider.g.dart';

@Riverpod(keepAlive: true)
class VehicleTypeNotifier extends _$VehicleTypeNotifier {
  late VehicleRepo _vehicleRepo;

  @override
  VehicleTypeState build() {
    _vehicleRepo = ref.read(vehicleRepositoryProvider);
    return const VehicleTypeState.initial();
  }

  Future<void> getAllVehicleTypes() async {
    state = const VehicleTypeState.loading();

    final result = await _vehicleRepo.getAllVehicleTypes();

    state = result.fold(
          (error) => VehicleTypeState.error(error),
          (types) => VehicleTypeState.success(types.cast<VehicleType>()),
    );
  }
}

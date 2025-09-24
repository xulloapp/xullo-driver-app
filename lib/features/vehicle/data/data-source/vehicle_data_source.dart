import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/features/vehicle/data/data-source/vehicle_data_source_rest_impl.dart';
import 'package:xullo/features/vehicle/domain/entities/vehicle.dart';
import 'package:xullo/features/vehicle/domain/entities/vehicle_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/provider/dio_provider.dart';


part 'vehicle_data_source.g.dart';


@Riverpod(keepAlive: true)
VehicleDataSource vehicleDataSource(Ref ref) {
  return VehicleDataSourceRestImpl(
    dio: ref.watch(dioProvider),
  );
}

abstract class VehicleDataSource {
  Future<List<Vehicle>> getAllVehicles();
  Future<Vehicle> getVehicleById(String id);
  Future<Vehicle> createVehicle(Vehicle vehicle);
  Future<Vehicle> updateVehicle(String id, Object data);
  Future<Vehicle> deleteVehicle(String id);
  Future<List<VehicleType>> getAllVehicleTypes();
}
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/features/company/domain/entities/company.dart';
import 'package:xullo/features/vehicle/data/data-source/vehicle_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../../data/repo/vehicle_repo_impl.dart';
import '../entities/vehicle.dart';
import '../entities/vehicle_type.dart';


part 'vehicle_repo.g.dart';

@Riverpod(keepAlive: true)
VehicleRepo vehicleRepository(Ref ref) {
  return VehicleRepoImpl(vehicleDataSource: ref.read(vehicleDataSourceProvider));
}

abstract class VehicleRepo{
  Future<Either<CustomError,Vehicle>> createVehicle(Vehicle vehicle);
  Future<Either<CustomError,Vehicle>> deleteVehicle(String id);
  Future<Either<CustomError,List<Vehicle>>> getAllVehicle();
  Future<Either<CustomError,Vehicle>> getVehicleById(String id);
  Future<Either<CustomError,Vehicle>> updateVehicle(String id, Object vehicle);
  Future<Either<CustomError,List<VehicleType>>> getAllVehicleTypes();

}
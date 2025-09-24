import 'package:dartz/dartz.dart';
import 'package:xullo/features/vehicle/domain/entities/vehicle.dart';
import 'package:xullo/features/vehicle/domain/entities/vehicle_type.dart';
import 'package:xullo/features/vehicle/domain/repositories/vehicle_repo.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../data-source/vehicle_data_source.dart';

class VehicleRepoImpl extends VehicleRepo {
  final VehicleDataSource vehicleDataSource;

  VehicleRepoImpl({required this.vehicleDataSource});

  @override
  Future<Either<CustomError, Vehicle>> createVehicle(Vehicle vehicle) async {
    try {
      final data = await vehicleDataSource.createVehicle(vehicle);
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, Vehicle>> deleteVehicle(String id) async {
    try {
      final data = await vehicleDataSource.deleteVehicle(id);
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, List<Vehicle>>> getAllVehicle() async {
    try {
      final data = await vehicleDataSource.getAllVehicles();
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, Vehicle>> getVehicleById(String id) async {
    try {
      final data = await vehicleDataSource.getVehicleById(id);
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, Vehicle>> updateVehicle(String id, Object company) async {
    try {
      final data = await vehicleDataSource.updateVehicle(id,company);
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, List<VehicleType>>> getAllVehicleTypes() async {
    try {
      final data = await vehicleDataSource.getAllVehicleTypes();
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

}
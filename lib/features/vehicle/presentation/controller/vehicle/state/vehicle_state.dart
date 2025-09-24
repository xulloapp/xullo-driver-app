

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xullo/features/vehicle/domain/entities/vehicle.dart' hide VehicleType;

import '../../../../../../core/handlers/error-handler/error_handler.dart';
import '../../../../domain/entities/vehicle_type.dart';


part 'vehicle_state.freezed.dart';

@freezed
class VehicleState with _$VehicleState {
  const factory VehicleState.initial() = _Initial;
  const factory VehicleState.loading() = _Loading;
  const factory VehicleState.loadingForm() = _LoadingForm;
  const factory VehicleState.success(List<Vehicle> vehicles) = _Success;
  const factory VehicleState.create(Vehicle company) = _Create;
  const factory VehicleState.update(Vehicle company) = _Update;
  const factory VehicleState.delete(Vehicle company) = _Delete;
  const factory VehicleState.error(CustomError message) = _Error;
}

@freezed
class VehicleTypeState with _$VehicleTypeState {
  const factory VehicleTypeState.initial() = _VehicleTypeInitial;
  const factory VehicleTypeState.loading() = _VehicleTypeLoading;
  const factory VehicleTypeState.success(List<VehicleType> types) = _VehicleTypeSuccess;
  const factory VehicleTypeState.error(CustomError message) = _VehicleTypeError;
}
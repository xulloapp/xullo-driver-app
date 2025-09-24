import 'package:dio/dio.dart';
import 'package:xullo/features/vehicle/data/data-source/vehicle_data_source.dart';
import 'package:xullo/features/vehicle/data/vehicle/vehicle_model.dart';
import 'package:xullo/features/vehicle/data/vehicle/vehicle_type_model.dart';
import 'package:xullo/features/vehicle/domain/entities/vehicle.dart';
import 'package:xullo/features/vehicle/domain/entities/vehicle_type.dart';

class VehicleDataSourceRestImpl extends VehicleDataSource {
  final Dio dio;
  VehicleDataSourceRestImpl({required this.dio});

  @override
  Future<Vehicle> createVehicle(Vehicle vehicle) async {
    try{
      final model = VehicleModel.fromEntity(vehicle);
      final response = await dio.post('/vehicles',data: model.toJson());
      return VehicleModel.fromJson(response.data['data']);

    }catch(e){ rethrow;}
  }

  @override
  Future<Vehicle> deleteVehicle(String id) async {
    try{
      final response = await dio.delete('/vehicles/$id');
      return VehicleModel.fromJson(response.data['data']);

    }catch(e){ rethrow;}
  }

  @override
  Future<List<Vehicle>> getAllVehicles() async {
    try{
      final response = await dio.get('/vehicles');
      final data = response.data['data'] as List;
      final list = data.map((e) => VehicleModel.fromJson(e)).toList();
      return list;

    }catch(e){ rethrow;}
  }

  @override
  Future<Vehicle> getVehicleById(String id) async {
    try{
      final response = await dio.get('/vehicles/$id');
      return VehicleModel.fromJson(response.data['data']);

    }catch(e){ rethrow;}
  }

  @override
  Future<Vehicle> updateVehicle(String id, Object data) async {
    try{
      final response = await dio.put('/vehicles/$id',data: data);
      return VehicleModel.fromJson(response.data['data']);

    }catch(e){ rethrow;}
  }

  @override
  Future<List<VehicleType>> getAllVehicleTypes() async {
    try{
      final response = await dio.get('/vehicle/types');
      final data = response.data['data'] as List;
      final list = data.map((e) => VehicleTypeModel.fromJson(e)).toList();
      return list;

    }catch(e){ rethrow;}
  }
}
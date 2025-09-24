import 'package:dio/dio.dart';

import '../../domain/entities/enforcement.dart';
import '../model/enforcement_model.dart';
import 'enforcement_data_source.dart';

class EnforcementDataSourceRestImpl extends EnforcementDataSource {
  final Dio dio;
  EnforcementDataSourceRestImpl({required this.dio});
  @override
  Future<Enforcement> createEnforcement(Enforcement enforcement) async {
    try{
      final enforcementModel = EnforcementModel.fromEntity(enforcement);
      final response = await dio.post('/enforcements',data: enforcementModel.toJson());
      return EnforcementModel.fromJson(response.data['data']);

    }catch(e){ rethrow;}
  }

}
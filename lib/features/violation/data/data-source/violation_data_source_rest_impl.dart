import 'package:dio/dio.dart';
import 'package:xullo/features/company/data/company/company_model.dart';

import '../../domain/entities/violation.dart';
import '../Violation/violation_model.dart';
import 'violation_data_source.dart';

class ViolationDataSourceRestImpl extends ViolationDataSource {
  final Dio dio;
  ViolationDataSourceRestImpl({required this.dio});
  @override

  @override
  Future<List<Violation>> getAllViolation() async {
    try{
      final response = await dio.get('/violations');
      final data = response.data['data'] as List;
      final list = data.map((e) => ViolationModel.fromJson(e)).toList();
      return list;

    }catch(e){ rethrow;}
  }
  
}
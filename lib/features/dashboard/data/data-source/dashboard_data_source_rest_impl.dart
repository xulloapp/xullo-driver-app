import 'package:dio/dio.dart';
import 'package:xullo/features/trip/data/model/trip_model.dart';

import 'dashboard_data_source.dart';

class DashboardDataSourceRestImpl extends DashboardDataSource {
  final Dio dio;
  DashboardDataSourceRestImpl({required this.dio});

  @override
  Future<TripModel?> currentTripCheck()async {
    try{
      final response = await dio.get('/trips/current');
      final data = response.data['data'];
      if (data == null) return null; // no trip running

      return TripModel.fromJson(data); // convert to TripModel

    }catch(e){ rethrow;}
  }
  @override
  Future<Object> dashboard() async {
    try{
      final response = await dio.get('/dashboard');
      return response.data['data'];
    }catch(e){ rethrow;}
  }

}
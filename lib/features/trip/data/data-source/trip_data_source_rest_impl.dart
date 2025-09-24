import 'package:dio/dio.dart';
import 'package:xullo/features/trip/data/model/trip_model.dart';
import 'package:xullo/features/trip/domain/entities/trip.dart';
import 'trip_data_source.dart';

class TripDataSourceRestImpl extends TripDataSource {
  final Dio dio;
  TripDataSourceRestImpl({required this.dio});

  @override
  Future<List<Trip>> getAllTrip() async{
    try{
      final response = await dio.get('/trips');
      final data = response.data['data'] as List;
      final list = data.map((e) => TripModel.fromJson(e)).toList();
      return list;

    }catch(e){ rethrow;}
  }

}
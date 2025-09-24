import 'package:dio/dio.dart';
import 'package:xullo/features/log/data/model/log_model.dart';
import 'package:xullo/features/log/domain/entities/log.dart';
import 'package:xullo/features/trip/data/model/trip_model.dart';
import 'package:xullo/features/trip/domain/entities/trip.dart';
import 'log_data_source.dart';

class LogDataSourceRestImpl extends LogDataSource {
  final Dio dio;
  LogDataSourceRestImpl({required this.dio});

  @override
  Future<Log> createLogForm1(Object data) async {
    try{
      final response = await dio.post('/logs?form=1',data: data);
      return LogModel.fromJson(response.data['data']);

    }catch(e){ rethrow;}
  }

  @override
  Future<Log> createLogForm2(Object data) async {
    try{
      final response = await dio.post('/logs?form=2',data: data);
      return LogModel.fromJson(response.data['data']);

    }catch(e){ rethrow;}
  }

  @override
  Future<Log> createLogForm3(Object data) async {
    try{
      final response = await dio.post('/logs?form=3',data: data);
      return LogModel.fromJson(response.data['data']);

    }catch(e){ rethrow;}
  }

  @override
  Future<Trip> getAllLogs(String uid) async {
    try{
      final response = await dio.get('/trips/$uid');
      return TripModel.fromJson(response.data['data']);

    }catch(e){ rethrow;}
  }

  @override
  Future<Log> createLogFullForm(Object data) async {
    try{
      final response = await dio.post('/logs/form',data: data);
      return LogModel.fromJson(response.data['data']);

    }catch(e){ rethrow;}
  }

  @override
  Future<Log> getLogById(String uid) async {
    try {
      final response = await dio.get('/logs/$uid');
      return LogModel.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Log> finishLog(String uid) async {
    try {
      final response = await dio.get('/logs/finish/$uid');
      return LogModel.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Log> updateLogFullForm(String id, Object data) async {
    try {
      final response = await dio.put('/logs/form/$id',data: data);
      return LogModel.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Trip> comment(String uid, Object data) async {
    try {
      final response = await dio.put('/trips/$uid',data: data);
      return TripModel.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }
}
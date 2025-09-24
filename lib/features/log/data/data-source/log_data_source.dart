import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/features/log/domain/entities/log.dart';
import 'package:xullo/features/trip/domain/entities/trip.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/provider/dio_provider.dart';
import 'log_data_source_rest_impl.dart';


part 'log_data_source.g.dart';

@Riverpod(keepAlive: true)
LogDataSource logDataSource(Ref ref) {
  return LogDataSourceRestImpl(
    dio: ref.watch(dioProvider),
  );
}

abstract class LogDataSource {
  Future<Trip> getAllLogs(String uid);
  Future<Log> createLogForm1(Object data);
  Future<Log> createLogForm2(Object data);
  Future<Log> createLogForm3(Object data);
  Future<Log> createLogFullForm(Object data);
  Future<Log> updateLogFullForm(String id, Object data);
  Future<Log> getLogById(String uid);
  Future<Log> finishLog(String uid);
  Future<Trip> comment(String uid,Object data);
}
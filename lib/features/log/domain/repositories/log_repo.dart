import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/features/company/domain/entities/company.dart';
import 'package:xullo/features/log/domain/entities/log.dart';
import 'package:xullo/features/trip/domain/entities/trip.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../../data/data-source/log_data_source.dart';
import '../../data/repo/logo_repo_impl.dart';

part 'log_repo.g.dart';

@Riverpod(keepAlive: true)
LogRepo logRepository(Ref ref) {
  return LogRepoImpl(logDataSource: ref.read(logDataSourceProvider));
}

abstract class LogRepo{
  Future<Either<CustomError,Trip>> getAllLogs(String uid);
  Future<Either<CustomError,Log>> createForm1(Object data);
  Future<Either<CustomError,Log>> createForm2(Object data);
  Future<Either<CustomError,Log>> createForm3(Object data);
  Future<Either<CustomError,Log>> createFullForm(Object data);
  Future<Either<CustomError,Log>> updateFullForm(String uid,Object data);
  Future<Either<CustomError,Log>> getLogById(String uid);
  Future<Either<CustomError,Log>> finishLog(String uid);
  Future<Either<CustomError,Trip>> comment(String uid,Object data);



}
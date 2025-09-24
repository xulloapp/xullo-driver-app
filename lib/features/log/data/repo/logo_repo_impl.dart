import 'package:dartz/dartz.dart';
import 'package:xullo/features/log/domain/entities/log.dart';
import 'package:xullo/features/log/domain/repositories/log_repo.dart';
import 'package:xullo/features/trip/domain/entities/trip.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../data-source/log_data_source.dart';

class LogRepoImpl extends LogRepo {
  final LogDataSource logDataSource;

  LogRepoImpl({required this.logDataSource});

  @override
  Future<Either<CustomError, Log>> createForm1(Object data) async {
    try {
      final log = await logDataSource.createLogForm1(data);
      return Right(log);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, Log>> createForm2(Object data) async {
    try {
      final log = await logDataSource.createLogForm2(data);
      return Right(log);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, Log>> createForm3(Object data) async {
    try {
      final log = await logDataSource.createLogForm3(data);
      return Right(log);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, Trip>> getAllLogs(String uid) async {
    try {
      final data = await logDataSource.getAllLogs(uid);
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, Log>> createFullForm(Object data) async {
    try {
      final log = await logDataSource.createLogFullForm(data);
      return Right(log);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, Log>> getLogById(String uid) async {
    try {
      final log = await logDataSource.getLogById(uid);
      return Right(log);
      } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }
  @override
  Future<Either<CustomError, Log>> finishLog(String uid) async {
    try {
      final log = await logDataSource.finishLog(uid);
      return Right(log);
      } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, Log>> updateFullForm(String uid,Object data) async {
    try {
      final log =await logDataSource.updateLogFullForm(uid,data);
      return Right(log);
      } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, Trip>> comment(String uid,Object data) async {
    try {
      final comment = await logDataSource.comment(uid,data);
      return Right(comment);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

}
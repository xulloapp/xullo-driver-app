import 'package:dartz/dartz.dart';
import 'package:xullo/features/trip/domain/entities/trip.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../../domain/repositories/dashboard_repo.dart';
import '../data-source/dashboard_data_source.dart';

class DashboardRepoImpl extends DashboardRepo {
  final DashboardDataSource dashboardDataSource;

  DashboardRepoImpl({required this.dashboardDataSource});

  @override
  Future<Either<CustomError, Trip?>> checkCurrentTrip() async {
    try {
      final data = await dashboardDataSource.currentTripCheck();
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, Object>> dashboard() async {
    try {
      final data = await dashboardDataSource.dashboard();
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

}
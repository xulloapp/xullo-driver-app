import 'package:dartz/dartz.dart';
import 'package:xullo/features/trip/domain/entities/trip.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../../domain/repositories/trip_repo.dart';
import '../data-source/trip_data_source.dart';

class TripRepoImpl extends TripRepo {
  final TripDataSource tripDataSource;

  TripRepoImpl({required this.tripDataSource});

  @override
  Future<Either<CustomError, List<Trip>>> getAllTrips() async{
    try {
      final data = await tripDataSource.getAllTrip();
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

}
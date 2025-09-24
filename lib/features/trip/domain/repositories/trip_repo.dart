import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/features/trip/domain/entities/trip.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../../data/data-source/trip_data_source.dart';
import '../../data/repo/trip_repo_impl.dart';

part 'trip_repo.g.dart';

@Riverpod(keepAlive: true)
TripRepo tripRepository(Ref ref) {
  return TripRepoImpl(tripDataSource: ref.read(tripDataSourceProvider));
}

abstract class TripRepo{
  Future<Either<CustomError,List<Trip>>> getAllTrips();

}
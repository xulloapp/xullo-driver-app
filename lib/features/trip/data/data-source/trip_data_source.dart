import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/features/trip/data/data-source/trip_data_source_rest_impl.dart';
import 'package:xullo/features/trip/domain/entities/trip.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/provider/dio_provider.dart';


part 'trip_data_source.g.dart';

@Riverpod(keepAlive: true)
TripDataSource tripDataSource(Ref ref) {
  return TripDataSourceRestImpl(
    dio: ref.watch(dioProvider),
  );
}

abstract class TripDataSource {
  Future<List<Trip>> getAllTrip();
}
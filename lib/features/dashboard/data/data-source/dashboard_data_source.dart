import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/features/trip/data/model/trip_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/provider/dio_provider.dart';

import 'dashboard_data_source_rest_impl.dart';


part 'dashboard_data_source.g.dart';

@Riverpod(keepAlive: true)
DashboardDataSource dashboardDataSource(Ref ref) {
  return DashboardDataSourceRestImpl(
    dio: ref.watch(dioProvider),
  );
}

abstract class DashboardDataSource {
  Future<TripModel?> currentTripCheck();
  Future<Object> dashboard();
}
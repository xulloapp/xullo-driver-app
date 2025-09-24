import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/features/trip/domain/entities/trip.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../../data/data-source/dashboard_data_source.dart';
import '../../data/repo/dashboard_repo_impl.dart';

part 'dashboard_repo.g.dart';

@Riverpod(keepAlive: true)
DashboardRepo dashboardRepository(Ref ref) {
  return DashboardRepoImpl(dashboardDataSource: ref.read(dashboardDataSourceProvider));
}

abstract class DashboardRepo{
  Future<Either<CustomError,Trip?>> checkCurrentTrip();
  Future<Either<CustomError,Object>> dashboard();
}
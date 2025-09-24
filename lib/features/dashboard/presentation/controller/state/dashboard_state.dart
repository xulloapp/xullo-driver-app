import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xullo/features/trip/domain/entities/trip.dart';
import '../../../../../../core/handlers/error-handler/error_handler.dart';


part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;
  const factory DashboardState.loading() = _Loading;
  const factory DashboardState.success(Trip? trip) = _Success;
  const factory DashboardState.error(CustomError message) = _Error;
  const factory DashboardState.dashboardLoading() = _DashboardLoading;
  const factory DashboardState.dashboardSuccess(Object data) = _DashboardSuccess;
  const factory DashboardState.dashboardError(CustomError message) = _DashboardError;
}

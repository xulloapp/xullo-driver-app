import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xullo/features/log/domain/entities/log.dart';
import 'package:xullo/features/trip/domain/entities/trip.dart';
import '../../../../../../core/handlers/error-handler/error_handler.dart';

part 'trip_state.freezed.dart';

@freezed
class TripState with _$TripState {
  const factory TripState.initial() = _Initial;
  const factory TripState.loading() = _Loading;
  const factory TripState.success(List<Trip> data) = _Success;
  const factory TripState.error(CustomError message) = _Error;
}

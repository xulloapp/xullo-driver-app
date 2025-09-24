import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../../core/handlers/error-handler/error_handler.dart';
import '../../../../domain/entities/violation.dart';

part 'violation_state.freezed.dart';

@freezed
class ViolationState with _$ViolationState {
  const factory ViolationState.initial() = _Initial;
  const factory ViolationState.loading() = _Loading;
  const factory ViolationState.success(List<Violation> companies) = _Success;
  const factory ViolationState.error(CustomError message) = _Error;
}

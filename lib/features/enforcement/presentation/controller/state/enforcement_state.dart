import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../../core/handlers/error-handler/error_handler.dart';
import '../../../domain/entities/enforcement.dart';

part 'enforcement_state.freezed.dart';

@freezed
class EnforcementState with _$EnforcementState {
  const factory EnforcementState.initial() = _Initial;
  const factory EnforcementState.loading() = _Loading;
  const factory EnforcementState.create(Enforcement enforcement) = _Create;
  const factory EnforcementState.error(CustomError message) = _Error;
}

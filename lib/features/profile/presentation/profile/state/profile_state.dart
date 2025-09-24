import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/handlers/error-handler/error_handler.dart';
import '../../../../auth/domain/entities/user.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  //// progress states
  const factory ProfileState.loading() = _Loading;
  //// success states
  const factory ProfileState.success(User user) = _Success;
  //// error states
  const factory ProfileState.error(CustomError message) = _Error;
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/handlers/error-handler/error_handler.dart';
part 'pin_state.freezed.dart';

@freezed
class PinState with _$PinState {
  const factory PinState.initial() = _Initial;

  const factory PinState.loading() = _Loading;
  //// success states
  const factory PinState.success() = _Success;
  const factory PinState.error(CustomError message) = _Error;

}

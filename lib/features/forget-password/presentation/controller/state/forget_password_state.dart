import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../../core/handlers/error-handler/error_handler.dart';


part 'forget_password_state.freezed.dart';

@freezed
class ForgetpasswordState with _$ForgetpasswordState {
  const factory ForgetpasswordState.initial() = _Initial;
  const factory ForgetpasswordState.loading() = _Loading;
  const factory ForgetpasswordState.send(Object data) = _Send;
  const factory ForgetpasswordState.success() = _Success;
  const factory ForgetpasswordState.error(CustomError message) = _Error;
}

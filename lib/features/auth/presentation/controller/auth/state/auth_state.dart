import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/handlers/error-handler/error_handler.dart';
import '../../../../domain/entities/user.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  //// progress states
  const factory AuthState.signingIn() = _SigningIn;
  const factory AuthState.signingUp() = _SigningUp;
  const factory AuthState.gettingSignedInUser() = _GettingSignedInUser;
  //// success states
  const factory AuthState.success(User user) = _Success;
  //// error states
  const factory AuthState.errorSigningUp(CustomError error) = _Error;
  const factory AuthState.errorSigningIn(CustomError error) = _ErrorSigningIn;
}

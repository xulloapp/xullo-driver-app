import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../../core/handlers/error-handler/error_handler.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;
  const factory NotificationState.loading() = _Loading;
  const factory NotificationState.sucess() = _Sucess;
  const factory NotificationState.error(CustomError message) = _Error;

}

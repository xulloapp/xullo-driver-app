import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xullo/features/log/domain/entities/log.dart';
import 'package:xullo/features/trip/domain/entities/trip.dart';
import '../../../../../../core/handlers/error-handler/error_handler.dart';

part 'log_state.freezed.dart';

@freezed
class LogState with _$LogState {
  const factory LogState.initial() = _Initial;
  const factory LogState.loading() = _Loading;
  const factory LogState.success(Trip data) = _Success;
  const factory LogState.createForm1(Log data) = _CreateForm1;
  const factory LogState.loadingForm1() = _LoadingForm1;
  const factory LogState.createForm2(Log data) = _CreateForm2;
  const factory LogState.loadingForm2() = _LoadingForm2;
  const factory LogState.createForm3(Log data) = _CreateForm3;
  const factory LogState.loadingForm3() = _LoadingForm3;
  const factory LogState.loadingFullForm() = _LoadingFullForm;
  const factory LogState.createFullForm(Log data) = _CreateFullForm;
  const factory LogState.updateFullForm(Log data) = _UpdateFullForm;
  const factory LogState.errorFullForm(CustomError message) = _ErrorFullForm;
  const factory LogState.error(CustomError message) = _Error;
  const factory LogState.finishLog(Log data) = _FinishLog;
  const factory LogState.loadingLog() = _LoadingLog;
  const factory LogState.comment(Trip data) = _Comment;
  const factory LogState.loadingComment() = _LoadingComment;
  const factory LogState.errorComment(CustomError message) = _ErrorComment;

}

import 'dart:async';
import 'dart:io';
import 'src/index.dart';

abstract class BaseErrorHandler {
  String handleError(dynamic error, [StackTrace? stackTrace]);
}

class CustomError {
  final String message;
  final dynamic response;

  CustomError({required this.message, this.response});
}

class _ErrorFactory {
  static BaseErrorHandler getErrorHandler(dynamic error) {
    if (error is SocketException || error is TimeoutException) {
      return NetworkIssueHandler();
    } else {
      return GenericErrorHandler();
    }
  }
}

CustomError handleError(dynamic error, [StackTrace? stackTrace]) {
  final errorHandler = _ErrorFactory.getErrorHandler(error);
  final message = errorHandler.handleError(error, stackTrace);

  return CustomError(
    message: message,
    response: error.response?.data,
  );
}



import 'package:dartz/dartz.dart';

import 'package:xullo/core/handlers/error-handler/error_handler.dart';

import '../../../auth/domain/entities/user.dart';
import '../../domain/repositories/notification_repo.dart';
import '../data-source/notification_data_source.dart';

class NotificationRepoImpl extends NotificationRepo {
  final NotificationDataSource notificationDataSource;

  NotificationRepoImpl({required this.notificationDataSource});

  @override
  Future<Either<CustomError, User>> update(String uid) async {
    try {
      final user = await notificationDataSource.update(uid);
      return Right(user);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

}
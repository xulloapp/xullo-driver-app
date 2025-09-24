import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/features/notification/data/data-source/notification_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/handlers/error-handler/error_handler.dart';
import '../../../auth/domain/entities/user.dart';
import '../../data/repo/notification_repo_impl.dart';

part 'notification_repo.g.dart';

@Riverpod(keepAlive: true)
NotificationRepo notificationRepository(Ref ref) {
  return NotificationRepoImpl(notificationDataSource: ref.read(notificationDataSourceProvider));
}

abstract class NotificationRepo{
  Future<Either<CustomError,User>> update(String uid);
}
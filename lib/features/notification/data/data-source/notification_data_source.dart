import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/provider/dio_provider.dart';
import '../../../auth/domain/entities/user.dart';
import 'notification_data_source_rest_impl.dart';


part 'notification_data_source.g.dart';

@Riverpod(keepAlive: true)
NotificationDataSource notificationDataSource(Ref ref) {
  return NotificationDataSourceRestImpl(
    dio: ref.watch(dioProvider),
  );
}

abstract class NotificationDataSource {
  Future<User> update(String uid);
}
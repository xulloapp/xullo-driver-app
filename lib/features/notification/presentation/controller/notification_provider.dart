import 'package:xullo/features/notification/presentation/controller/state/notification_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/notification_repo.dart';


part 'notification_provider.g.dart';

@Riverpod(keepAlive: true)
class NotificationNotifier extends _$NotificationNotifier {
  late NotificationRepo _notificationRepo;
  @override
  NotificationState build() {
    _notificationRepo = ref.read(notificationRepositoryProvider);
    return const NotificationState.initial();
  }

  Future<void> update(String uid) async {
    state = const NotificationState.loading();
    final result = await _notificationRepo.update(uid);
    state = result.fold(
          (error) => NotificationState.error(error),
          (_) {
        return NotificationState.sucess();
      },
    );
  }
}

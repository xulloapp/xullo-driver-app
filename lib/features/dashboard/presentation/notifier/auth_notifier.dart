import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xullo/features/auth/data/user/user.dart';

import '../../application/auth_service.dart';


part 'auth_notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  AsyncValue<UserModel?> build() {
    _loadUser();
    return const AsyncLoading();
  }

  void _loadUser() {
    final authService = ref.read(authserviceProvider);
    authService.getUser().then((user) {
      state = AsyncData(user);
    }).catchError((e, stack) {
      state = AsyncError(e, stack);
    });
  }

  Future<void> refreshUser() async {
    state = const AsyncLoading();
    _loadUser();
  }
}

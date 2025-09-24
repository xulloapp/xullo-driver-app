import 'package:xullo/features/profile/domain/repositories/profile_repo.dart';
import 'package:xullo/features/profile/presentation/profile/state/profile_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../../../auth/domain/entities/user.dart';

part 'profile_provider.g.dart';

@Riverpod(keepAlive: true)
class ProfileNotifier extends _$ProfileNotifier {
  late ProfileRepo _profileRepo;
  @override
  ProfileState build() {
    _profileRepo = ref.read(profileRepositoryProvider);
    return const ProfileState.initial();
  }

  Future<User?> getCurrentUser() async {
    state = const ProfileState.loading();
    final result = await _profileRepo.getSignedInUser();
    return result.fold((CustomError sd) {
      return null;
    }, (User user) {
      state = ProfileState.success(user);
      return user;
    });
  }

  Future<void> updateUser(Object user) async {
    state = const ProfileState.loading();
    final result = await _profileRepo.updateUser(user);
    result.fold((CustomError message) {
      state = ProfileState.error(message);
    }, (User user) {
      state = ProfileState.success(user);
    });
  }
}

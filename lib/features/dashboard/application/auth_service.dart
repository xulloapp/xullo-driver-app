
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/features/auth/data/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/domain/repositories/auth_repo.dart';

part 'auth_service.g.dart';

@Riverpod(keepAlive: true)
AuthService authservice(Ref ref) {
  return AuthService(ref);
}

class AuthService {
  final Ref ref;
  AuthService(this.ref);

  Future<UserModel> getUser() async {
    final result = await ref.read(authRepositoryProvider).getSignedInUser();
    return result.fold((error) => throw Exception(error),
            (user)
        { return UserModel.fromEntity(user);});
  }

}

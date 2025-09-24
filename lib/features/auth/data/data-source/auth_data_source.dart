import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:xullo/features/auth/data/data-source/auth_data_source_rest_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/provider/dio_provider.dart';
import '../../domain/entities/user.dart';

part 'auth_data_source.g.dart';

@Riverpod(keepAlive: true)
AuthDataSource authDataSource(Ref ref) {
  return AuthDataSourceRestImpl(
    dio: ref.watch(dioProvider),
    storage: const FlutterSecureStorage(),
  );
}

abstract class AuthDataSource {
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signUp(User user);
  Future<void> signOut();
  Future<User> getSignedInUser();
  Future<void> verifyPin(String pin);
}

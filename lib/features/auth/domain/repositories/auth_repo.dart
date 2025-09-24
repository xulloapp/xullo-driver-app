
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/core/handlers/error-handler/error_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data-source/auth_data_source.dart';
import '../../data/repo/auth_repo_impl.dart';
import '../entities/user.dart';

part 'auth_repo.g.dart';

@Riverpod(keepAlive: true)
AuthRepo authRepository(Ref ref) {
  return AuthRepoImpl(authDataSource: ref.read(authDataSourceProvider));
}

abstract class AuthRepo{
  Future<Either<CustomError, User>> signInWithEmailAndPassword(
      String email, String password);
  Future<Either<CustomError, User>> signUp(User user);
  Future<Either<Unit, Unit>> signOut();
  Future<Either<CustomError, User>> getSignedInUser();
  Future<Either<CustomError, Unit>> verifyPin(String pin);
}
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:xullo/features/auth/domain/entities/user.dart';
import 'package:xullo/features/auth/domain/repositories/auth_repo.dart';
import '../../../../core/handlers/error-handler/error_handler.dart';
import '../data-source/auth_data_source.dart';

class AuthRepoImpl implements AuthRepo{
  final AuthDataSource authDataSource;
  final storage = const FlutterSecureStorage();

  AuthRepoImpl({required this.authDataSource});
  @override
  Future<Either<CustomError, User>> getSignedInUser() async {
    try {
      final user = await authDataSource.getSignedInUser();
      return Right(user);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, User>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await authDataSource.signInWithEmailAndPassword(email, password);
      final fetchedUser = await authDataSource.getSignedInUser();
      return Right(fetchedUser);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<Unit, Unit>> signOut() async {
    try {
      await authDataSource.signOut();
      return const Right(unit);
    } catch (e, stackTrace) {
      await storage.delete(key: 'jwt');
      return Left(unit);
    }
  }

  @override
  Future<Either<CustomError, User>> signUp(User user) async {
    try {
      await authDataSource.signUp(user);
      final fetchedUser = await authDataSource.getSignedInUser();
      return Right(fetchedUser);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, Unit>> verifyPin(String pin) async {
    try {
      await authDataSource.verifyPin(pin);
      return const Right(unit);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

}
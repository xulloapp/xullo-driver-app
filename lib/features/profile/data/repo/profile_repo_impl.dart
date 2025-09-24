import 'package:dartz/dartz.dart';
import 'package:xullo/features/auth/domain/entities/user.dart';
import 'package:xullo/features/profile/domain/repositories/profile_repo.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../data-source/profile_data_source.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileDataSource profileDataSource;
  ProfileRepoImpl({required this.profileDataSource});

  @override
  Future<Either<CustomError, User>> getSignedInUser() async {
    try {
      final user = await profileDataSource.getSignedInUser();
      return Right(user);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, User>> updateUser(Object user) async {
    try {
      final data = await profileDataSource.updateUser(user);
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

}
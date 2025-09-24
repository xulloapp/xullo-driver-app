
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/features/profile/data/data-source/profile_data_source.dart';
import 'package:xullo/features/profile/data/repo/profile_repo_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../../../auth/domain/entities/user.dart';

part 'profile_repo.g.dart';

@Riverpod(keepAlive: true)
ProfileRepo profileRepository(Ref ref) {
  return ProfileRepoImpl(profileDataSource: ref.read(profileDataSourceProvider));
}

abstract class ProfileRepo{
  Future<Either<CustomError, User>> updateUser(Object user);
  Future<Either<CustomError, User>> getSignedInUser();
}
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../../data/data-source/forget_password_data_source.dart';
import '../../data/repo/forget_password_repo_impl.dart';

part 'forget_password_repo.g.dart';

@Riverpod(keepAlive: true)
ForgetpasswordRepo forgetpasswordRepository(Ref ref) {
  return ForgetpasswordRepoImpl(forgetpasswordDataSource: ref.read(forgetpasswordDataSourceProvider));
}

abstract class ForgetpasswordRepo{
  Future<Either<CustomError,Object>> sendEmail(String email);
  Future<Either<CustomError,Object>> resetPassword(String email,String otp, String password);

}
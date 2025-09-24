import 'package:dartz/dartz.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../../domain/repositories/forget_password_repo.dart';
import '../data-source/forget_password_data_source.dart';

class ForgetpasswordRepoImpl extends ForgetpasswordRepo {
  final ForgetpasswordDataSource forgetpasswordDataSource;

  ForgetpasswordRepoImpl({required this.forgetpasswordDataSource});

  @override
  Future<Either<CustomError, Object>> resetPassword(String email,String otp, String password) async {
    try {
      final data = await forgetpasswordDataSource.resetPassword(email,otp,password);
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, Object>> sendEmail(String email) async {
    try {
      final data = await forgetpasswordDataSource.sendEmail(email);
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }
}
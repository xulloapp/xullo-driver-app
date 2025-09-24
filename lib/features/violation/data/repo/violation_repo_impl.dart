import 'package:dartz/dartz.dart';
import 'package:xullo/features/violation/domain/entities/violation.dart';
import 'package:xullo/features/violation/domain/repositories/violation_repo.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../data-source/violation_data_source.dart';

class ViolationRepoImpl extends ViolationRepo {
  final ViolationDataSource violationDataSource;

  ViolationRepoImpl({required this.violationDataSource});

  @override
  Future<Either<CustomError, List<Violation>>> getAllViolation() async {
    try {
      final data = await violationDataSource.getAllViolation();
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

}
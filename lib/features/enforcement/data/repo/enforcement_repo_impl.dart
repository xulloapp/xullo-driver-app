import 'package:dartz/dartz.dart';
import 'package:xullo/features/company/domain/entities/company.dart';
import 'package:xullo/features/company/domain/repositories/company_repo.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../../domain/entities/enforcement.dart';
import '../../domain/repositories/enforcement_repo.dart';
import '../data-source/enforcement_data_source.dart';

class EnforcementRepoImpl extends EnforcementRepo {
  final EnforcementDataSource enforcementDataSource;

  EnforcementRepoImpl({required this.enforcementDataSource});

  @override
  Future<Either<CustomError, Enforcement>> createEnforcement(Enforcement enforcement) async {
    try {
      final data = await enforcementDataSource.createEnforcement(enforcement);
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }
}
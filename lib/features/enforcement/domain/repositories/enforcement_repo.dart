import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/features/enforcement/domain/entities/enforcement.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../../data/data-source/enforcement_data_source.dart';
import '../../data/repo/enforcement_repo_impl.dart';

part 'enforcement_repo.g.dart';

@Riverpod(keepAlive: true)
EnforcementRepo enforcementRepository(Ref ref) {
  return EnforcementRepoImpl(enforcementDataSource: ref.read(enforcementDataSourceProvider));
}

abstract class EnforcementRepo{
  Future<Either<CustomError,Enforcement>> createEnforcement(Enforcement enforcement);

}
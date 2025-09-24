import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/features/violation/domain/entities/violation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../../data/data-source/violation_data_source.dart';
import '../../data/repo/violation_repo_impl.dart';

part 'violation_repo.g.dart';

@Riverpod(keepAlive: true)
ViolationRepo violationRepository(Ref ref) {
  return ViolationRepoImpl(violationDataSource: ref.read(violationDataSourceProvider));
}

abstract class ViolationRepo{
  Future<Either<CustomError,List<Violation>>> getAllViolation();

}
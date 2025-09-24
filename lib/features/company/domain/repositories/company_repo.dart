import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/features/company/domain/entities/company.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../../data/data-source/company_data_source.dart';
import '../../data/repo/company_repo_impl.dart';

part 'company_repo.g.dart';

@Riverpod(keepAlive: true)
CompanyRepo companyRepository(Ref ref) {
  return CompanyRepoImpl(companyDataSource: ref.read(companyDataSourceProvider));
}

abstract class CompanyRepo{
  Future<Either<CustomError,Company>> createCompany(Company company);
  Future<Either<CustomError,Company>> deleteCompany(String id);
  Future<Either<CustomError,List<Company>>> getAllCompanies();
  Future<Either<CustomError,Company>> getCompanyById(String id);
  Future<Either<CustomError,Company>> updateCompany(String id, Object company);

}
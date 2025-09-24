import 'package:dartz/dartz.dart';
import 'package:xullo/features/company/domain/entities/company.dart';
import 'package:xullo/features/company/domain/repositories/company_repo.dart';

import '../../../../core/handlers/error-handler/error_handler.dart';
import '../data-source/company_data_source.dart';

class CompanyRepoImpl extends CompanyRepo {
  final CompanyDataSource companyDataSource;

  CompanyRepoImpl({required this.companyDataSource});

  @override
  Future<Either<CustomError, Company>> createCompany(Company company) async {
    try {
      final data = await companyDataSource.createCompany(company);
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, Company>> deleteCompany(String id) async {
    try {
      final data = await companyDataSource.deleteCompany(id);
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, List<Company>>> getAllCompanies() async {
    try {
      final data = await companyDataSource.getAllCompanies();
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, Company>> getCompanyById(String id) async {
    try {
      final data = await companyDataSource.getCompanyById(id);
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<CustomError, Company>> updateCompany(String id, Object company) async {
    try {
      final data = await companyDataSource.updateCompany(id,company);
      return Right(data);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

}
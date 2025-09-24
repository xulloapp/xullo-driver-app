import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/features/company/data/data-source/company_data_source_rest_impl.dart';
import 'package:xullo/features/company/domain/entities/company.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/provider/dio_provider.dart';


part 'company_data_source.g.dart';

@Riverpod(keepAlive: true)
CompanyDataSource companyDataSource(Ref ref) {
  return CompanyDataSourceRestImpl(
    dio: ref.watch(dioProvider),
  );
}

abstract class CompanyDataSource {
  Future<List<Company>> getAllCompanies();
  Future<Company> getCompanyById(String id);
  Future<Company> createCompany(Company company);
  Future<Company> updateCompany(String id, Object data);
  Future<Company> deleteCompany(String id);
}
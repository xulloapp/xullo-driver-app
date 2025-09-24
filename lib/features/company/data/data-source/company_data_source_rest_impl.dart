import 'package:dio/dio.dart';
import 'package:xullo/features/company/data/company/company_model.dart';
import 'package:xullo/features/company/data/data-source/company_data_source.dart';
import 'package:xullo/features/company/domain/entities/company.dart';

class CompanyDataSourceRestImpl extends CompanyDataSource {
  final Dio dio;
  CompanyDataSourceRestImpl({required this.dio});
  @override
  Future<Company> createCompany(Company company) async {
    try{
      final companyModel = CompanyModel.fromEntity(company);
      final response = await dio.post('/companies',data: companyModel.toJson());
      return CompanyModel.fromJson(response.data['data']);

    }catch(e){ rethrow;}
  }

  @override
  Future<Company> deleteCompany(String id) async {
    try{
      final response = await dio.delete('/companies/$id');
      return CompanyModel.fromJson(response.data['data']);

    }catch(e){ rethrow;}
  }

  @override
  Future<List<Company>> getAllCompanies() async {
    try{
      final response = await dio.get('/companies');
      final data = response.data['data'] as List;
      final list = data.map((e) => CompanyModel.fromJson(e)).toList();
      return list;

    }catch(e){ rethrow;}
  }

  @override
  Future<Company> getCompanyById(String id) async {
    try{
      final response = await dio.get('/companies/$id');
      return CompanyModel.fromJson(response.data['data']);

    }catch(e){ rethrow;}
  }

  @override
  Future<Company> updateCompany(String id, Object data) async {
    try{
      final response = await dio.put('/companies/$id',data: data);
      return CompanyModel.fromJson(response.data['data']);

    }catch(e){ rethrow;}
  }
  
}
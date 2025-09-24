
import 'package:xullo/features/company/domain/repositories/company_repo.dart';
import 'package:xullo/features/company/presentation/controller/company/state/company_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/company.dart';

part 'company_provider.g.dart';

@Riverpod(keepAlive: true)
class CompanyNotifier extends _$CompanyNotifier {
  late CompanyRepo _companyRepo;
  @override
  CompanyState build() {
    _companyRepo = ref.read(companyRepositoryProvider);
    return const CompanyState.initial();
  }

  Future<void> getAllCompanies() async {
    state = const CompanyState.loading();
    final result = await _companyRepo.getAllCompanies();
    state = result.fold(
          (error) => CompanyState.error(error),
          (companies) => CompanyState.success(companies),
    );
  }
  Future<Company?> getCompanyById(String uid) async {
    final result = await _companyRepo.getCompanyById(uid);
    return result.fold(
          (error) {
        state = CompanyState.error(error);
        return null;
      },
          (company) {
        return company;
      },
    );
  }
  Future<void> createCompany(Company company) async {
    state = const CompanyState.loadingForm();
    final result = await _companyRepo.createCompany(company);
    state = result.fold(
          (error) => CompanyState.error(error),
          (newCompany){
            return CompanyState.create(newCompany);
          },
    );
  }

  Future<void> updateCompany(String uid, Object updatedCompany) async {
    state = const CompanyState.loadingForm();
    final result = await _companyRepo.updateCompany(uid, updatedCompany);
    state = result.fold(
          (error) => CompanyState.error(error),
          (company) {
        return CompanyState.update(company);
      },
    );
  }

  Future<void> deleteCompany(String uid) async {
    state = const CompanyState.loading();

    final result = await _companyRepo.deleteCompany(uid);

    state = result.fold(
          (error) => CompanyState.error(error),
          (company) {
        return CompanyState.delete(company);
      },
    );
  }

}

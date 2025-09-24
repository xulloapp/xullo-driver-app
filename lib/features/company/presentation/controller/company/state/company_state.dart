import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../../core/handlers/error-handler/error_handler.dart';
import '../../../../domain/entities/company.dart';

part 'company_state.freezed.dart';

@freezed
class CompanyState with _$CompanyState {
  const factory CompanyState.initial() = _Initial;
  const factory CompanyState.loading() = _Loading;
  const factory CompanyState.loadingForm() = _LoadingForm;
  const factory CompanyState.success(List<Company> companies) = _Success;
  const factory CompanyState.create(Company company) = _Create;
  const factory CompanyState.update(Company company) = _Update;
  const factory CompanyState.delete(Company company) = _Delete;
  const factory CompanyState.error(CustomError message) = _Error;
}

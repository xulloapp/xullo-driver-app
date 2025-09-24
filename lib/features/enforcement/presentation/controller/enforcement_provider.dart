
import 'package:xullo/features/company/domain/repositories/company_repo.dart';
import 'package:xullo/features/company/presentation/controller/company/state/company_state.dart';
import 'package:xullo/features/enforcement/presentation/controller/state/enforcement_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/enforcement.dart';
import '../../domain/repositories/enforcement_repo.dart';


part 'enforcement_provider.g.dart';

@Riverpod(keepAlive: true)
class EnforcementNotifier extends _$EnforcementNotifier {
  late EnforcementRepo _enforcementRepo;
  @override
  EnforcementState build() {
    _enforcementRepo = ref.read(enforcementRepositoryProvider);
    return const EnforcementState.initial();
  }

  Future<void> createEnforcement(Enforcement enforcement) async {
    state = const EnforcementState.loading();
    final result = await _enforcementRepo.createEnforcement(enforcement);
    state = result.fold(
          (error) => EnforcementState.error(error),
          (newCompany){
        return EnforcementState.create(newCompany);
      },
    );
  }

}

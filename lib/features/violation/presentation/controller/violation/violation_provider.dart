
import 'package:xullo/features/violation/domain/repositories/violation_repo.dart';
import 'package:xullo/features/violation/presentation/controller/violation/state/violation_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'violation_provider.g.dart';

@Riverpod(keepAlive: true)
class ViolationNotifier extends _$ViolationNotifier {
  late ViolationRepo _violationRepo;
  @override
  ViolationState build() {
    _violationRepo = ref.read(violationRepositoryProvider);
    return const ViolationState.initial();
  }

  Future<void> getAllViolation() async {
    state = const ViolationState.loading();
    final result = await _violationRepo.getAllViolation();
    state = result.fold(
          (error) => ViolationState.error(error),
          (violation) => ViolationState.success(violation),
    );
  }

}

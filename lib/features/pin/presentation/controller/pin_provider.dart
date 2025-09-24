import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/features/pin/presentation/controller/state/pin_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/domain/repositories/auth_repo.dart';

part 'pin_provider.g.dart';

@Riverpod(keepAlive: true)
class PinNotifier extends _$PinNotifier {
  late AuthRepo _authRepo;
  @override
  PinState build() {
    _authRepo = ref.read(authRepositoryProvider);
    return const PinState.initial();
  }

  Future<void> verifyPin(String pin) async {
    state = const PinState.loading();
    final result = await _authRepo.verifyPin(pin);
    state = result.fold((error) => PinState.error(error),
            (Unit) => const PinState.success());
  }
}

final pinVerifiedProvider = StateProvider<bool>((ref) => false);
final pendingRedirectProvider = StateProvider<String?>((ref) => null);


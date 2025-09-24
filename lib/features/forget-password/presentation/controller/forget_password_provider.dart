import 'package:xullo/features/forget-password/presentation/controller/state/forget_password_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/forget_password_repo.dart';



part 'forget_password_provider.g.dart';

@Riverpod(keepAlive: true)
class ForgetpasswordNotifier extends _$ForgetpasswordNotifier {
  late ForgetpasswordRepo _forgetpasswordRepo;
  @override
  ForgetpasswordState build() {
    _forgetpasswordRepo = ref.read(forgetpasswordRepositoryProvider);
    return const ForgetpasswordState.initial();
  }

  Future<void> sendEmail(String email) async {
    state = const ForgetpasswordState.loading();
    final result = await _forgetpasswordRepo.sendEmail(email);
    state = result.fold(
          (error) => ForgetpasswordState.error(error),
          (data){
        return ForgetpasswordState.send(data);
      },
    );
  }

  Future<void> resetPassword(String email,String otp, String password) async {
    state = const ForgetpasswordState.loading();
    final result = await _forgetpasswordRepo.resetPassword(email,otp,password);
    state = result.fold(
          (error) => ForgetpasswordState.error(error),
          (_){
        return ForgetpasswordState.success();
      },
    );
  }

}

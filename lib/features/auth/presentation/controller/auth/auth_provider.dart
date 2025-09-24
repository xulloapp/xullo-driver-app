import 'package:dartz/dartz.dart';
import 'package:xullo/core/handlers/error-handler/error_handler.dart';
import 'package:xullo/features/auth/presentation/controller/auth/state/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/repositories/auth_repo.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  late AuthRepo _authRepo;
  @override
  AuthState build() {
    _authRepo = ref.read(authRepositoryProvider);
    getCurrentUser(useLoading: true);
    return const AuthState.initial();
  }

  Future<void> signIn(String email, String password) async {
    state = const AuthState.signingIn();
    final result = await _authRepo.signInWithEmailAndPassword(email, password);

    state = result.fold((error) => AuthState.errorSigningIn(error),
            (user) => AuthState.success(user));
  }

  Future<void> signUp(User user) async {
    state = const AuthState.signingUp();
    final result = await _authRepo.signUp(user);
    state = result.fold((error) => AuthState.errorSigningUp(error),
            (user) => AuthState.success(user));
  }

  Future<void> signOut() async {
    final result = await _authRepo.signOut();
    state = result.fold((error) => AuthState.signingIn(),
            (user) => AuthState.initial());
  }

  Future<User?> getCurrentUser({bool useLoading = false}) async {
    if (useLoading) state = const AuthState.gettingSignedInUser();
    final result = await _authRepo.getSignedInUser();
    return result.fold((CustomError sd) {
      return null;
    }, (User user) {
      state = AuthState.success(user);
      return user;
    });
  }
}

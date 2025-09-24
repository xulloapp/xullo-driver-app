part of 'router.dart';

Future<String?> handleRedirect(BuildContext context, GoRouterState state,Ref<Object?> ref) async {
  final isSignin = state.matchedLocation == RouteNames.signIn;
  final isSignup = state.matchedLocation == RouteNames.signUp;
  final isSplashScreen = state.matchedLocation == RouteNames.splash;
  final goingToPin = state.matchedLocation == RouteNames.pin;
  final isForgetPassword = state.matchedLocation == RouteNames.forget_password;
  final isPinVerified = ref.read(pinVerifiedProvider);

  if (isSignup || isSignin || isSplashScreen || isForgetPassword) {
    return null;
  }


  final isAuthenticated = _isAuthenticated(ref);

  if (!isAuthenticated) {
    ref.read(pendingRedirectProvider.notifier).state = state.uri.toString();
    return RouteNames.splash;
  }

  if (isAuthenticated && !isPinVerified && !goingToPin) {
    ref.read(pendingRedirectProvider.notifier).state = state.uri.toString();
    return RouteNames.splash;
  }



  return null;
}

bool _isAuthenticated(Ref<Object?> ref) {
  final user = ref.read(authNotifierProvider).maybeWhen(
    success: (user) => user,
    orElse: () => null,
  );
  return user != null;
}
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/features/auth/presentation/controller/auth/state/auth_state.dart';
import '../../../../core/configs/router-configs/router_name.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../core/validators/index.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../forget-password/presentation/screen/components/form.dart';
import '../../../pin/presentation/controller/pin_provider.dart';
import '../controller/auth/auth_provider.dart';

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = useMemoized(() => GlobalKey<FormBuilderState>());
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 1500),
    );
    final slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOutQuart,
    ));
    final fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOutQuart,
    ));

    useEffect(() {
      animationController.forward();
      return null;
    }, []);


    ref.listen(authNotifierProvider, (prev, next) {
      next.maybeWhen(
          errorSigningIn: (message) {
            _formKey.currentState?.fields['email']?.invalidate(message.response['error']);
            _formKey.currentState?.fields['password']?.invalidate(message.response['error']);
            ErrorToaster.showError(context, message: message.message);
          },
          orElse: () {},
          success: (user) async {
            ref.read(pinVerifiedProvider.notifier).state = true;
            const storage = FlutterSecureStorage();
            await storage.write(key: 'isLoggedIn', value: 'true');
            final notification = await storage.read(key: 'notification-permission');
            if (notification == null || notification == 'false') {
              context.goNamed(RouteNames.notificationPermission);
              return;
            }
            context.goNamed(RouteNames.dashboard);
          });
    });
    Future<void> onSignIn() async {
      if (_formKey.currentState?.saveAndValidate() != true) return;
      final formData = _formKey.currentState!.value;
      await ref
          .read(authNotifierProvider.notifier)
          .signIn(formData['email'], formData['password']);
    }

    return Scaffold(
      body: SafeArea(
        child: FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: FormBuilder(
                key: _formKey,
                initialValue: {
                  "email": "admin@xullo.com",
                  "password": "Admin@123"
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 40),
                    // Icon(
                    //   Icons.fitness_center,
                    //   size: 80,
                    //   color: Theme.of(context).colorScheme.primary,
                    // ),
                    Image.asset("assets/icon/logo-white.png",height: 128,width: 128),
                    const SizedBox(height: 24),
                    Text(
                      'Welcome Back!',
                      style:
                      Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sign in to continue your journey',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                    CustomTextField(
                      name: "email",
                      validators: AppValidators.email,
                      hintText: "Email",
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      name: "password",
                      validators: AppValidators.password,
                      hintText: "Password",
                      obscureText: true,
                    ),
                    const SizedBox(height: 24),
                    AppButton(
                      onPressed: onSignIn,
                      text: 'Sign In',
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        context.pushNamed(RouteNames.signUp);
                      },
                      child: Text.rich(
                        TextSpan(
                          text: 'Don\'t have an account? ',
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ForgetpasswordFormDialog.show(context);
                      },
                      child: Text.rich(
                        TextSpan(
                          text: 'Forget Password ?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

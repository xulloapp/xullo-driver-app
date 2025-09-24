import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/core/helpers/index.dart';
import 'package:xullo/core/widgets/custom_date.dart';
import 'package:xullo/features/auth/data/user/user.dart';
import 'package:xullo/features/auth/presentation/controller/auth/state/auth_state.dart';
import '../../../../core/configs/router-configs/router_name.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../core/validators/index.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../controller/auth/auth_provider.dart';
import '../../../../core/widgets/app_button.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});

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

    Future<void> onSignUp() async {
      if (_formKey.currentState?.saveAndValidate() != true) return;
      final formData = _formKey.currentState!.value;
      await ref.read(authNotifierProvider.notifier).signUp(
        UserModel.fromJson(formData)
      );
    }

    ref.listen(authNotifierProvider, (prev, next) {
      next.maybeWhen(
          errorSigningUp: (error) {
            handleFieldErrors(context, _formKey, error.response);
          },
          orElse: () {},
          success: (user) async {
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 40),
                    Image.asset("assets/icon/logo-white.png",height: 128,width: 128),
                    const SizedBox(height: 24),
                    Text(
                      'Create Account',
                      style:
                      Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Start your journey today',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                    CustomTextField(
                      name: "first_name",
                      validators: AppValidators.onlyString,
                      hintText: "First Name",
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      name: "last_name",
                      validators: AppValidators.onlyString,
                      hintText: "Last Name",
                    ),
                    const SizedBox(height: 16),
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
                    const SizedBox(height: 16),
                    CustomTextField.number(
                      name: "pin",
                      validators: AppValidators.pin,
                      hintText: "Pin",
                      maxLength: 6,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField.number(
                      name: "phone",
                      validators: AppValidators.phone,
                      hintText: "Phone",
                      maxLength: 11,
                    ),
                    const SizedBox(height: 16),
                    CustomDateField(
                      name: "dob",
                      label: "DoB",
                      validators: AppValidators.date,
                      hintText: "DoB",
                      isDOB: true,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      name: "license",
                      validators: AppValidators.license,
                      hintText: "License",
                    ),
                    const SizedBox(height: 16),
                    CustomTextField.number(
                      name: "license_version",
                      validators: AppValidators.licenseVersion,
                      hintText: "License Version",
                      maxLength: 3,
                    ),
                    const SizedBox(height: 16),
                    CustomDateField(
                      name: "license_expiry",
                      validators: AppValidators.date,
                      hintText: "License Expiry",
                    ),
                    const SizedBox(height: 24),
                    AppButton(
                      text: 'Create Account',
                      onPressed: onSignUp,
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        context.pushNamed(RouteNames.signIn);
                      },
                      child: Text.rich(
                        TextSpan(
                          text: 'Already have an account? ',
                          children: [
                            TextSpan(
                              text: 'Sign In',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
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

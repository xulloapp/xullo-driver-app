import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/core/configs/router-configs/router_name.dart';
import 'package:xullo/core/widgets/app_button.dart';
import 'package:xullo/features/forget-password/presentation/controller/state/forget_password_state.dart';
import '../../../../core/helpers/index.dart';
import '../../../../core/validators/index.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../controller/forget_password_provider.dart';

class ForgetpasswordScreen extends HookConsumerWidget {
  final String extra;
  ForgetpasswordScreen({super.key, required this.extra});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isModified = useState(false);
    final initialValues = useRef<Map<String, dynamic>>({});
    final isLoading = useState(false);
    final isSendingOtp = useState(false);

    final resendSeconds = useState(0);
    Timer? timer;

    void startResendTimer() {
      resendSeconds.value = 60; // 1 minute
      timer?.cancel();
      timer = Timer.periodic(const Duration(seconds: 1), (t) {
        if (resendSeconds.value > 0) {
          resendSeconds.value--;
        } else {
          t.cancel();
        }
      });
    }

    useEffect(() {
      // start timer immediately when page opens
      startResendTimer();

      // cleanup timer when widget is disposed
      return () {
        timer?.cancel();
      };
    }, []);
    ref.listen(forgetpasswordNotifierProvider, (prev, next) {
      next.maybeWhen(
        error: (error) {
          isLoading.value = false;
          handleFieldErrors(context, _formKey, error.response);
        },
        send: (data) {
          startResendTimer();
          isLoading.value = false;
        },
        success: () {
          context.go(RouteNames.signIn);
          isLoading.value = false;
        },
        loading: () {
          isLoading.value = true;
        },
        orElse: () {},
      );
    });

    void checkIfModified(Map<String, dynamic> currentValues) {
      final modified = currentValues.entries.any((entry) {
        final key = entry.key;
        final currentValue = entry.value?.toString().trim();
        final originalValue = initialValues.value[key]?.toString().trim();
        return currentValue != originalValue;
      });
      isModified.value = modified;
    }

    Future<void> handleSubmit() async {
      final formState = _formKey.currentState;

      if (formState?.saveAndValidate() ?? false) {
        final formData = formState!.value;
        await ref
            .read(forgetpasswordNotifierProvider.notifier)
            .resetPassword(extra, formData['otp'], formData['password']);
        isModified.value = false;
      }
    }

    Future<void> handleResendOtp() async {
      if (isSendingOtp.value) return; // prevent multiple clicks
      isSendingOtp.value = true;

      try {
        await ref
            .read(forgetpasswordNotifierProvider.notifier)
            .sendEmail(extra);
        // timer will auto start in listener on "send"
      } finally {
        // allow button again if error happened
        isSendingOtp.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("change password")),
        leading: IconButton(
          onPressed: () {
            context.go(RouteNames.signIn);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            FormBuilder(
              key: _formKey,
              initialValue: initialValues.value,
              onChanged: () {
                final currentValues = _formKey.currentState?.instantValue ?? {};
                checkIfModified(currentValues);
              },
              child: Column(
                children: [
                  CustomTextField.number(
                    name: "otp",
                    allCapital: true,
                    validators: AppValidators.pin,
                    hintText: "OTP",
                    maxLength: 6,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    name: "password",
                    validators: AppValidators.password,
                    hintText: "Password",
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    name: "confirm_password",
                    validators: [
                      AppValidators.confirmPassword(
                        () => _formKey.currentState?.value['password'],
                      ),
                    ],
                    obscureText: true,
                    hintText: "Confirm Password",
                  ),
                  const SizedBox(height: 16),
                  // Resend OTP button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: resendSeconds,
                        builder: (context, seconds, _) {
                          final isDisabled = seconds > 0 || isSendingOtp.value;
                          return TextButton(
                            onPressed: isDisabled ? null : handleResendOtp,
                            child: isSendingOtp.value
                                ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                                : (seconds == 0
                                ? const Text("Resend OTP")
                                : Text("Resend OTP in ${seconds}s")),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ValueListenableBuilder(
                    valueListenable: isModified,
                    builder: (context, value, _) {
                      return AppButton(
                        onPressed: value ? handleSubmit : null,
                        disable: !value,
                        text: "Update Password",
                        isLoading: isLoading.value,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

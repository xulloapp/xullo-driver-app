import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/core/widgets/app_button.dart';
import 'package:xullo/features/profile/presentation/profile/profile_provider.dart';
import 'package:xullo/features/profile/presentation/profile/state/profile_state.dart';

import '../../../../core/helpers/index.dart';
import '../../../../core/validators/index.dart';
import '../../../../core/widgets/custom_date.dart';
import '../../../../core/widgets/custom_textfield.dart';

class ProfileScreen extends HookConsumerWidget {
  ProfileScreen({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isModified = useState(false);
    final initialValues = useRef<Map<String, dynamic>>({});
    final isLoading = useState(true);

    useEffect(() {
      Future.microtask(() {
        ref.read(profileNotifierProvider.notifier).getCurrentUser();
      });
      return null;
    }, []);
    ref.listen(profileNotifierProvider, (prev, next) {
      next.maybeWhen(
        error: (error) {
          handleFieldErrors(context, _formKey, error.response);
        },
        success: (user) {
          initialValues.value = {
            'first_name': user.first_name,
            'last_name': user.last_name,
            'email': user.email,
            'pin': user.pin,
            'phone': user.phone,
            'dob': DateTime.tryParse(user.dob),
          };

          isLoading.value = false;
        },
        loading: () {
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

        final changedFields = <String, dynamic>{};
        formData.forEach((key, value) {
          if (value?.toString().trim() !=
              initialValues.value[key]?.toString().trim()) {
            changedFields[key] = value;
          }
        });

        if (changedFields.isNotEmpty) {
          await ref
              .read(profileNotifierProvider.notifier)
              .updateUser(changedFields);
          isModified.value = false;
        }
      }
    }

    return Scaffold(
      body: isLoading.value
          ? const Center(child: CircularProgressIndicator())
          :RefreshIndicator(
        onRefresh: () async {
          isLoading.value = true;
          await ref.read(profileNotifierProvider.notifier).getCurrentUser();
        },
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                FormBuilder(
                  key: _formKey,
                  initialValue: initialValues.value,
                  onChanged: () {
                    final currentValues =
                        _formKey.currentState?.instantValue ?? {};
                    checkIfModified(currentValues);
                  },
                  child: Column(
                    children: [
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
                        enabled: true,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField.number(
                        name: "pin",
                        validators: AppValidators.pin,
                        hintText: "Pin",
                        obscureText: true,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField.number(
                        name: "phone",
                        validators: AppValidators.phone,
                        hintText: "Phone",
                      ),
                      const SizedBox(height: 16),
                      CustomDateField(
                        name: "dob",
                        validators: AppValidators.date,
                        hintText: "Dob",
                      ),
                      const SizedBox(height: 24),
                      ValueListenableBuilder(
                        valueListenable: isModified,
                        builder: (context, value, _) {
                          return AppButton(
                            onPressed: value ? handleSubmit : null,
                            disable: !value,
                            text: "Update Profile",
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:xullo/core/configs/router-configs/router_name.dart';
import 'package:xullo/features/forget-password/presentation/controller/state/forget_password_state.dart';
import '../../../../../core/helpers/index.dart';
import '../../../../../core/validators/index.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import '../../controller/forget_password_provider.dart';


class ForgetpasswordFormDialog extends ConsumerStatefulWidget {
  const ForgetpasswordFormDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => ForgetpasswordFormDialog(),
    );
  }

  @override
  ConsumerState<ForgetpasswordFormDialog> createState() => _CompanyFormDialogState();
}

class _CompanyFormDialogState extends ConsumerState<ForgetpasswordFormDialog> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _isModified = ValueNotifier(false);
  var isLoadingForm = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _handleSubmit() async {
    final formState = _formKey.currentState;

    if (formState?.saveAndValidate() ?? false) {
      final formData = formState!.value;

      await ref
          .read(forgetpasswordNotifierProvider.notifier)
          .sendEmail(formData['email']);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(forgetpasswordNotifierProvider, (prev, next) {
      next.maybeWhen(
          error: (error) {
            setState(() => isLoadingForm = false);
            handleFieldErrors(context,_formKey,error.response);
          },
          loading: (){
            setState(() => isLoadingForm = true);
          },
          send: (data){
            setState(() => isLoadingForm = false);
            // Navigator.pop(context);
            context.go(RouteNames.forget_password,extra: (data as Map<dynamic, dynamic>)['email']);
          },
          orElse: () {});
    });
    return AlertDialog(
      title: Text("Forget Password"),
      content: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          onChanged: () {
            final currentValues = _formKey.currentState?.instantValue ?? {};
            final hasChanged = currentValues.entries.any((entry) {
              return (entry.value?.toString().trim().isNotEmpty ?? false);
            });
            _isModified.value = hasChanged;
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              CustomTextField(
                name: "email",
                validators: AppValidators.email,
                hintText: "Enter email",
                obscureText: false,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: _isModified,
          builder: (context, isEnabled, _) {
            return TextButton(
              onPressed: isEnabled && !isLoadingForm ? _handleSubmit : null,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: isEnabled ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                disabledForegroundColor: isEnabled ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: isLoadingForm ? SizedBox(
                width: 20, // Set desired width
                height: 20, // Set desired height
                child: CircularProgressIndicator(
                  strokeWidth: 2, // Optional: makes the circle thinner
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ) : Text("Submit"),
            );
          },
        ),
      ],
    );
  }
}

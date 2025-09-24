import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/features/company/presentation/controller/company/state/company_state.dart';

import '../../../../../core/helpers/index.dart';
import '../../../../../core/validators/index.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import '../../../data/company/company_model.dart';
import '../../../domain/entities/company.dart';
import '../../controller/company/company_provider.dart';


class CompanyFormDialog extends ConsumerStatefulWidget {
  final String? uid;

  const CompanyFormDialog({super.key, this.uid});

  static Future<void> show(BuildContext context, {String? uid}) {
    return showDialog(
      context: context,
      builder: (context) => CompanyFormDialog(uid: uid),
    );
  }

  @override
  ConsumerState<CompanyFormDialog> createState() => _CompanyFormDialogState();
}

class _CompanyFormDialogState extends ConsumerState<CompanyFormDialog> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _isModified = ValueNotifier(false);
  var isLoadingForm = false;

  Company? company;
  bool isLoading = true;
  late bool isEdit;
  Map<String, dynamic> initialValues = {};

  @override
  void initState() {
    super.initState();
    _loadCompany();
  }

  Future<void> _loadCompany() async {
    if (widget.uid != null && widget.uid!.isNotEmpty) {
      company = await ref.read(companyNotifierProvider.notifier).getCompanyById(widget.uid!);
    }

    isEdit = company != null;
    initialValues = {
      'name': company?.name ?? '',
      'email': company?.email ?? '',
    };

    setState(() => isLoading = false);
  }

  Future<void> _handleSubmit() async {
    final formState = _formKey.currentState;

    if (formState?.saveAndValidate() ?? false) {
      final formData = formState!.value;

      if (isEdit) {
        final changedFields = <String, dynamic>{};
        formData.forEach((key, value) {
          if (value?.toString().trim() != initialValues[key]?.toString().trim()) {
            changedFields[key] = value;
          }
        });

        if (changedFields.isNotEmpty) {
          await ref
              .read(companyNotifierProvider.notifier)
              .updateCompany(company!.uid.toString(), changedFields);
        }
      } else {
        await ref
            .read(companyNotifierProvider.notifier)
            .createCompany(CompanyModel.fromJson(formData));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const Center(child: CircularProgressIndicator());

    ref.listen(companyNotifierProvider, (prev, next) {
      next.maybeWhen(
          error: (error) {
            setState(() => isLoadingForm = false);
            handleFieldErrors(context,_formKey,error.response);
          },
          create: (company){
            setState(() => isLoadingForm = false);
            Navigator.pop(context);
          },
          update: (company){
            setState(() => isLoadingForm = false);
            Navigator.pop(context);
          },
          loadingForm: (){
            setState(() => isLoadingForm = true);
          },
          orElse: () {});
    });
    return AlertDialog(
      title: Text(isEdit ? "Edit Company" : "Add Company"),
      content: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          initialValue: initialValues,
          onChanged: () {
            final currentValues = _formKey.currentState?.instantValue ?? {};
            final hasChanged = currentValues.entries.any((entry) {
              return isEdit
                  ? entry.value?.toString().trim() != initialValues[entry.key]?.toString().trim()
                  : (entry.value?.toString().trim().isNotEmpty ?? false);
            });
            _isModified.value = hasChanged;
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                name: "name",
                validators: AppValidators.onlyString,
                hintText: "Enter Violation name",
                obscureText: false,
              ),
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
              onPressed: isEnabled ? _handleSubmit : null,
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
              ) : Text(isEdit ? "Update" : "Submit"),
            );
          },
        ),
      ],
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/features/company/domain/entities/company.dart';
import 'package:xullo/features/company/presentation/controller/company/company_provider.dart';
import 'package:xullo/features/company/presentation/controller/company/state/company_state.dart';
import 'package:xullo/features/log/domain/entities/log.dart';
import 'package:xullo/features/log/presentation/controller/state/log_state.dart';

import '../../../../../core/configs/router-configs/router_name.dart';
import '../../../../../core/helpers/index.dart';
import '../../../../../core/validators/index.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/custom_dropdown.dart';
import '../../../../../core/widgets/custom_redio_field.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import '../../controller/log_provider.dart';

class FormPage3 extends HookConsumerWidget {
  final Log extra;
  const FormPage3({super.key, required this.extra});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storage = const FlutterSecureStorage();

    useEffect(() {
      Future.microtask(() => ref.read(companyNotifierProvider.notifier).getAllCompanies());
      return null;
    },[]);

    final formKey = GlobalKey<FormBuilderState>();
    final _selfEmployed = ValueNotifier(false);
    final _newVehicle = ValueNotifier(false);
    final isLoading = useState(false);

    final companies = ref.watch(companyNotifierProvider.select((state) {
      return state.maybeWhen(
        success: (companies) => companies,
        orElse: () => <Company>[],
      );
    }));

    final dropdownItems = companies
        .map((type) => DropdownMenuItem(
      value: type.uid.toString(),
      child: Text(type.name),
    ))
        .toList();

    ref.listen(logNotifierProvider, (prev, next) {
      next.maybeWhen(
          error: (error) {
            isLoading.value = false;
            handleFieldErrors(context, formKey, error.response);
          },
          orElse: () {},
          loadingForm3: (){
            isLoading.value = true;
          },
          createForm3: (data) async {
            isLoading.value = false;
            if (data.vehicle_id != null && data.vehicle_id.toString().trim().isNotEmpty) {
              await storage.write(key: 'vehicle_id', value: data.vehicle_id.toString());
            }

            if (data.company_id != null && data.company_id.toString().trim().isNotEmpty) {
              await storage.write(key: 'company_id', value: data.company_id.toString());
            }
            if (data.type.toString().trim().isNotEmpty) {
              await storage.write(key: 'type', value: data.type.toString());
            }
            context.go(RouteNames.log,extra: data.trip_id.toString());
          });
    });
    return Scaffold(
      appBar: AppBar(title: Text("Company Information"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: FormBuilder(
            key: formKey,
            initialValue: {
              "company_type": 1
            },
            onChanged: (){
              final currentValues = formKey.currentState?.instantValue ?? {};
              _selfEmployed.value = currentValues['company_type'] != 2 ? false : true;
              _newVehicle.value = currentValues['company_type'] == 3 ? true : false;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomRadioGroupField(
                  name: 'company_type',
                  options: const [
                    FormBuilderFieldOption(value: 1, child: Text('Self-Employed')),
                    FormBuilderFieldOption(value: 2, child: Text('Existed Company')),
                    FormBuilderFieldOption(value: 3, child: Text('New Company')),
                  ],
                  disabledValues: [companies.isNotEmpty ? null : 2],
                ),
                SizedBox(height: 16,),
                ValueListenableBuilder<bool>(
                  valueListenable: _selfEmployed,
                  builder: (context, isDrivingOn, _) {
                    if (!isDrivingOn) return const SizedBox.shrink();
                    return Column(
                      children: [
                        CustomDropdown(
                          name: "company_id",
                          items: dropdownItems,
                          hintText: "",
                          validators: AppValidators.dropdown,
                        )
                      ],
                    );
                  },
                ),

                ValueListenableBuilder<bool>(
                  valueListenable: _newVehicle,
                  builder: (context, isDrivingOn, _) {
                    if (!isDrivingOn) return const SizedBox.shrink();
                    return Column(
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
                    );
                  },
                ),

                const SizedBox(height: 16),
                AppButton(text: "Submit", onPressed: (){
                  if(formKey.currentState?.saveAndValidate() == true){
                    final formData = Map<String, dynamic>.from(formKey.currentState!.value);
                    final isCompany = formData['company_type'] !=1 ? true : false;
                    final isNewCompany = formData['company_type'] == 3 ? true : false;
                    if (!isCompany) {
                      formData.remove('company_id');
                      formData.remove('name');
                      formData.remove('email');
                    }
                    if(isNewCompany){
                      formData.remove('company_id');
                    }
                    formData.remove('company_type');
                    ref.read(logNotifierProvider.notifier).createForm3({
                      ...formData,
                      "log_id": extra.uid,
                    });
                  }

                },isLoading: isLoading.value,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

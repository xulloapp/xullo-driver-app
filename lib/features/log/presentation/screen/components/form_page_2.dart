import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/core/configs/router-configs/router_name.dart';
import 'package:xullo/core/widgets/custom_switch.dart';
import 'package:xullo/features/log/domain/entities/log.dart';
import 'package:xullo/features/log/presentation/controller/state/log_state.dart';
import 'package:xullo/features/vehicle/domain/entities/vehicle.dart';
import 'package:xullo/features/vehicle/presentation/controller/vehicle/state/vehicle_state.dart';

import '../../../../../core/helpers/index.dart';
import '../../../../../core/validators/index.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/custom_dropdown.dart';
import '../../../../../core/widgets/custom_redio_field.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import '../../../../vehicle/domain/entities/vehicle_type.dart';
import '../../../../vehicle/presentation/controller/vehicle/vehicle_provider.dart';
import '../../../../vehicle/presentation/controller/vehicle/vehicle_type_provider.dart';
import '../../controller/log_provider.dart';

class FormPage2 extends HookConsumerWidget {
  final Log extra;
  const FormPage2({super.key, required this.extra});



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    useEffect(() {
      Future.microtask(() => ref.read(vehicleNotifierProvider.notifier).getAllVehicles());
      Future.microtask(() => ref.read(vehicleTypeNotifierProvider.notifier).getAllVehicleTypes());
      return null;
    },[]);

    final formKey = GlobalKey<FormBuilderState>();
    final _drivingEnabled = ValueNotifier(false);
    final _newVehicle = ValueNotifier(true);
    final _rucEnabled = ValueNotifier(false);
    final isLoading = useState(false);

    final vehicles = ref.watch(vehicleNotifierProvider.select((state) {
      return state.maybeWhen(
        success: (vehicles) => vehicles,
        orElse: () => <Vehicle>[],
      );
    }));

    final vehicleTypes = ref.watch(vehicleTypeNotifierProvider.select((state) {
      return state.maybeWhen(
        success: (types) => types,
        orElse: () => <VehicleType>[],
      );
    }));

    final dropdownItems = vehicles
        .map((type) => DropdownMenuItem(
      value: type.uid.toString(),
      child: Text(type.registration),
    ))
        .toList();

      final dropdownItemsVehicleType = vehicleTypes
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
          loadingForm2: (){
            isLoading.value = true;
          },
          createForm2: (data) {
            isLoading.value = false;
            context.goNamed(RouteNames.form3,extra: data);
          });
    });
    return Scaffold(
      appBar: AppBar(title: Text("Vehicle Information"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: FormBuilder(
            key: formKey,
            initialValue: {
              "driving_type": 3,
              "ruc": false,
              "odometer": "0"
            },
            onChanged: (){
              final currentValues = formKey.currentState?.instantValue ?? {};
              _drivingEnabled.value = currentValues['driving_type'] != 2 ? false : true;
              _newVehicle.value = currentValues['driving_type'] == 3 ? true : false;
              _rucEnabled.value = currentValues['ruc'] ?? false;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // CustomSwitchField(
                //     name: "driving",
                //     title: "driving"),
                // const SizedBox(height: 16),
                CustomRadioGroupField(
                  name: 'driving_type',
                  options: const [
                    FormBuilderFieldOption(value: 3, child: Text('New Vehicle')),
                    FormBuilderFieldOption(value: 2, child: Text('Existed Vehicle')),
                    FormBuilderFieldOption(value: 1, child: Text('Other Work')),
                  ],
                  disabledValues: [vehicles.isNotEmpty ? null : 2],
                ),
                SizedBox(height: 16,),
                ValueListenableBuilder<bool>(
                  valueListenable: _drivingEnabled,
                  builder: (context, isDrivingOn, _) {
                    if (!isDrivingOn) return const SizedBox.shrink();
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      CustomDropdown(
                      name: "vehicle_id",
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
                          name: "registration",
                          validators: AppValidators.onlyString,
                          hintText: "Enter Registration",
                          obscureText: false,
                        ),
                        const SizedBox(height: 16),
                        CustomDropdown(
                          name: "type_id",
                          items: dropdownItemsVehicleType,
                          hintText: "",
                          validators: AppValidators.dropdown,
                        ),
                        const SizedBox(height: 16),

                        // ✅ Conditionally render odometer based on RUC
                        ValueListenableBuilder<bool>(
                          valueListenable: _rucEnabled,
                          builder: (context, isRucOn, _) {
                            if (!isRucOn) return const SizedBox.shrink();
                            return Column(
                              children: [
                                CustomTextField.number(
                                  name: "odometer",
                                  validators: AppValidators.odometer,
                                  hintText: "Enter odometer",
                                  maxLength: 6,
                                ),
                                const SizedBox(height: 16),
                              ],
                            );
                          },
                        ),

                        CustomSwitchField(
                          name: "ruc",
                          title: "Is RUC Enabled?",
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 16),
                AppButton(text: "Next", onPressed: (){
                  if(formKey.currentState?.saveAndValidate() == true){
                    final formData = Map<String, dynamic>.from(formKey.currentState!.value);
                    final isDriving = formData['driving_type'] !=1 ? true : false;
                    final isNewVehicle = formData['driving_type'] == 3 ? true : false;
                    if (!isDriving) {
                      formData.remove('vehicle_id');
                      formData.remove('registration');
                      formData.remove('type_id');
                      formData.remove('odometer');
                      formData.remove('ruc');
                    }
                    if(isNewVehicle){
                      formData.remove('vehicle_id');
                      if(formData['ruc'] == false){
                        formData.remove('odometer');
                      }
                    }
                    formData.remove('driving_type');
                    ref.read(logNotifierProvider.notifier).createForm2({
                      ...formData,
                      "log_id": extra.uid,
                    });
                  }
                },isLoading: isLoading.value,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

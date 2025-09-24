import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xullo/features/company/presentation/controller/company/state/company_state.dart';
import 'package:xullo/features/log/presentation/controller/state/log_state.dart';
import 'package:xullo/features/vehicle/presentation/controller/vehicle/state/vehicle_state.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../../../../core/helpers/index.dart';
import '../../../../../core/validators/index.dart';
import '../../../../../core/widgets/custom_date.dart';
import '../../../../../core/widgets/custom_dropdown.dart';
import '../../../../../core/widgets/custom_redio_field.dart';
import '../../../../../core/widgets/custom_switch.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import '../../../../company/domain/entities/company.dart';
import '../../../../company/presentation/controller/company/company_provider.dart';
import '../../../../vehicle/domain/entities/vehicle.dart';
import '../../../../vehicle/domain/entities/vehicle_type.dart';
import '../../../../vehicle/presentation/controller/vehicle/vehicle_provider.dart';
import '../../../../vehicle/presentation/controller/vehicle/vehicle_type_provider.dart';
import '../../../domain/entities/log.dart';
import '../../controller/log_provider.dart';

class LogFormScreen extends StatefulHookConsumerWidget {
  final String trip_id;
  final String? uid;

  const LogFormScreen({super.key, required this.trip_id, this.uid});

  @override
  LogFormScreenState createState() => LogFormScreenState();
}

class LogFormScreenState extends ConsumerState<LogFormScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _isModified = ValueNotifier(false);
  var isLoadingForm = false;

  Log? log;
  bool isLoading = true;
  late bool isEdit;
  Map<String, dynamic> initialValues = {};
  final _isWork = ValueNotifier(true);
  final _drivingEnabled = ValueNotifier(false);
  final _newVehicle = ValueNotifier(false);
  final _rucEnabled = ValueNotifier(false);
  final _selfEmployed = ValueNotifier(false);
  final _newCompany = ValueNotifier(false);

  final storage = FlutterSecureStorage();

  bool savedType = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        ref.read(vehicleNotifierProvider.notifier).getAllVehicles(),
        ref.read(vehicleTypeNotifierProvider.notifier).getAllVehicleTypes(),
        ref.read(companyNotifierProvider.notifier).getAllCompanies(),
      ]);
      _loadLog(); // safe to update state after lists load
    });
  }

  Future<void> _loadLog() async {
    if (widget.uid != null && widget.uid!.isNotEmpty) {
      log = await ref
          .read(logNotifierProvider.notifier)
          .getLogById(widget.uid!);
    }

    isEdit = log != null;
    final type = log?.type ?? false;
    final vehicle = log?.vehicle_id?.trim().isNotEmpty ?? false;
    final company = log?.company_id?.trim().isNotEmpty ?? false;

    String? savedVehicleId;
    String? savedCompanyId;

    if (!isEdit) {
      savedVehicleId = await storage.read(key: 'vehicle_id');
      savedCompanyId = await storage.read(key: 'company_id');
      savedType = await storage.read(key: 'type').then((value) => value == 'true' ? true : false);
    }

    final hasSavedVehicleId = savedVehicleId != null && savedVehicleId.trim().isNotEmpty;
    final hasSavedCompanyId = savedCompanyId != null && savedCompanyId.trim().isNotEmpty;

    initialValues = {
      'start_date': log?.start_date != null ? DateTime.parse(log!.start_date) : tz.TZDateTime.now(tz.local).toUtc(),
      'location': log?.location ?? '',
      'type': !isEdit ? !savedType : log?.type ?? false,
      'driving_type': (vehicle || hasSavedVehicleId) ? 2 : 1,
      'vehicle_id': log?.vehicle_id ?? (hasSavedVehicleId ? savedVehicleId : ''),
      'ruc': false,
      'company_type': (company || hasSavedCompanyId) ? 2 : 1,
      'company_id': log?.company_id ?? (hasSavedCompanyId ? savedCompanyId : ''),
      'comment': log?.comment ?? '',
    };
    _isWork.value = isEdit ? !type : savedType;
    _drivingEnabled.value = (vehicle || hasSavedVehicleId);
    _selfEmployed.value = (company || hasSavedCompanyId);

    setState(() => isLoading = false);
  }

  Future<void> _handleSubmit() async {
    final formState = _formKey.currentState;

    if (formState?.saveAndValidate() ?? false) {
      final formData = Map<String, dynamic>.from(_formKey.currentState!.value);
      final isWork = formData['type'] == false ? true : false;
      final isDriving = formData['driving_type'] != 1 ? true : false;
      final isNewVehicle = formData['driving_type'] == 3 ? true : false;
      final isCompany = formData['company_type'] != 1 ? true : false;
      final isNewCompany = formData['company_type'] == 3 ? true : false;

      formData['driving'] = isDriving == true ? true : false;
      formData['self_employed'] = !isCompany;

      if (isWork) {
        if (!isDriving) {
          formData.remove('vehicle_id');
          formData.remove('registration');
          formData.remove('type_id');
          formData.remove('odometer');
          formData.remove('ruc');
        }
        if (isNewVehicle) {
          formData.remove('vehicle_id');
          if (formData['ruc'] == false) {
            formData.remove('odometer');
          }
        } else {
          formData.remove('registration');
          formData.remove('type_id');
          formData.remove('odometer');
          formData.remove('ruc');
        }
        formData.remove('driving_type');
        if (!isCompany) {
          formData.remove('company_id');
          formData.remove('name');
          formData.remove('email');
        }
        if (isNewCompany) {
          formData.remove('company_id');
        } else {
          formData.remove('name');
          formData.remove('email');
        }
        formData.remove('company_type');
      } else {
        formData.remove('vehicle_id');
        formData.remove('registration');
        formData.remove('type_id');
        formData.remove('odometer');
        formData.remove('ruc');
        formData.remove('company_id');
        formData.remove('name');
        formData.remove('email');
        formData.remove('company_type');
        formData.remove('driving_type');
      }
      if (isEdit) {
        final changedFields = <String, dynamic>{};
        formData.forEach((key, value) {
          if (value?.toString().trim() !=
              initialValues[key]?.toString().trim()) {
            changedFields[key] = value;
          }
        });
        if (changedFields.isNotEmpty) {
          await ref
              .read(logNotifierProvider.notifier)
              .updateFullForm(log!.uid.toString(), changedFields);
        }
      } else {
        await ref
            .read(logNotifierProvider.notifier)
            .createFullForm({
          ...formData,
          "trip_id": widget.trip_id,
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    final companies = ref.watch(
      companyNotifierProvider.select((state) {
        return state.maybeWhen(
          success: (companies) => companies,
          orElse: () => <Company>[],
        );
      }),
    );

    final vehicles = ref.watch(
      vehicleNotifierProvider.select((state) {
        return state.maybeWhen(
          success: (vehicles) => vehicles,
          orElse: () => <Vehicle>[],
        );
      }),
    );

    final vehicleTypes = ref.watch(
      vehicleTypeNotifierProvider.select((state) {
        return state.maybeWhen(
          success: (types) => types,
          orElse: () => <VehicleType>[],
        );
      }),
    );

    final companiesList = ref.watch(
      companyNotifierProvider.select((state) {
        return state.maybeWhen(
          success: (companies) => companies,
          orElse: () => <Company>[],
        );
      }),
    );

    final dropdownItems = vehicles
        .map(
          (type) => DropdownMenuItem(
        value: type.uid.toString(),
        child: Text(type.registration),
      ),
    )
        .toList();

    final dropdownItemsVehicleType = vehicleTypes
        .map(
          (type) => DropdownMenuItem(
        value: type.uid.toString(),
        child: Text(type.name),
      ),
    )
        .toList();

    final dropdownItemsCompany = companiesList
        .map(
          (type) => DropdownMenuItem(
        value: type.uid.toString(),
        child: Text(type.name),
      ),
    )
        .toList();

    ref.listen(logNotifierProvider, (prev, next) {
      next.maybeWhen(
        errorFullForm: (error) {
          setState(() => isLoadingForm = false);
          handleFieldErrors(context, _formKey, error.response);
        },
        createFullForm: (log) async{
          if (log.vehicle_id != null && log.vehicle_id.toString().trim().isNotEmpty) {
            await storage.write(key: 'vehicle_id', value: log.vehicle_id.toString());
          }

          if (log.company_id != null && log.company_id.toString().trim().isNotEmpty) {
            await storage.write(key: 'company_id', value: log.company_id.toString());
          }
          if (log.type.toString().trim().isNotEmpty) {
            await storage.write(key: 'type', value: log.type.toString());
          }
          setState(() => isLoadingForm = false);
          Navigator.pop(context);
        },
        updateFullForm: (log) async{
          setState(() => isLoadingForm = false);
        },
        loadingFullForm: () {
          setState(() => isLoadingForm = true);
        },
        orElse: () {},
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Log Form"),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: FormBuilder(
            key: _formKey,
            initialValue: initialValues,
            onChanged: () {
              // Use a post-frame callback to safely update the ValueNotifiers
              WidgetsBinding.instance.addPostFrameCallback((_) {
                final currentValues =
                    _formKey.currentState?.instantValue ?? {};
                final hasChanged = currentValues.entries.any((entry) {
                  return isEdit
                      ? entry.value?.toString().trim() !=
                      initialValues[entry.key]?.toString().trim()
                      : (entry.value?.toString().trim().isNotEmpty ??
                      false);
                });
                _isModified.value = hasChanged;

                // Check if the keys exist before accessing them to prevent potential errors
                if (currentValues.containsKey('type')) {
                  _isWork.value =
                      currentValues['type'] == false; // false = Work
                }

                if (currentValues.containsKey('driving_type')) {
                  _drivingEnabled.value =
                  currentValues['driving_type'] != 2 ? false : true;
                }

                if (currentValues.containsKey('driving_type')) {
                  _newVehicle.value = currentValues['driving_type'] == 3
                      ? true
                      : false;
                }

                if (currentValues.containsKey('ruc')) {
                  _rucEnabled.value = currentValues['ruc'] ?? false;
                }

                if (currentValues.containsKey('company_type')) {
                  _selfEmployed.value = currentValues['company_type'] != 2
                      ? false
                      : true;
                }

                if (currentValues.containsKey('company_type')) {
                  _newCompany.value = currentValues['company_type'] == 3
                      ? true
                      : false;
                }
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomDateField(
                    name: 'start_date',
                    inputType: InputType.time,
                    hintText: "current date and time",
                    validators: AppValidators.date),
                const SizedBox(height: 16),
                CustomTextField(
                  name: "location",
                  validators: AppValidators.onlyString,
                  hintText: "Enter location",
                  obscureText: false,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  name: "comment",
                  validators: [],
                  hintText: "Enter comment",
                  obscureText: false,
                ),
                const SizedBox(height: 16),
                CustomRadioGroupField(
                  name: 'type',
                  title: "At this time I?",
                  options: const [
                    FormBuilderFieldOption(
                      value: true,
                      child: Text('Rest'),
                    ),
                    FormBuilderFieldOption(
                      value: false,
                      child: Text('Work'),
                    ),
                  ],
                  disabledValues: [isEdit ? !log!.type : savedType],
                ),
                SizedBox(height: 16),
                ValueListenableBuilder<bool>(
                  valueListenable: _isWork,
                  builder: (context, isWork, _) {
                    if (!isWork) return const SizedBox.shrink();
                    return Column(
                      children: [
                        const SizedBox(height: 16),
                        CustomRadioGroupField(
                          name: 'driving_type',
                          title: "Work type?",
                          options: const [
                            FormBuilderFieldOption(
                              value: 1,
                              child: Text('Other Work'),
                            ),
                            FormBuilderFieldOption(
                              value: 2,
                              child: Text('Existed Vehicle'),
                            ),
                            FormBuilderFieldOption(
                              value: 3,
                              child: Text('New Vehicle'),
                            ),
                          ],
                          disabledValues: [
                            vehicles.isNotEmpty ? null : 2,
                          ],
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: _drivingEnabled,
                          builder: (context, isDrivingOn, _) {
                            if (!isDrivingOn) return const SizedBox.shrink();
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 16),
                                CustomDropdown(
                                  name: "vehicle_id",
                                  items: dropdownItems,
                                  hintText: "",
                                  validators: AppValidators.dropdown,
                                ),
                              ],
                            );
                          },
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: _newVehicle,
                          builder: (context, isDrivingOn, _) {
                            if (!isDrivingOn)
                              return const SizedBox.shrink();
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 16),
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
                                    if (!isRucOn)
                                      return const SizedBox.shrink();
                                    return Column(
                                      children: [
                                        CustomTextField.number(
                                          name: "odometer",
                                          validators:
                                          AppValidators.odometer,
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
                        CustomRadioGroupField(
                          name: 'company_type',
                          title: "Drive for?",
                          options: const [
                            FormBuilderFieldOption(
                              value: 1,
                              child: Text('Self-Employed'),
                            ),
                            FormBuilderFieldOption(
                              value: 2,
                              child: Text('Existed Company'),
                            ),
                            FormBuilderFieldOption(
                              value: 3,
                              child: Text('New Company'),
                            ),
                          ],
                          disabledValues: [
                            companies.isNotEmpty ? null : 2,
                          ],
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: _selfEmployed,
                          builder: (context, isDrivingOn, _) {
                            if (!isDrivingOn)
                              return const SizedBox.shrink();
                            return Column(
                              children: [
                                SizedBox(height: 16),
                                CustomDropdown(
                                  name: "company_id",
                                  items: dropdownItemsCompany,
                                  hintText: "",
                                  validators: AppValidators.dropdown,
                                ),
                              ],
                            );
                          },
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: _newCompany,
                          builder: (context, isDrivingOn, _) {
                            if (!isDrivingOn)
                              return const SizedBox.shrink();
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 16),
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
                      ],
                    );
                  },
                ),
                SizedBox(height: 20),
                ValueListenableBuilder<bool>(
                  valueListenable: _isModified,
                  builder: (context, isEnabled, _) {
                    return TextButton(
                      onPressed: isEnabled ? _handleSubmit : null,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: isEnabled
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondary,
                        disabledForegroundColor: isEnabled
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      child: isLoadingForm
                          ? SizedBox(
                        width: 20, // Set desired width
                        height: 20, // Set desired height
                        child: CircularProgressIndicator(
                          strokeWidth:
                          2, // Optional: makes the circle thinner
                          color: Theme.of(
                            context,
                          ).colorScheme.inversePrimary,
                        ),
                      )
                          : Text(isEdit ? "Update" : "Submit"),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

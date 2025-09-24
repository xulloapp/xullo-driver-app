import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xullo/core/widgets/custom_dropdown.dart';
import 'package:xullo/features/vehicle/data/vehicle/vehicle_model.dart';
import 'package:xullo/features/vehicle/domain/entities/vehicle.dart' hide VehicleType;
import 'package:xullo/features/vehicle/presentation/controller/vehicle/state/vehicle_state.dart';
import 'package:xullo/features/vehicle/presentation/controller/vehicle/vehicle_provider.dart';
import 'package:xullo/features/vehicle/presentation/controller/vehicle/vehicle_type_provider.dart';

import '../../../../../core/helpers/index.dart';
import '../../../../../core/validators/index.dart';
import '../../../../../core/widgets/custom_switch.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import '../../../domain/entities/vehicle_type.dart';

class VehicleFormDialog extends ConsumerStatefulWidget {
  final String? uid;

  const VehicleFormDialog({super.key, this.uid});

  static Future<void> show(BuildContext context, {String? uid}) {
    return showDialog(
      context: context,
      builder: (context) => ProviderScope(
        child: VehicleFormDialog(uid: uid),
      ),
    );
  }

  @override
  ConsumerState<VehicleFormDialog> createState() => _VehicleFormDialogState();
}

class _VehicleFormDialogState extends ConsumerState<VehicleFormDialog> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _isModified = ValueNotifier(false);
  final _rucEnabled = ValueNotifier(false); // ✅ NEW
  var isLoadingForm = false;

  Vehicle? vehicle;
  bool isLoading = true;
  late bool isEdit;
  Map<String, dynamic> initialValues = {};

  @override
  void initState() {
    super.initState();
    _loadVehicle();
  }

  Future<void> _loadVehicle() async {
    if (widget.uid != null && widget.uid!.isNotEmpty) {
      vehicle = await ref.read(vehicleNotifierProvider.notifier).getVehicleById(widget.uid!);
    }

    isEdit = vehicle != null;
    initialValues = {
      'registration': vehicle?.registration ?? '',
      'type_id': vehicle?.type_id ?? '',
      'odometer': vehicle?.odometer?.toString() ?? '0',
      'ruc': vehicle?.ruc ?? false,
    };

    _rucEnabled.value = vehicle?.ruc ?? false; // ✅ Set initial

    setState(() => isLoading = false);
  }

  Future<void> _handleSubmit() async {
    final formState = _formKey.currentState;

    if (formState?.saveAndValidate() ?? false) {
      final formData = Map<String, dynamic>.from(formState!.value);

      // ✅ Remove odometer if RUC is off
      final isRuc = formData['ruc'] == true;
      if (!isRuc) {
        formData.remove('odometer');
      }

      if (isEdit) {
        final changedFields = <String, dynamic>{};
        formData.forEach((key, value) {
          if (value?.toString().trim() != initialValues[key]?.toString().trim()) {
            changedFields[key] = value;
          }
        });

        if (changedFields.isNotEmpty) {
          await ref
              .read(vehicleNotifierProvider.notifier)
              .updateVehicle(vehicle!.uid.toString(), changedFields);
        }
      } else {
        await ref
            .read(vehicleNotifierProvider.notifier)
            .createVehicle(VehicleModel.fromJson(formData));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final vehicleTypes = ref.watch(vehicleTypeNotifierProvider.select((state) {
      return state.maybeWhen(
        success: (types) => types,
        orElse: () => <VehicleType>[],
      );
    }));

    ref.listen(vehicleNotifierProvider, (prev, next) {
      next.maybeWhen(
        error: (error) {
          setState(() => isLoadingForm = false);
          handleFieldErrors(context, _formKey, error.response);
        },
        create: (_) {
          setState(() => isLoadingForm = false);
          Navigator.pop(context);
          },
        update: (_) {
          setState(() => isLoadingForm = false);
          Navigator.pop(context);
        } ,
        loadingForm: (){
          setState(() => isLoadingForm = true);
        },
        orElse: () {},
      );
    });

    final dropdownItems = vehicleTypes
        .map((type) => DropdownMenuItem(
      value: type.uid.toString(),
      child: Text(type.name),
    ))
        .toList();

    if (isLoading) return const Center(child: CircularProgressIndicator());

    return AlertDialog(
      title: Text(isEdit ? "Edit Vehicle" : "Add Vehicle"),
      content: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          initialValue: initialValues,
          onChanged: () {
            final currentValues = _formKey.currentState?.instantValue ?? {};
            _rucEnabled.value = currentValues['ruc'] ?? false;

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
                name: "registration",
                validators: AppValidators.onlyString,
                hintText: "Enter Registration",
                obscureText: false,
              ),
              const SizedBox(height: 16),
              CustomDropdown(
                name: "type_id",
                items: dropdownItems,
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

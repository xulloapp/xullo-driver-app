import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

import '../helpers/index.dart';

class CustomDateField extends HookWidget {
  final String name;
  final String? label;
  final String hintText;
  final InputType inputType;
  final List<FormFieldValidator<DateTime>> validators;
  final bool isDOB; // new param to identify DOB fields

  const CustomDateField({
    super.key,
    required this.name,
    this.label,
    required this.hintText,
    required this.validators,
    this.inputType = InputType.date,
    this.isDOB = false, // default false
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = inputType == InputType.date
        ? DateFormat('yyyy-MM-dd')
        : inputType == InputType.time
        ? DateFormat('hh:mm a')
        : DateFormat('yyyy-MM-dd hh:mm a');

    final suffixIcon = inputType == InputType.time
        ? const Icon(Icons.access_time)
        : const Icon(Icons.calendar_today);

    // Set DOB limits if isDOB is true
    final DateTime now = tz.TZDateTime.now(tz.local);
    final DateTime minDOB = DateTime(now.year - 100, now.month, now.day);
    final DateTime maxDOB = now; // no future dates

    return FormBuilderDateTimePicker(
      name: name,
      inputType: inputType,
      validator: FormBuilderValidators.compose([
        ...validators,
        if (isDOB) (val) {
          if (val == null) return null;
          if (val.isAfter(maxDOB)) return 'Date of birth cannot be in the future';
          if (val.isBefore(minDOB)) return 'Date of birth is too far in the past';
          return null;
        }
      ]),
      format: dateFormat,
      valueTransformer: (val) {
        if (val == null) return null;

        DateTime utcValue;
        if (inputType == InputType.time) {
          final now = tz.TZDateTime.now(tz.local).toUtc();
          utcValue = DateTime.utc(
            now.year,
            now.month,
            now.day,
            val.hour,
            val.minute,
          );
        } else {
          utcValue = val.toUtc();
        }
        return utcValue.toIso8601String();
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        label: Text(label == null ? prettifyLabel(name) : label.toString()),
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        fillColor: Theme.of(context).colorScheme.secondary,
        filled: true,
        suffixIcon: suffixIcon,
      ),

      // This disables future dates in the UI picker when it's a DOB field
      lastDate: isDOB ? maxDOB : null,
      firstDate: isDOB ? minDOB : null,
    );
  }
}


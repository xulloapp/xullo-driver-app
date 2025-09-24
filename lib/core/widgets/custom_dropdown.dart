import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../helpers/index.dart';

class CustomDropdown extends StatelessWidget {
  final String name;
  final String hintText;
  final List<DropdownMenuItem<String>> items;
  final List<FormFieldValidator<String>> validators;

  const CustomDropdown({
    super.key,
    required this.name,
    required this.hintText,
    required this.items,
    required this.validators,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<String>(
      name: name,
      validator: FormBuilderValidators.compose(validators),
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
        label: Text(prettifyLabel(name)),
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        fillColor: Theme.of(context).colorScheme.secondary,
        filled: true,
      ),
      items: items,
    );
  }
}

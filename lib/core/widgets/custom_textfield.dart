import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter/services.dart';

import '../helpers/index.dart';

class CustomTextField extends HookWidget {
  final String name;
  final String hintText;
  final bool obscureText;
  final bool enabled;
  final List<FormFieldValidator<String>> validators;
  final TextInputType inputType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;

  const CustomTextField({
    super.key,
    required this.name,
    this.hintText = '',
    this.obscureText = false,
    this.enabled = true,
    required this.validators,
    this.inputType = TextInputType.text,
    this.inputFormatters,
    this.maxLength,
  });

  /// Shortcut constructor for number-only input
  CustomTextField.number({
    super.key,
    required this.name,
    required this.hintText,
    this.enabled = true,
    required this.validators,
    this.obscureText = false,
    this.maxLength,
  })  : inputType = TextInputType.number,
        inputFormatters = [FilteringTextInputFormatter.digitsOnly];

  @override
  Widget build(BuildContext context) {
    final isPasswordVisible = useState(false);
    final theme = Theme.of(context).colorScheme;

    return FormBuilderTextField(
      name: name,
      enabled: enabled,
      maxLength: maxLength,
      validator: FormBuilderValidators.compose(validators),
      obscureText: obscureText && !isPasswordVisible.value,
      keyboardType: inputType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.tertiary),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.primary),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.error),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.error),
          borderRadius: BorderRadius.circular(12),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.tertiary.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        label: Text(prettifyLabel(name)),
        hintStyle: TextStyle(
          color: theme.primary.withOpacity(0.8),
        ),
        fillColor: theme.secondary.withOpacity(enabled ? 1 : 0.3),
        filled: true,
        suffixIcon: obscureText
            ? IconButton(
          icon: Icon(
            isPasswordVisible.value
                ? Icons.visibility_off
                : Icons.visibility,
          ),
          onPressed: () =>
          isPasswordVisible.value = !isPasswordVisible.value,
        )
            : null,
      ),
    );
  }
}
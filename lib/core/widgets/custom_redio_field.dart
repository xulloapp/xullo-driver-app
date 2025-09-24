import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomRadioGroupField<T> extends StatelessWidget {
  final String name;
  final String? title;
  final List<FormBuilderFieldOption<T>> options;
  final String? hintText;
  final T? initialValue;
  final bool wrapInCard;
  final List<T>? disabledValues; // Add this

  const CustomRadioGroupField({
    super.key,
    required this.name,
    this.title,
    required this.options,
    this.hintText,
    this.initialValue,
    this.wrapInCard = false,
    this.disabledValues,
  });

  @override
  Widget build(BuildContext context) {
    final radioGroup = FormBuilderField<T>(
      name: name,
      validator: FormBuilderValidators.required(),
      initialValue: initialValue,
      builder: (FormFieldState<T?> field) {
        return InputDecorator(
          decoration: InputDecoration.collapsed(hintText: hintText ?? ''),
          child: Column(
            children: options.map((option) {
              final isDisabled = disabledValues?.contains(option.value) ?? false;
              return RadioListTile<T>(
                value: option.value,
                groupValue: field.value,
                onChanged: isDisabled ? null : (val) => field.didChange(val),
                title: option.child,
                contentPadding: EdgeInsets.zero,
                activeColor: Theme.of(context).colorScheme.primary,
              );
            }).toList(),
          ),
        );
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Text(title!, style: Theme.of(context).textTheme.titleMedium)
            : const SizedBox.shrink(),
        title != null
            ?const SizedBox(height: 8) : const SizedBox.shrink(),
        wrapInCard ? Card(child: radioGroup) : radioGroup,
      ],
    );
  }
}
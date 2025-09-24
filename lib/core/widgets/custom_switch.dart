import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomSwitchField extends StatelessWidget {
  final String name;
  final String? hintText;
  final String title;

  const CustomSwitchField({
    super.key,
    required this.name,
    this.hintText = "",
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderSwitch(
      name: name,
      title: Text(title),
      activeColor: Theme.of(context).colorScheme.primary,
      decoration: InputDecoration.collapsed(hintText: hintText), // removes underline spacing
    );
  }
}

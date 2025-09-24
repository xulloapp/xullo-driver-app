
import 'package:flutter/cupertino.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AppValidators {

  static final email = [
    FormBuilderValidators.required(),
    FormBuilderValidators.email(errorText: "requires a valid email")
  ];

  static final dropdown = [
    FormBuilderValidators.required(errorText: "Please select an option"),
  ];

  static final pin = [
    FormBuilderValidators.required(),
    FormBuilderValidators.minLength(6),
    FormBuilderValidators.maxLength(6)
  ];

  static final phone = [
    FormBuilderValidators.required(),
    FormBuilderValidators.maxLength(11)
  ];

  static final date = [
    FormBuilderValidators.required(),
  ];

  static final license = [
    FormBuilderValidators.required(),
    FormBuilderValidators.minLength(5)
  ];

  static final licenseVersion = [
    FormBuilderValidators.required(),
    FormBuilderValidators.minLength(3),
    FormBuilderValidators.maxLength(3)
  ];

  static final odometer = [
    FormBuilderValidators.required(),
    FormBuilderValidators.minLength(6),
    FormBuilderValidators.maxLength(6)
  ];

  static final licenseExpiry = [
    FormBuilderValidators.required(),
    FormBuilderValidators.date(),
  ];

  static final password = [
    FormBuilderValidators.required(),
    FormBuilderValidators.minLength(7, errorText: 'Minimum 7 characters required'),
        (String? value) {
      if (value == null) return null;

      if (!value.contains(RegExp(r'[A-Z]'))) {
        return 'Must contain at least one uppercase letter';
      }
      if (!value.contains(RegExp(r'[a-z]'))) {
        return 'Must contain at least one lowercase letter';
      }
      if (!value.contains(RegExp(r'\d'))) {
        return 'Must contain at least one number';
      }

      return null;
    }
  ];


  static final onlyString = [
    FormBuilderValidators.required(),
  ];

  static final Stringnotrequire = [
    FormBuilderValidators.alphabetical(),
  ];

  static FormFieldValidator<String> confirmPassword(String Function() getPassword) {
    return (valueCandidate) {
      if (valueCandidate == null || valueCandidate.isEmpty) return 'Required';
      if (valueCandidate != getPassword()) return 'Passwords do not match';
      return null;
    };
  }


}
import 'package:xullo/features/company/domain/entities/company.dart';

import '../../domain/entities/enforcement.dart';

class EnforcementModel extends Enforcement {
  const EnforcementModel({
    required super.name,
    required super.email,
    required super.selected,
  });

  // ✅ fromJson
  factory EnforcementModel.fromJson(Map<String, dynamic> json) {
    return EnforcementModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      selected: json['selected'] ?? [],
    );
  }


  // ✅ toJson
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'selected': selected,
    };
  }

  // ✅ copyWith
  EnforcementModel copyWith({
    String? name,
    String? email,
    List<String>? selected,
  }) {
    return EnforcementModel(
      name: name ?? this.name,
      email: email ?? this.email,
      selected: selected ?? this.selected,
    );
  }

  // ✅ fromEntity
  factory EnforcementModel.fromEntity(Enforcement enforcement) {
    return EnforcementModel(
      name: enforcement.name,
      email: enforcement.email,
      selected: enforcement.selected,
    );
  }
}

import 'package:xullo/features/company/domain/entities/company.dart';

class CompanyModel extends Company {
  const CompanyModel({
    required super.uid,
    required super.id,
    required super.name,
    required super.email,
  });

  // ✅ fromJson
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      uid: json['\$id'] ?? '',
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()) ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }


  // ✅ toJson
  Map<String, dynamic> toJson() {
    return {
      '\$id': uid,
      'id': id,
      'name': name,
      'email': email,
    };
  }

  // ✅ copyWith
  CompanyModel copyWith({
    String? uid,
    int? id,
    String? name,
    String? email,
  }) {
    return CompanyModel(
      uid: uid ?? this.uid,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  // ✅ fromEntity
  factory CompanyModel.fromEntity(Company company) {
    return CompanyModel(
      uid: company.uid,
      id: company.id,
      name: company.name,
      email: company.email,
    );
  }
}

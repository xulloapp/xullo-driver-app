import 'package:xullo/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.email,
    required super.password,
    required super.pin,
    required super.first_name,
    required super.last_name,
    required super.phone,
    required super.dob,
    required super.license,
    required super.license_version,
    required super.license_expiry,
    super.isAuthenticated = false,
    super.fcm,
  });

  // ✅ fromJson
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] ?? '',
      password: json['password'] ?? '', // ❗️never return password from API
      pin: json['pin'] ?? '',
      first_name: json['first_name'] ?? '',
      last_name: json['last_name'] ?? '',
      phone: json['phone'] ?? '',
      dob: json['dob'],
      license: json['license'] ?? '',
      license_version: json['license_version'] ?? '',
      license_expiry: json['license_expiry'],
      isAuthenticated: true,
      fcm: json['fcm'],
    );
  }


  // ✅ toJson
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'pin': pin,
      'first_name': first_name,
      'last_name': last_name,
      'phone': phone,
      'dob': dob,
      'license': license,
      'license_version': license_version,
      'license_expiry': license_expiry,
      'isAuthenticated': isAuthenticated,
      'fcm': fcm,
    };
  }

  // ✅ copyWith
  UserModel copyWith({
    String? email,
    String? password,
    String? pin,
    String? first_name,
    String? last_name,
    String? phone,
    String? dob,
    String? license,
    String? license_version,
    String? license_expiry,
    bool? isAuthenticated,
    String? fcm,
  }) {
    return UserModel(
      email: email ?? this.email,
      password: password ?? this.password,
      pin: pin ?? this.pin,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      phone: phone ?? this.phone,
      dob: dob ?? this.dob,
      license: license ?? this.license,
      license_version: license_version ?? this.license_version,
      license_expiry: license_expiry ?? this.license_expiry,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      fcm: fcm ?? this.fcm,
    );
  }

  // ✅ fromEntity
  factory UserModel.fromEntity(User user) {
    return UserModel(
      email: user.email,
      password: user.password,
      pin: user.pin,
      first_name: user.first_name,
      last_name: user.last_name,
      phone: user.phone,
      dob: user.dob,
      license: user.license,
      license_version: user.license_version,
      license_expiry: user.license_expiry,
      isAuthenticated: user.isAuthenticated,
      fcm: user.fcm,
    );
  }
}

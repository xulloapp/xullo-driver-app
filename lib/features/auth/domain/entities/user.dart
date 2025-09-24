
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String password;
  final String pin;
  final String first_name;
  final String last_name;
  final String phone;
  final String dob;
  final String license;
  final String license_version;
  final String license_expiry;
  final bool isAuthenticated;
  final String? fcm;

  const User({
     required this.email,
     required this.password,
     required this.pin,
     required this.first_name,
     required this.last_name,
     required this.phone,
     required this.dob,
     required this.license,
     required this.license_version,
     required this.license_expiry,
    this.isAuthenticated = false,
    this.fcm,

  });

  @override
  List<Object?> get props => [email, password, pin, first_name, last_name, phone, dob, license, license_version, license_expiry, isAuthenticated,fcm];

}
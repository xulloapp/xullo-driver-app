

import 'dart:ffi';

import 'package:xullo/features/vehicle/domain/entities/vehicle.dart';

class VehicleModel extends Vehicle {
  const VehicleModel({
    required super.uid,
    required super.id,
    required super.registration,
    required super.type_id,
    required super.ruc,
    super.odometer,
  });

  // ✅ fromJson
  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      uid: json['\$id'] ?? '',
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()) ?? 0,
      registration: json['registration'] ?? '',
      type_id: json['type_id'] ?? '',
      ruc: json['ruc'] ?? '',
      odometer: int.tryParse(json['odometer']?.toString() ?? '0'),
    );
  }


  // ✅ toJson
  Map<String, dynamic> toJson() {
    return {
      '\$id': uid,
      'id': id,
      'registration': registration,
      'type_id': type_id,
      'ruc': ruc,
      'odometer': odometer,
    };
  }

  // ✅ copyWith
  VehicleModel copyWith({
    String? uid,
    int? id,
    String? registration,
    String? type_id,
    bool? ruc,
    int? odometer,
  }) {
    return VehicleModel(
      uid: uid ?? this.uid,
      id: id ?? this.id,
      registration: registration ?? this.registration,
      type_id: type_id ?? this.type_id,
      ruc: ruc ?? this.ruc,
      odometer: odometer ?? this.odometer,
    );
  }

  // ✅ fromEntity
  factory VehicleModel.fromEntity(Vehicle vehicle) {
    return VehicleModel(
      uid: vehicle.uid,
      id: vehicle.id,
      registration: vehicle.registration,
      type_id: vehicle.type_id,
      ruc: vehicle.ruc,
      odometer: vehicle.odometer,
    );
  }
}

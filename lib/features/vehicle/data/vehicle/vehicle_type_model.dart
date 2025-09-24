

import 'dart:ffi';

import 'package:xullo/features/vehicle/domain/entities/vehicle_type.dart';



class VehicleTypeModel extends VehicleType {
  const VehicleTypeModel({
    required super.uid,
    required super.id,
    required super.name,
    required super.group_id,
  });

  // ✅ fromJson
  factory VehicleTypeModel.fromJson(Map<String, dynamic> json) {
    return VehicleTypeModel(
      uid: json['\$id'] ?? '',
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()) ?? 0,
      name: json['name'] ?? '',
      group_id: json['group_id'] ?? '',
    );
  }


  // ✅ toJson
  Map<String, dynamic> toJson() {
    return {
      '\$id': uid,
      'id': id,
      'name': name,
      'group_id': group_id,
    };
  }

  // ✅ copyWith
  VehicleTypeModel copyWith({
    String? uid,
    int? id,
    String? name,
    String? group_id,
  }) {
    return VehicleTypeModel(
      uid: uid ?? this.uid,
      id: id ?? this.id,
      name: name ?? this.name,
      group_id: group_id ?? this.group_id,
    );
  }

  // ✅ fromEntity
  factory VehicleTypeModel.fromEntity(VehicleType vehicleType) {
    return VehicleTypeModel(
      uid: vehicleType.uid,
      id: vehicleType.id,
      name: vehicleType.name,
      group_id: vehicleType.group_id,
    );
  }
}

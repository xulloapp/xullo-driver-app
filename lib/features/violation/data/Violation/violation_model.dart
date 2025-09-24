import 'package:xullo/features/violation/domain/entities/violation.dart';

class ViolationModel extends Violation {
  const ViolationModel({
    required super.uid,
    required super.id,
    required super.type,
    required super.user_id,
    super.log_id,
    super.trip_id,
    super.created_at
    
  });

  // ✅ fromJson
  factory ViolationModel.fromJson(Map<String, dynamic> json) {
    return ViolationModel(
      uid: json['\$id'] ?? '',
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()) ?? 0,
      type: json['type'] ?? '',
      user_id: json['user_id'] ?? '',
      log_id: json['log_id'] ?? '',
      trip_id: json['trip_id'] ?? '',
      created_at: json['created_at'] ?? '',
    );
  }


  // ✅ toJson
  Map<String, dynamic> toJson() {
    return {
      '\$id': uid,
      'id': id,
      'type': type,
      'user_id': user_id,
      'log_id': log_id,
      'trip_id': trip_id,
      'created_at': created_at,
    };
  }

  // ✅ copyWith
  ViolationModel copyWith({
    String? uid,
    int? id,
    String? type,
    String? user_id,
    String? log_id,
    String? trip_id,
    String? created_at,
  }) {
    return ViolationModel(
      uid: uid ?? this.uid,
      id: id ?? this.id,
      type: type ?? this.type,
      user_id: user_id ?? this.user_id,
      log_id: log_id ?? this.log_id,
      trip_id: trip_id ?? this.trip_id,
      created_at: created_at ?? this.created_at,
    );
  }

  // ✅ fromEntity
  factory ViolationModel.fromEntity(Violation violation) {
    return ViolationModel(
      uid: violation.uid,
      id: violation.id,
      type: violation.type,
      user_id: violation.user_id,
      log_id: violation.log_id,
      trip_id: violation.trip_id,
      created_at: violation.created_at,
    );
  }
}

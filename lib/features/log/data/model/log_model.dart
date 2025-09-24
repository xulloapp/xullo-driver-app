import '../../domain/entities/log.dart';

class LogModel extends Log {
  const LogModel({
    required super.uid,
    required super.id,
    required super.trip_id,
    required super.start_date,
    super.end_date,
    required super.type,
    required super.driving,
    required super.location,
    super.notes,
    super.vehicle_id,
    super.odometer,
    super.company_id,
    super.comment

  });

  // ✅ fromJson
  factory LogModel.fromJson(Map<String, dynamic> json) {
    return LogModel(
      uid: json['\$id'] ?? '',
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()) ?? 0,
      trip_id: json['trip_id'] ?? '',
      start_date: json['start_date'] ?? '',
      end_date: json['end_date'] ?? '',
      type: json['type'] ?? false,
      driving: json['driving'] ?? false,
      location: json['location'] ?? '',
      notes: json['notes'] ?? '',
      vehicle_id: json['vehicle_id'] ?? '',
      odometer: json['odometer'] is int ? json['odometer'] : int.tryParse(json['odometer'].toString()) ?? 0,
      company_id: json['company_id'] ?? '',
      comment: json['comment'] ?? '',
    );
  }


  // ✅ toJson
  Map<String, dynamic> toJson() {
    return {
      '\$id': uid,
      'id': id,
      'trip_id': trip_id,
      'start_date': start_date,
      'end_date': end_date,
      'type': type,
      'driving': driving,
      'location': location,
      'notes': notes,
      'vehicle_id': vehicle_id,
      'odometer': odometer,
      'company_id': company_id,
      'comment': comment,
    };
  }

  // ✅ copyWith
  LogModel copyWith({
    String? uid,
    int? id,
    String? trip_id,
    String? start_date,
    String? end_date,
    bool? type,
    bool? driving,
    String? location,
    String? notes,
    String? vehicle_id,
    int? odometer,
    String? company_id,
    String? comment,

  }) {
    return LogModel(
      uid: uid ?? this.uid,
      id: id ?? this.id,
      trip_id: trip_id ?? this.trip_id,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
      type: type ?? this.type,
      driving: driving ?? this.driving,
      location: location ?? this.location,
      notes: notes ?? this.notes,
      vehicle_id: vehicle_id ?? this.vehicle_id,
      odometer: odometer ?? this.odometer,
      company_id: company_id ?? this.company_id,
      comment: comment ?? this.comment,
    );
  }

  // ✅ fromEntity
  factory LogModel.fromEntity(Log log) {
    return LogModel(
      uid: log.uid,
      id: log.id,
      trip_id: log.trip_id,
      start_date: log.start_date,
      end_date: log.end_date,
      type: log.type,
      driving: log.driving,
      location: log.location,
      notes: log.notes,
      vehicle_id: log.vehicle_id,
      odometer: log.odometer,
      company_id: log.company_id,
      comment: log.comment,
    );
  }
}

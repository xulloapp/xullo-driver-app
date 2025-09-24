import 'package:xullo/features/trip/domain/entities/trip.dart';

import '../../../log/data/model/log_model.dart';
import '../../../log/domain/entities/log.dart';


class TripModel extends Trip {

  const TripModel({
    required super.uid,
    required super.id,
    required super.start_date,
    super.end_date,
    super.logs ,
    super.total_rest,
    super.total_work,
    super.comment
  }) : super();

  // ✅ fromJson
  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      uid: json['\$id'] ?? '',
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,
      start_date: DateTime.parse(json['start_date'].toString()),
      end_date: json['end_date'] != null
          ? DateTime.tryParse(json['end_date'].toString())
          : null,
      logs: (json['logs'] as List<dynamic>?)
          ?.map((e) => LogModel.fromJson(e))
          .toList() ??
          [],
      total_rest: json['total_rest'] is double
          ? json['total_rest']
          : double.tryParse(json['total_rest'].toString()) ?? 0,
      total_work: json['total_work'] is double
          ? json['total_work']
          : double.tryParse(json['total_work'].toString()) ?? 0,
      comment: json['comment'] ?? '',
    );
  }

  // ✅ toJson
  Map<String, dynamic> toJson() {
    return {
      '\$id': uid,
      'id': id,
      'start_date': start_date.toIso8601String(),
      'end_date': end_date?.toIso8601String(),
      'logs': logs?.map((e) => (e as LogModel).toJson()).toList(),
      'total_rest': total_rest,
      'total_work': total_work,
      'comment': comment,
    };
  }

  // ✅ copyWith
  TripModel copyWith({
    String? uid,
    int? id,
    DateTime? start_date,
    DateTime? end_date,
    List<Log>? logs,
    double? total_rest,
    double? total_work,
    String? comment,
  }) {
    return TripModel(
      uid: uid ?? this.uid,
      id: id ?? this.id,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
      logs: logs ?? this.logs,
      total_rest: total_rest ?? this.total_rest,
      total_work: total_work ?? this.total_work,
      comment: comment ?? this.comment,
    );
  }

  // ✅ fromEntity
  factory TripModel.fromEntity(Trip trip) {
    return TripModel(
      uid: trip.uid,
      id: trip.id,
      start_date: trip.start_date,
      end_date: trip.end_date,
      logs: trip is TripModel ? trip.logs : [],
      total_rest: trip.total_rest,
      total_work: trip.total_work,
      comment: trip.comment,
    );
  }
}

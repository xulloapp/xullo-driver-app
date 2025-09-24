
import 'package:equatable/equatable.dart';

class Log extends Equatable {
  final String uid;
  final int id;
  final String trip_id;
  final String start_date;
  final String? end_date;
  final bool type;
  final bool driving;
  final String location;
  final String? notes;
  final String? vehicle_id;
  final int? odometer;
  final String? company_id;
  final String? comment;

  const Log({
    required this.uid,
    required this.id,
    required this.trip_id,
    required this.start_date,
    this.end_date,
    required this.type,
    required this.driving,
    required this.location,
    this.notes,
    this.vehicle_id,
    this.odometer,
    this.company_id,
    this.comment,


  });

  @override
  List<Object?> get props => [uid, id,trip_id, start_date, end_date, type, driving, location, notes, vehicle_id, odometer, company_id, comment];

}
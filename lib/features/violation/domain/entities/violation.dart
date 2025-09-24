
import 'package:equatable/equatable.dart';

class Violation extends Equatable {
  final String uid;
  final int id;
  final String user_id;
  final String? trip_id;
  final String? log_id;
  final String type;
  final String? created_at;



  const Violation({
    required this.uid,
    required this.id,
    required this.type,
    required this.user_id,
    this.log_id,
    this.trip_id,
    this.created_at
  });

  @override
  List<Object?> get props => [uid, id, type, user_id, log_id, trip_id, created_at];

}
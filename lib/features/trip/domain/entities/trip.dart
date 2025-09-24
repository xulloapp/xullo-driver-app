
import 'package:equatable/equatable.dart';

import '../../../log/domain/entities/log.dart';

class Trip extends Equatable {
  final String uid;
  final int id;
  final DateTime start_date;
  final DateTime? end_date;
  final List<Log> logs; // ✅ add logs to entity/model
  final double? total_rest;
  final double? total_work;
  final String? comment;

  const Trip({
    required this.uid,
    required this.id,
    required this.start_date,
    this.end_date,
    this.logs = const [],
    this.total_rest,
    this.total_work,
    this.comment,


  });

  @override
  List<Object?> get props => [uid, id, start_date, end_date,logs,total_rest,total_work,comment];

}
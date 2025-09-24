
import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Vehicle extends Equatable {
  final String uid;
  final int id;
  final String registration;
  final String type_id;
  final bool ruc;
  final int? odometer;

  const Vehicle({
    required this.uid,
    required this.id,
    required this.registration,
    required this.type_id,
    required this.ruc,
    this.odometer
  });

  @override
  List<Object?> get props => [uid, id, registration, type_id, ruc, odometer];

}
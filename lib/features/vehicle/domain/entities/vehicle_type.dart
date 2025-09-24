
import 'dart:ffi';

import 'package:equatable/equatable.dart';

class VehicleType extends Equatable {
  final String uid;
  final int id;
  final String name;
  final String group_id;

  const VehicleType({
    required this.uid,
    required this.id,
    required this.name,
    required this.group_id,
  });

  @override
  List<Object?> get props => [uid, id, name, group_id];

}
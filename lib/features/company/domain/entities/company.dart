
import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final String uid;
  final int id;
  final String name;
  final String email;

  const Company({
    required this.uid,
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  List<Object?> get props => [uid, id, name, email];

}
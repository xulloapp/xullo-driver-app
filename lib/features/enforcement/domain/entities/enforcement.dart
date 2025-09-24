
import 'package:equatable/equatable.dart';

class Enforcement extends Equatable {
  final String name;
  final String email;
  final List<String> selected;

  const Enforcement({
    required this.name,
    required this.email,
    required this.selected,
  });

  @override
  List<Object?> get props => [name, email, selected];

}
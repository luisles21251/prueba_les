
import 'package:equatable/equatable.dart';

class GenresEntity extends Equatable {
  final int ? idG;
  final String ? name;

  GenresEntity({this.idG, this.name});

  @override

  List<Object?> get props => [
    idG, name
  ];
}
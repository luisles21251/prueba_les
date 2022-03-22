

import 'package:equatable/equatable.dart';

class StudioEntity extends Equatable {
  final int ? idStudio;
  final String ? logo;
   final String ? name;

  StudioEntity({this.idStudio, this.name, this.logo});

  @override
  List<Object?> get props => [
    idStudio, name, logo
  ];


}
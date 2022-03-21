



import 'package:prueba_les/feature/domain/entities/genero_entity.dart';

class GeneroModel extends GenresEntity{
  GeneroModel ({
    int ? id,
    String ? name
}):super(idG: id, name: name);

  factory GeneroModel.formJson(Map<String,dynamic>json){
    return GeneroModel(
      id: json["id"],
      name:json["name"],
    );
  }
}
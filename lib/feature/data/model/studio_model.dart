



import 'package:prueba_les/feature/domain/entities/studio_entity.dart';

class StudioModel extends StudioEntity{
  StudioModel({
    int ? idStudio,
    String ? logo,
    String ? name,
}):super(idStudio: idStudio, name: name, logo: logo);


 factory StudioModel.fromJson(Map<String, dynamic>json){
   return StudioModel(
     idStudio: json["id"],
     logo: json["logo_path"],
     name: json["name"]
   );
 }

}
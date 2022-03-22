




import 'package:prueba_les/feature/data/model/studio_model.dart';
import 'package:prueba_les/feature/domain/entities/movie_entity.dart';

import 'genero_model.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    bool ? adult,
    String ? backDropPath,
    int ? id,
    String ? mediaType,
    String ? originalTitle,
    String ? overview,
    double ? popularity,
    String ? posterImage,
    String ? title,
    List<GeneroModel> ? genero, 
    List<StudioModel> ? studios,
    DateTime ? releaseDate,
    dynamic  vote,

}):super(adult:adult, backDropPath: backDropPath, id: id, mediaType: mediaType, originalTitle: originalTitle,
  overview: overview,generos: genero,studios: studios, posterImage: posterImage,title: title,releaseDate: releaseDate, vote: vote);


  factory MovieModel.fromJson(Map<String, dynamic>json){
    return MovieModel(
      adult: json["adult"],
      backDropPath: json["backdrop_path"],
      id: json["id"],
      mediaType: json["media_type"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      posterImage:json["poster_path"],
      genero: json.containsKey("genres") && json["genres"] != null ? (json["genres"] as List).map((e) =>GeneroModel.formJson(e)).toList():null,
      studios: json.containsKey("production_companies") && json["production_companies"] !=null ?(json["production_companies"] as List).map((e) => StudioModel.fromJson(e)).toList(): null,
      //popularity: json["popularity"],
      releaseDate: json.containsKey("release_date")&& json["release_date"] ==  DateTime && json["release_date"]  != null   ? DateTime.parse(json["release_date"]) :  DateTime.parse( "2020-02-29") ,
      title: json["title"],
      vote: json["vote_average"]
    );
  }


}
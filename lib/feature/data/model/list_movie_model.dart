




import 'package:prueba_les/feature/domain/entities/list_movies_entity.dart';

import 'movie_model.dart';

class ListMoviesModel extends ListMoviesEntity {
  ListMoviesModel({
    int ? page,
    List<MovieModel> ? movies,
    int ? totalPages,
    int ? totalResult,

}):super(
    page: page, movies: movies,totalPages: totalPages,totalResult: totalResult);

 factory ListMoviesModel.fromJson(Map<String, dynamic>json){
   return ListMoviesModel(
    page: json["page"],
     movies: json.containsKey("results") && json["results"] != null ? (json["results"] as List).map((e) => MovieModel.fromJson(e)).toList() : null,
     totalResult: json["total_results"],
     totalPages: json["total_pages"]
   );
 }



}
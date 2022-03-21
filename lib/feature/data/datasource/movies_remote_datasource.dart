

import 'package:dio/dio.dart';
import 'package:prueba_les/core/error/failures.dart';
import 'package:prueba_les/core/http/api.dart';
import 'package:prueba_les/feature/data/model/list_movie_model.dart';
import 'package:prueba_les/feature/data/model/movie_model.dart';




abstract class MoviesRemoteDataSource {
  Future<ListMoviesModel> listMovies();
  Future<MovieModel>movieDetail(int id);
  Future<ListMoviesModel>search(String data);
}

class MoviesRemoteDataSourceImpl extends ApiProvider implements MoviesRemoteDataSource{
  @override
  Future<ListMoviesModel> listMovies()async {
    try{
      final res= await dio?.get("discover/movie?api_key=68f5c2c960dd4fca9be406440e5aa4e6", options: Options(headers: {"token":true, }));
      return ListMoviesModel.fromJson(res?.data);

    }on DioError catch (error){
    throw ServerFailure(error: error).extract;
    }

  }

  @override
  Future<MovieModel> movieDetail(int id)async {
    try{
      final res= await dio?.get("movie/$id?api_key=68f5c2c960dd4fca9be406440e5aa4e6", options: Options(headers: {"token":true, }));
      return MovieModel.fromJson(res?.data);

    }on DioError catch (error){
      throw ServerFailure(error: error).extract;
    }
  }

  @override
  Future<ListMoviesModel> search(data) async{
   try{
     print(data);
     final res = await dio?.get("search/movie?api_key=68f5c2c960dd4fca9be406440e5aa4e6&query=$data");
     print("contenido en data $res");
     return ListMoviesModel.fromJson(res?.data);

   }on DioError catch (error){
     throw ServerFailure(error: error).extract;
   }
    
  }
  
  
}
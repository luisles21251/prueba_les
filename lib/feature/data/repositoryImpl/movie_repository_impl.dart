

import 'package:dartz/dartz.dart';
import 'package:prueba_les/core/error/failures.dart';
import 'package:prueba_les/feature/data/datasource/movies_remote_datasource.dart';
import 'package:prueba_les/feature/domain/entities/list_movies_entity.dart';
import 'package:prueba_les/feature/domain/entities/movie_entity.dart';
import 'package:prueba_les/feature/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository{

final MoviesRemoteDataSource ?remoteDataSource;

  MovieRepositoryImpl({this.remoteDataSource});


  @override
  Future<Either<Failure, ListMoviesEntity>> listMovies() async{
   try{
     final res = await remoteDataSource?.listMovies();
     return Right(res!);
   } on ServerFailure catch(e){
     return Left(e);
    }
  }

  @override
  Future<Either<Failure, MovieEntity>> movieDetail(int id) async{
    try{
        final res = await remoteDataSource?.movieDetail(id);
        return Right(res!);
    } on ServerFailure catch (e){
return Left(e);
    }
  }

  @override
  Future<Either<Failure, ListMoviesEntity>> searchMovie( String data)async {
    try{
      final res = await remoteDataSource?.search(data);
      return Right(res!);
    }
    on ServerFailure catch(e){
return  Left(e);
    }

  }

}
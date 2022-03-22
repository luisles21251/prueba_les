

import 'package:dartz/dartz.dart';
import 'package:prueba_les/core/error/failures.dart';
import 'package:prueba_les/core/usecases/usecase.dart';
import 'package:prueba_les/feature/domain/entities/movie_entity.dart';

import 'package:prueba_les/feature/domain/repository/movie_repository.dart';

class GetDetailMovieUseCase implements UseCase <MovieEntity, int>{

 final  MovieRepository repository;

  GetDetailMovieUseCase(this.repository);

  @override
  Future<Either<Failure, MovieEntity>> call(int params) async{
    return await repository.movieDetail(params);
  }

}
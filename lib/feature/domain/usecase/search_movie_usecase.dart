

import 'package:dartz/dartz.dart';
import 'package:prueba_les/core/error/failures.dart';
import 'package:prueba_les/core/usecases/usecase.dart';
import 'package:prueba_les/feature/domain/entities/list_movies_entity.dart';
import 'package:prueba_les/feature/domain/repository/movie_repository.dart';

class SearchMovieUseCase implements UseCase <ListMoviesEntity,String>{

 final MovieRepository repository;

  SearchMovieUseCase(this.repository);

  @override
  Future<Either<Failure, ListMoviesEntity>> call(String params)async {
    return await repository.searchMovie(params);
  }


}
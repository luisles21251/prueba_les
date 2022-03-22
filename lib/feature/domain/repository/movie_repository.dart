

import 'package:dartz/dartz.dart';
import 'package:prueba_les/core/error/failures.dart';
import 'package:prueba_les/feature/domain/entities/list_movies_entity.dart';
import 'package:prueba_les/feature/domain/entities/movie_entity.dart';

abstract class MovieRepository {
Future<Either<Failure,ListMoviesEntity>> listMovies();
Future<Either<Failure,MovieEntity>> movieDetail(int id);
Future<Either<Failure, ListMoviesEntity>>searchMovie(String data);

}
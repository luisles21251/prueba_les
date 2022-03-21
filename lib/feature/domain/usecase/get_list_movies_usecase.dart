import 'package:dartz/dartz.dart';
import 'package:prueba_les/core/error/failures.dart';
import 'package:prueba_les/core/usecases/usecase.dart';
import 'package:prueba_les/feature/domain/entities/list_movies_entity.dart';
import 'package:prueba_les/feature/domain/repository/movie_repository.dart';

class GetListMoviesUsecCase implements UseCase<ListMoviesEntity, NoParams> {
  final MovieRepository _repository;

  GetListMoviesUsecCase(this._repository);

  @override
  Future<Either<Failure, ListMoviesEntity>> call(params) async {
    return await _repository.listMovies();
  }
}

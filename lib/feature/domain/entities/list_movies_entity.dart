

import 'package:equatable/equatable.dart';

import 'movie_entity.dart';


class ListMoviesEntity extends Equatable {
final  int ? page;
final List<MovieEntity> ? movies;
final int ? totalPages;
final int ? totalResult;

  const ListMoviesEntity(
      {
      this.movies,
      this.page,
        this.totalPages,
        this.totalResult

      });

  @override

  List<Object?> get props => [
    this.movies,
    this.page,
    this.totalPages,
    this.totalResult
  ];


}
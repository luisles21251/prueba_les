import 'package:equatable/equatable.dart';
import 'package:prueba_les/feature/domain/entities/studio_entity.dart';

import 'genero_entity.dart';



class MovieEntity extends Equatable {
  final bool? adult;
  final String? backDropPath;
  final int? id;
  final String? mediaType;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterImage;
  final String? title;
  final List<GenresEntity>? generos;
  final List<StudioEntity>? studios;
  final DateTime? releaseDate;
  final dynamic  vote;

  MovieEntity(
      {this.adult,
      this.backDropPath,
      this.id,
      this.mediaType,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterImage,
      this.title,
      this.generos,
      this.studios,
      this.releaseDate,
      this.vote});

  @override
  List<Object?> get props => [
        adult,
        backDropPath,
        id,
        mediaType,
        originalTitle,
        overview,
        popularity,
        posterImage,
        title,
        releaseDate,
        generos,
        studios,
        vote
      ];
}

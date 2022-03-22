

import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prueba_les/feature/app/presentation/controllers/movie_detail_controller.dart';
import 'package:prueba_les/feature/app/presentation/controllers/movies_controller.dart';
import 'package:prueba_les/feature/data/datasource/movies_remote_datasource.dart';
import 'package:prueba_les/feature/data/repositoryImpl/movie_repository_impl.dart';
import 'package:prueba_les/feature/domain/repository/movie_repository.dart';
import 'package:prueba_les/feature/domain/usecase/get_detail_usecase.dart';
import 'package:prueba_les/feature/domain/usecase/get_list_movies_usecase.dart';

import 'feature/domain/usecase/search_movie_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerLazySingleton(() => MoviesController(getListMoviesUsecCase: sl(), searchMovieUseCase: sl()));
  sl.registerLazySingleton(() => MovieDetailController(getDetailMovieUseCase: sl()));



  //use cases

  sl.registerLazySingleton(() => GetListMoviesUsecCase(sl()));
  sl.registerLazySingleton(() => GetDetailMovieUseCase(sl()));
  sl.registerLazySingleton(() => SearchMovieUseCase(sl()));


  //repositories

  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDataSource: sl()));




  //data sources
  sl.registerLazySingleton<MoviesRemoteDataSource>(() => MoviesRemoteDataSourceImpl());



  await Hive.initFlutter();

  //adapter
  //Hive.registerAdapter();
  //Hive.registerAdapter();

  //open Box
  //await Hive.openBox<>();
  //await Hive.openBox();
}

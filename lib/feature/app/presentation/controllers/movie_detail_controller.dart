

import 'dart:developer';

import 'package:get/get.dart';
import 'package:prueba_les/feature/domain/entities/movie_entity.dart';
import 'package:prueba_les/feature/domain/usecase/get_detail_usecase.dart';
import 'package:prueba_les/feature/domain/usecase/search_movie_usecase.dart';

class MovieDetailController extends GetxController {

 MovieEntity ? movie;
RxBool isLoad = false.obs;
int? id;

final GetDetailMovieUseCase _getDetailMovieUseCase;


  MovieDetailController({this.id,required GetDetailMovieUseCase getDetailMovieUseCase,}) : _getDetailMovieUseCase = getDetailMovieUseCase ;

  void inInitData()async{
    this.isLoad.value = true;
    await detailMovie(id!);
    this.isLoad.value= false;

  }




 Future<void> detailMovie(int id)async{

   final res = await _getDetailMovieUseCase.call(id);
   res.fold((l) {
     log("error", name: "error al traer el detalle");

   }, (r) {
     this.movie = r;

   });
    update();


 }










}
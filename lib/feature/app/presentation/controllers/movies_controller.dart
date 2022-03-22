

import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:prueba_les/core/usecases/usecase.dart';
import 'package:prueba_les/core/validators/input_default.dart';
import 'package:prueba_les/feature/domain/entities/enum_segment.dart';
import 'package:prueba_les/feature/domain/entities/list_movies_entity.dart';
import 'package:prueba_les/feature/domain/usecase/get_list_movies_usecase.dart';
import 'package:prueba_les/feature/domain/usecase/search_movie_usecase.dart';

class MoviesController extends GetxController {
  final SearchMovieUseCase _searchMovieUseCase;
  final GetListMoviesUsecCase _getListMoviesUsecCase;
  Rx<FormzStatus> statusForm = FormzStatus.invalid.obs;
  TextEditingController searchCtrl = TextEditingController();
  InputDefault _searchInput = const InputDefault.pure();
  ListMoviesEntity ? movies;
  String ? data;
  List? top ;
  List ? recomend ;
  RxBool  isload = false.obs;
  RxBool  isloadSearch= false.obs;
  RxBool  bottomSearch= false.obs;
  RxBool theme = false.obs;
 // RxBool closeKeyboard = true.obs;

  TypeForSegment dynamicFor = TypeForSegment.HOME;

  changeDynamicForm(TypeForSegment value){
    dynamicFor = value;
    update();
  }

  MoviesController({required GetListMoviesUsecCase getListMoviesUsecCase,required  SearchMovieUseCase searchMovieUseCase}):
        _getListMoviesUsecCase = getListMoviesUsecCase,_searchMovieUseCase =searchMovieUseCase;





@override
  void onInit() {
    listMovies();
    super.onInit();
  }


  void changeTheme(){
  if(theme.value == false){
    theme.value = true;
    Get.changeTheme(ThemeData.light());
  }else{
    theme.value = false;
    Get.changeTheme(ThemeData.dark());
  }
  }

  /*void onEditingComplete(){
  searchMovie();
  changeBottom();
  closeKeyboard.value=false;


  }*/

  void changeTitle(String v) {
    _searchInput = InputDefault.dirty(v);
    data = _searchInput.value;
    _validatedForm();


  }

  String ?errorTitleInput(_) {
    return _searchInput.invalid ? "la busqueda debe contener caracteres " : null;

  }



  void listMovies()async{
    isload.value = true;
    final res = await _getListMoviesUsecCase.call(NoParams());
    res.fold((l) {
      log("error", name:"error al cargar lista");
    }, (r) {
      top = r.movies?.where((e) => e.vote.toInt() >=7 ).toList();
      recomend = r.movies?.where((e) => e.vote.toInt() <=6 ).toList();
      isload.value = false;
    });
      update(["movies"]);
  }



  void searchMovie()async{
  searchCtrl.clear();
  isloadSearch.value = true;
    final res = await _searchMovieUseCase.call(data!);
    res.fold((l) {
      log("error", name: "error al buscar pelicula");
    }, (r) {
      movies = r;
      isloadSearch.value = false;

    });
  update(["search"]);
  }

changeBottom(){
  if(bottomSearch.value == false) {
    bottomSearch.value = true;
  }else{
    bottomSearch.value = false;
  }
  update(["bottom"]);
}


  void  _validatedForm() {
    log("${statusForm.value}", name: "formStatus");
    statusForm.value = Formz.validate([_searchInput,]);
    log("${statusForm.value}", name: "formStatus");
    update(["validar"]);

  }
  
  
  
}




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:prueba_les/core/utils/theme_fonts_color_app/theme_color_fonts_app.dart';
import 'package:prueba_les/feature/app/presentation/controllers/movies_controller.dart';
import 'package:prueba_les/feature/app/presentation/pages/widgets/card_movie.dart';
import 'package:prueba_les/feature/domain/entities/enum_segment.dart';
import 'package:prueba_les/injection_container.dart';

import 'detail_movie.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home";

  HomePage({Key? key}) : super(key: key);

  MoviesController? _controller;

  @override
  Widget build(BuildContext context) {
    _controller = MoviesController(getListMoviesUsecCase: sl(), searchMovieUseCase: sl());
    return GetBuilder<MoviesController>(
      init: _controller,
      builder: (_) {
        return Obx(() {
            return Scaffold(
              backgroundColor:_.theme.value ? const Color(0xff5ca0d3): AppColors.sencond,
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
               GetBuilder<MoviesController>(
                 init: _controller,
                  builder: (_) {
                    return Obx(() {
                        return Visibility(
                          visible: _.dynamicFor == TypeForSegment.HOME,
                          child: Container(
                            margin:const EdgeInsets.only(left: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                             const SizedBox(width: 5,),
                            IconButton(icon: Icon(_.theme.value ? MdiIcons.brightness5: MdiIcons.moonWaningCrescent, color:_.theme.value ? Colors.yellow : Colors.blueGrey ,  ),
                                onPressed: (){
                              _.changeTheme();
                                })
              ],),
                          ),
                        );
                      }
                    );
                  }
                ),
                    Container(
                      margin:const EdgeInsets.only(left: 40),
                      child:  Text(
                        "Hello, what do you \n want to wach ?",
                        style: _.theme.value ?  AppFonts.whiteM19:AppFonts.blackL19
                        ),
                      ),


                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<MoviesController>(
                        init:_controller,
                        builder: (_) {
                        return Container(
                          margin:const EdgeInsets.only(left:35, right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: _.theme.value ? Colors.white.withOpacity(0.5) : Colors.black38
                          ),
                          height: 44,
                          //width:MediaQuery.of(context).size.width,
                          child:TextFormField(
                            style: const TextStyle(color: Colors.white),
                                decoration:const InputDecoration(

                                  prefixIcon:  Icon(Icons.search, color: Colors.white,),
                                  hintText: 'Search',
                                    hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                    fillColor: Colors.transparent,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 5.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(25)),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(25)),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 1.0)),
                                  errorBorder:  OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.0)),
                                  focusedErrorBorder: InputBorder.none
                                ),
                                controller:_.searchCtrl ,

                                validator: _.errorTitleInput,
                                onChanged: _.changeTitle,
                                autovalidateMode: AutovalidateMode.always,
                            onEditingComplete:(){
                                  FocusScope.of(context).unfocus();
                                  _.searchMovie();
                                  _.changeDynamicForm(TypeForSegment.SEARCH);
                            },
                          )
                        );
                      }
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration:  BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                          color: _.theme.value ? AppColors.primary:  Color(0xff5ca0d3)
                        ),
                        child: _swichSegment(context),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        );
      }
    );
  }
  Widget buildSearch(){
    return  SingleChildScrollView(
        child: GetBuilder<MoviesController>(
            id: "search",
            init: _controller,
            builder: (_) {
              return Obx((){
                if(_.isloadSearch.value) {
                  return  const SizedBox(
                      height: 350,
                      child:  Center(child: CircularProgressIndicator(),));
                }
                if(_.movies!.movies!.isEmpty) {
                  return SizedBox(
                    height: 350,
                    child: Center(child: Text('No se encontraron resultados', style: _.theme.value == true ? AppFonts.whiteM16 : AppFonts.blackM16),),);
                }
                return Column(
                  children: [
                    const SizedBox(height: 10,),

                    Container(
                      margin:const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_.data??"".toUpperCase(),style: AppFonts.whiteM16,),
                          InkWell(
                              child: const Text("Home", style:AppFonts.whiteM16),
                              onTap:(){
                                _.changeDynamicForm(TypeForSegment.HOME);
                              }
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height:500,
                      child: GridView.builder(
                          padding:const EdgeInsets.only(left: 20),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 15,
                            mainAxisExtent: 235,
                          ),
                          itemCount: _.movies?.movies?.length,
                          itemBuilder: (ctx, i) {
                            return InkWell(
                              child: CardMovie(
                                movie: _.movies?.movies?[i],
                              ),
                              onTap: () {
                                Get.to(() =>
                                    DetailMoviePage(
                                        id:_.movies?.movies?[i].id
                                    ));
                              },
                            );
                          }),
                    ),
                  ],
                );
              });
            }
        )

    );
  }
  Widget buildHome(){
    return  SingleChildScrollView(
      child: GetBuilder<MoviesController>(
        init:_controller,
          builder: (_) {
          return Column(
            children: [
              Container(
                margin:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text(
                      "RECOMENDED FOR YOU",
                      style: _.theme.value == true ?  AppFonts.whiteM16:AppFonts.blackM16,
                    ),
                    Text("see all",
                      style: _.theme.value == true ?  AppFonts.whiteM16 : AppFonts.blackM16 ,)
                  ],
                ),
              ),
              SizedBox(
                height: 240,
                child: GetBuilder<MoviesController>(
                  //initState: (_)=>_controller?.listMovies(),
                    id: "movies",
                    init: _controller,
                    builder: (_) {
                      if (_.isload.value) return const Center(child: CircularProgressIndicator(color: Colors.white,),);
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: _.recomend?.length,
                        itemBuilder: (ctx, i) {
                          return InkWell(
                            child: CardMovie(
                              movie: _.recomend?[i],
                              theme: _.theme.value,
                            ),
                            onTap: () {
                              Get.to(() => DetailMoviePage(
                                id: _.recomend?[i].id,
                              ));
                            },
                          );
                        },
                      );

                    }),
              ),
              Container(

                  margin:const EdgeInsets.only(left: 20, bottom: 10),
                  child: Text(
                    "TOP RATED",
                    style: _.theme.value == true ? AppFonts.whiteM16 : AppFonts.blackM16,
                  )
              ),

              SizedBox(
                  height: 250,
                child: GetBuilder<MoviesController>(
                  //initState: (_)=>_controller?.listMovies(),
                    id: "movies",
                    init: _controller,
                    builder: (_) {
                      if (_.isload.value) return const Center(child: CircularProgressIndicator(color: Colors.white,),);
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: _.top?.length,
                        itemBuilder: (ctx, i) {
                          return InkWell(
                            child: CardMovie(
                                movie: _.top?[i],
                                theme: _.theme.value
                            ),
                            onTap: () {
                              Get.to(() => DetailMoviePage(
                                id: _.top?[i].id,
                              ));
                            },
                          );
                        },
                      );
                    }),
              )
            ],
          );
        }
      ),
    );
  }

  _swichSegment(BuildContext context) {
    return GetBuilder<MoviesController>(
        init:_controller,
        builder: (_){
          if(_.dynamicFor == TypeForSegment.HOME)return buildHome();
          if(_.dynamicFor == TypeForSegment.SEARCH)return buildSearch();
          return SizedBox();
    });


  }
}

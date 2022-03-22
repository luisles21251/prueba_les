

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prueba_les/core/env/env.dart';
import 'package:prueba_les/core/utils/theme_fonts_color_app/theme_color_fonts_app.dart';
import 'package:prueba_les/feature/app/presentation/controllers/movie_detail_controller.dart';
import 'package:prueba_les/feature/app/presentation/controllers/movies_controller.dart';
import 'package:prueba_les/injection_container.dart';

class DetailMoviePage extends StatefulWidget {

  int ? id;
  static const routeName="/DetailMoviePage";
   DetailMoviePage({Key? key, this.id}) : super(key: key);

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
   MovieDetailController ? _controller;
   final MoviesController  _controllerMovie = Get.find<MoviesController>();

 @override
  void initState() {
   _controller = MovieDetailController(getDetailMovieUseCase: sl());
   _controller?.id = widget.id;
  // _controllerMovie = MoviesController(getListMoviesUsecCase: sl(), searchMovieUseCase:sl());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   print(_controllerMovie.theme.value);

    return Scaffold(
      backgroundColor: _controllerMovie.theme.value == true ? AppColors.primary : Color(0xff5ca0d3),
      body: SafeArea(
        child: GetBuilder<MovieDetailController>(
          initState: (_)=>_controller?.inInitData(),
          init: _controller,
          builder: (_) {
            if(_.isLoad.value)return const Center(child: CircularProgressIndicator(),);
            var star = _.movie!.vote!.toInt() / 2;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [Container(
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage("${Env.pathUrlImage}${_.movie!.posterImage!}"),
                      ),
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                    ),
                    IconButton(onPressed:(){
                      Get.back();
                    }, icon:const Icon(Icons.arrow_back, color: Colors.white,))
                    ]
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_.movie?.title ??"", style:_controllerMovie.theme.value == true ? AppFonts.whiteM19 : AppFonts.blackL19,),
                        Icon(Icons.hd, color:_controllerMovie.theme.value == true ? Colors.grey : Colors.black38
                        ,)
                      ],
                    ),
                  ),
                  Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                        height:34,
                            width: 100,
                            decoration:BoxDecoration(
                              color: _controllerMovie.theme.value == true ? Colors.grey.withOpacity(0.2) : Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(25)
                            ),
                            child: Center(child: Text("Watch now", style:_controllerMovie.theme.value == true ?  AppFonts.whiteM16 : AppFonts.blackM16,))

                        ),
                        Row(
                          children: List.generate(5, (i) {
                            if(star <= i)return Icon(Icons.star_border_outlined, color: _controllerMovie.theme.value == true ? Colors.white : Colors.black38,);
                            return Icon(Icons.star, color: Colors.yellow,);
                          })
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, left: 18,bottom: 25),
                    child: Center(child: Text(_.movie?.overview ??"", style:_controllerMovie.theme.value == true ? AppFonts.whiteM16 : AppFonts.blackM16,)),
                  ),

                  Container(
                    height: 100,
                    margin: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: _.movie?.studios?.length,
                        itemBuilder:(ctx, i){
                          return  Container(
                            width: 120,
                            child: Column(
                              children: [
                                Container(
                                  height: 65,
                                  width:65,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(
                                      image: NetworkImage("${Env.pathUrlImage}${_.movie?.studios?[i].logo}"),fit: BoxFit.fill,
                                    )
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Center(child: Text(_.movie?.studios?[i].name??"", style:_controllerMovie.theme.value == true ? AppFonts.whiteM13: AppFonts.blackL13, overflow: TextOverflow.ellipsis,)),
                              ],
                            ),
                          );
                        })
                  ),

                  Container(
                    width: double.infinity,
                    height: 20,
                    margin: const EdgeInsets.only(top: 6, left: 18, ),
                    child: Row(
                      children: [
                        Text( "Studio: ", style:_controllerMovie.theme.value == true ? AppFonts.whiteM16: AppFonts.blackM16,),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            width: double.infinity,
                            height: 16,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                                itemCount: _.movie?.studios?.length,
                                itemBuilder:(ctx, i){
                                  return Text(_.movie!.studios!.length <=1 ? "${_.movie?.studios?[i].name??""}": "${_.movie?.studios?[i].name??""}, ", style:_controllerMovie.theme.value == true ? AppFonts.whiteM13: AppFonts.blackL13);
                                }
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 6, left: 18),
                    child:Row(
                      children: [
                        Text("Genre:  ",style:_controllerMovie.theme.value == true ?  AppFonts.whiteM16 : AppFonts.blackM15),
                        Row(
                          children: List.generate(_.movie!.generos!.length,(i){
                            return Text(_.movie!.generos!.length <= 1 ? "${_.movie!.generos?[i].name??""}" : "${_.movie!.generos?[i].name??""} , ",style:_controllerMovie.theme.value == true ? AppFonts.whiteM13 : AppFonts.blackL13);
                          }),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 6, left: 18),
                    child: Row(
                      children: [
                        Text("Release: ",style:_controllerMovie.theme.value == true ? AppFonts.whiteM16 : AppFonts.blackM16),
                        Text(DateFormat("y").format(_.movie!.releaseDate!),style:_controllerMovie.theme.value == true ? AppFonts.whiteM13 : AppFonts.blackL13 )
                      ],
                    ),
                  )



                ],
              ),
            );
          }
        ),
      ),
    );
  }
}

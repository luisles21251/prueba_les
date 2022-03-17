
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_les/feature/app/pages/home/detail_movie.dart';
import 'package:prueba_les/feature/app/pages/widgets/card_movie.dart';

class HomePage extends StatelessWidget {
  static const routeName="/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5ca0d3),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),

            Container(
              margin: EdgeInsets.only(left: 40),
              child: Text("Hello, what do you \n want to wach ?", style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white
              ),),
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15
                ),
                color: Color(0xff8dbde0),
              ),
              margin: EdgeInsets.only(left: 40),

              height: 44,
              width: 290,
              child:TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search)
                ),
              ) ,
            ),
            SizedBox(height: 50,),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.only(topRight:Radius.circular(20),topLeft:Radius.circular(20)),
                  color: Color(0xff2c3848),
                ),
                child: SingleChildScrollView(
                  child: Column(

                    children: [
                      SizedBox(height: 35,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("RECOMENDED FOR YOU", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),),
                                Text("see all", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16))
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 250,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: [
                                InkWell(
                                  child: CardMovie(
                                    title: "Avengers Endgame",
                                    stars: 4,
                                    image: "https://i.pinimg.com/736x/26/04/7a/26047a439ca5d3d82b2d982f9eb2f124.jpg",
                                  ),
                                  onTap:(){
                                    Get.to(()=>DetailMoviePage());
                                  },
                                ),
                                CardMovie(
                                  title: "Capitan America",
                                  stars: 5,
                                  image: "https://cdn.domestika.org/c_limit,dpr_auto,f_auto,q_auto,w_820/v1509556098/content-items/002/130/920/23032615_1453885808063402_2233926401809156054_n-original.jpg?1509556098",
                                ),
                                CardMovie(
                                  title: "Aquaman",
                                  stars: 4,
                                  image: "https://m.guiadelocio.com/var/guiadelocio.com/storage/images/cine/archivo-peliculas/aquaman/35414703-9-esl-ES/aquaman.jpg",
                                ),
                                CardMovie(
                                  title: "Spiderman",
                                  stars: 4,
                                  image: "https://i.pinimg.com/736x/41/9a/02/419a02632750e4a2202a50f4b7080783.jpg",
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 15,),
                      Container(
                        height: 250,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            CardMovie(
                              title: "Joker",
                              stars: 4,
                              image:"https://i.pinimg.com/236x/d6/6e/af/d66eaf36ae62c4cf1e48f2282ebdaf71.jpg"
                            ),
                            CardMovie(
                              title: "Aladin",
                              stars: 5,
                              image: "https://www.laguiadelvaron.com/wp-content/uploads/2019/07/portadas-pel%C3%ADculas-iguales-www.laguiadelvaron-15.jpg",
                            ),
                            CardMovie(
                              title: "Black Panter",
                              stars: 4,
                              image: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/black-panther-poster-1551691489.jpg?crop=1xw:1xh;center,top&resize=480:*",
                            ),
                            CardMovie(
                              title: "Proyecto Geminis",
                              stars: 4,
                              image: "https://m.guiadelocio.com/var/guiadelocio.com/storage/images/cine/archivo-peliculas/geminis/37423557-6-esl-ES/geminis.jpg",
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

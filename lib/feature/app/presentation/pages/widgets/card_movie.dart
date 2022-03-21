

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba_les/core/env/env.dart';
import 'package:prueba_les/feature/domain/entities/movie_entity.dart';


class CardMovie extends StatelessWidget {
  MovieEntity ? movie;

  CardMovie({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var star = movie!.vote!.toInt() / 2;
    return Container(
      margin: EdgeInsets.symmetric(horizontal:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage("${Env.pathUrlImage}${movie?.posterImage??""}"),fit: BoxFit.fill,
              )
            ),
            height: 180,
            width: 140,

          ),
          Padding(
            padding: EdgeInsets.only(top:5.0, bottom: 4),
            child: Container(
                width: 140,
                child: Text(movie?.title??"", style:TextStyle(color: Colors.white, ), overflow: TextOverflow.ellipsis,)),
          ),
         Row(
           children:
             List.generate(5, (i) {
               if(star <= i)return Icon(Icons.star_border_outlined);
               return Icon(Icons.star, color: Colors.yellow,);
             })

         )
        ],
      ),
    );
  }
}

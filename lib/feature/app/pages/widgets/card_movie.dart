

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardMovie extends StatelessWidget {
  String ?title;
  int ? stars;
  String ? image;

  CardMovie({Key? key, this.title, this.stars, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: 120,
            child:Image(
              image: NetworkImage(image!),fit: BoxFit.cover,
            )
          ),
          Padding(
            padding: EdgeInsets.only(top:5.0),
            child: Text(title??"", style:TextStyle(color: Colors.white, ) ),
          ),
         Row(
           children:
             List.generate(stars!, (index) {
               return Icon(Icons.star, color: Colors.yellow,);
             })

         )
        ],
      ),
    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailMoviePage extends StatelessWidget {
  static const routeName="/DetailMoviePage";
  const DetailMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage("https://m.guiadelocio.com/var/guiadelocio.com/storage/images/cine/archivo-peliculas/aquaman/35414703-9-esl-ES/aquaman.jpg"),
              ),
              height: 280,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Aquaman"),
                  Icon(Icons.account_balance_sharp)
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Wacht now"),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow,),
                      Icon(Icons.star, color: Colors.yellow,),
                      Icon(Icons.star, color: Colors.yellow,),
                      Icon(Icons.star, color: Colors.yellow,),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 18,bottom: 25),
              child: Center(child: Text("lorem insup lorem lorem lorem lorem insiup, jsbchejicmcxjsbcj, ajdbwjcb, jwduewfbe,")),
            ),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(),
                      SizedBox(height: 5,),
                      Text("Zack Effron")
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(),
                      SizedBox(height: 5,),
                      Text("Zack Effron")
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(),
                      SizedBox(height: 5,),
                      Text("Zack Effron")
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(),
                      SizedBox(height: 5,),
                      Text("Zack Effron")
                    ],
                  ),
                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}

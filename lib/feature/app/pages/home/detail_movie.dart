

import 'package:flutter/material.dart';

class DetailMoviePage extends StatelessWidget {
  static const routeName="/DetailMoviePage";
  const DetailMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 280,
            width: MediaQuery.of(context).size.width,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Aquaman"),
              Icon(Icons.account_balance_sharp)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Wacht now"),
              Row(
                children: [
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                ],
              )
            ],
          ),
          Container(
            child: Text("lorem insup lorem lorem lorem lorem insiup, jsbchejicmcxjsbcj, ajdbwjcb, jwduewfbe,"),
          ),

          Container(
            child: Row(
              children: [
                CircleAvatar(),
                CircleAvatar(),
                CircleAvatar(),
                CircleAvatar(),
                CircleAvatar(),

              ],
            ),
          )
        ],
      ),
    );
  }
}

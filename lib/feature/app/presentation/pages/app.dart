import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'home/detail_movie.dart';
import 'home/home_page.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF972C2C).withOpacity(0.7),


    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    return ScreenUtilInit(
        designSize: Size(350, 680),
        child: GetMaterialApp(
          supportedLocales: [Locale('es', 'ES'), Locale('en', 'EN')],

          theme: ThemeData(primarySwatch:Colors.blue,),
          home: HomePage(),
          debugShowCheckedModeBanner: false,
          initialRoute: HomePage.routeName,
          routes: {
            HomePage.routeName: (context) => HomePage(),
            DetailMoviePage.routeName:(context) =>DetailMoviePage(),
          },
        )

        );
  }
}

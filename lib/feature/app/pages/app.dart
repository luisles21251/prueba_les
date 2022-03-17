import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prueba_les/feature/app/pages/home/detail_movie.dart';

import 'home/home_page.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF972C2C).withOpacity(0.7),
      statusBarBrightness: Brightness.dark,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    return ScreenUtilInit(
        designSize: Size(350, 680),
        builder: () {

          return GetMaterialApp(
            //supportedLocales: [Locale('es', 'ES'), Locale('en', 'EN')],
            /*localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],*/
            home: HomePage(),
            debugShowCheckedModeBanner: false,
            //initialRoute: LoginPage.routeName,
            routes: {
              HomePage.routeName: (context) => HomePage(),
              DetailMoviePage.routeName:(context) =>DetailMoviePage(),
            },
          );
        });
  }
}

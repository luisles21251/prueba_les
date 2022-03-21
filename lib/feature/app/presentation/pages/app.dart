import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prueba_les/feature/app/presentation/controllers/movies_controller.dart';
import 'package:prueba_les/injection_container.dart';


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
        builder: () {
          return GetMaterialApp(
            supportedLocales: [Locale('es', 'ES'), Locale('en', 'EN')],
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            theme: ThemeData(primarySwatch:Colors.blue,),
            home: HomePage(),
            debugShowCheckedModeBanner: false,
            initialRoute: HomePage.routeName,
            routes: {
              HomePage.routeName: (context) => HomePage(),
              DetailMoviePage.routeName:(context) =>DetailMoviePage(),
            },
          );
        });
  }
}

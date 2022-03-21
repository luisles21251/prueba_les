import 'package:flutter/material.dart';



import 'core/env/env.dart';
import 'feature/app/presentation/pages/app.dart';
import 'injection_container.dart'as di;
import 'injection_container.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();


  await di.init();
sl.registerLazySingleton(() => Env(EnvMode.production

));

  runApp(App());
}






 
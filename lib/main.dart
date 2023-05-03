import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';  

import 'package:movilidad/src/routes/routes.dart';
import 'package:movilidad/src/utils/colors_util.dart';

//RootWidget, creating a blank app for google materials design features
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movilidad APP',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
      ],
      theme: ThemeData(
        primarySwatch: MORADOMATERIAL,
        bottomAppBarColor: MORADOMATERIAL,
      ),
      initialRoute: 'request',
      //Rutas de la APP
      routes: getAplicationRoutes(),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:movilidad/src/levantamiento/lev_main.dart';
import 'package:movilidad/src/levantamiento/second_step.dart';
import 'package:movilidad/src/vehiculos/main_vehiculo.dart';
import 'package:movilidad/src/view/home_screen.dart';
import 'package:movilidad/src/view/login_screen.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      //home: levMain(),
      home: LoginScreen(),
      //home: HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movilidad/levantamiento/lev_main.dart';
import 'package:movilidad/view/login_screen.dart';

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
    );
  }
}

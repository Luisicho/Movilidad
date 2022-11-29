import 'package:flutter/material.dart';

import '../pages/levantamiento/lev_main.dart';
import '../pages/maps/map_main.dart';
import '../pages/vehiculos/main_vehiculo.dart';
import '../pages/view/home_screen.dart';
import '../pages/view/login_screen.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (context) => LoginScreen(),
    'home_screen': (context) => HomeScreen(),
    'lev_main': (context) => levMain(),
    'map_main': (context) => MapMain(),
    'main_vehiculo': (context) => MainVehiculo(),
  };
}

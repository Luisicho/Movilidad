import 'package:flutter/material.dart';
import 'package:movilidad/src/pages/ticket/ticket_main.dart';

import '../pages/levantamiento/lev_main.dart';
import '../pages/maps/map_main.dart';
import '../pages/vehiculos/main_vehiculo.dart';
import '../pages/home_screen.dart';
import '../pages/login_screen.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (context) => const LoginScreen(),
    'home_screen': (context) => const HomeScreen(),
    'lev_main': (context) => const levMain(),
    'map_main': (context) => const MapMain(),
    'main_vehiculo': (context) => const MainVehiculo(),
    'main_ticket': (context) => const TicketMain(),
  };
}

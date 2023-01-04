import 'package:flutter/material.dart';
import 'package:movilidad/src/utils/colors_util.dart';
//Crea lista de Iconos que se traducen a la aplicacion
final _icons = < String,IconData >{
  'add_alert'       : Icons.add_alert,
  'accessibility'   : Icons.accessibility,
  'folder_open'     : Icons.folder_open,
  'car_crash'       : Icons.car_crash,
  'car_repair'      : Icons.car_repair,
  'airline_seat_flat_outlined'      : Icons.airline_seat_flat_outlined,
  'accessible_outlined'             :Icons.accessible_outlined,
};
//Consigue el icono en base a los ya existente en el arreglo
Icon getIcon( String nombreIcono ){
  
  return Icon( _icons[nombreIcono], color: AZUL, );
}
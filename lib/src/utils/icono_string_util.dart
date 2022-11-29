import 'package:flutter/material.dart';
//Crea lista de Iconos que se traducen a la aplicacion
final _icons = < String,IconData >{
  'add_alert'       : Icons.add_alert,
  'accessibility'   : Icons.accessibility,
  'folder_open'     : Icons.folder_open,
  'car_crash'       : Icons.car_crash,
  'car_repair'      : Icons.car_repair,
};
//Consigue el icono en base a los ya existente en el arreglo
Icon getIcon( String nombreIcono ){
  
  return Icon( _icons[nombreIcono], color: Colors.blue, );
}
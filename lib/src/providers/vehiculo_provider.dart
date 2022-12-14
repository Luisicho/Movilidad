import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

class _VehiculoProvider {
  List<dynamic> opciones = [];

  VehiculoProvider() {}

  //Funcion futura que se construye cuando todo el proceso termina (cargarData)
  //  retorna segundos despues la informacion de la Lista
  Future<List<dynamic>> cargarData() async {
    //Hace funcion asincrona para esperar respuesta antes de mandar al constructor
    //  Recupera la ruta de tu JSON para cargar
    final respuesta =
        await rootBundle.loadString('assets/menu_opts.json');

    //Crea un Mapeado para decodificar el archivo JSON que se esta leyendo
    //  de esta forma se consigue un arreglo de este JSON
    Map dataMap = json.decode(respuesta);
    opciones = dataMap['levantamientos'];

    return opciones;
  }
}
//Inicializa el proveedor
final vehiculoProvider = _VehiculoProvider();

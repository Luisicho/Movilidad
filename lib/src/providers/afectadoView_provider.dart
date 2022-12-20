import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

class _AfectadoViewProvider {
  List<dynamic> opciones = [];
  List<String> establecimiento = [];

  _AfectadoViewProvider() {}

  //Funcion futura que se construye cuando todo el proceso termina (cargarData)
  //  retorna segundos despues la informacion de la Lista
  Future<List<String>> cargarData() async {
    //Hace funcion asincrona para esperar respuesta antes de mandar al constructor
    //  Recupera la ruta de tu JSON para cargar
    final respuesta =
        await rootBundle.loadString('assets/serviciosMedicos.json');

    //Crea un Mapeado para decodificar el archivo JSON que se esta leyendo
    //  de esta forma se consigue un arreglo de este JSON
    /*var jsonData = json.decode(respuesta) as List;
    for (var element in jsonData) {
      establecimiento.add(element["serviciosMedicos"]);
    }*/
    
    Map dataMap = json.decode(respuesta);

    opciones = dataMap['serviciosMedicos'];
    opciones.forEach(
      (element) {
        establecimiento.add(element['NOMBRE_DEL_ESTABLECIMIENTO']);
      },
    );
    return establecimiento;
  }
}

//Inicializa el proveedor
final afectadoViewProvider = _AfectadoViewProvider();

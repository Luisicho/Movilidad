import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

import 'package:movilidad/src/pages/levantamiento/model/servicioMedico_model.dart';

class _AfectadoViewProvider {
  List<dynamic> opciones = [];
  List<ServicioMedicoModel> establecimiento = [];

  _AfectadoViewProvider() {}

  //Funcion futura que se construye cuando todo el proceso termina (cargarData)
  //  retorna segundos despues la informacion de la Lista
  Future<List<dynamic>> cargarDataMedica() async {
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
   /* opciones.forEach(
      (element) {
        establecimiento.add(ServicioMedicoModel.fromJson(element));
      },
    );*/
    return opciones;
  }
}

//Inicializa el proveedor
final afectadoViewProvider = _AfectadoViewProvider();

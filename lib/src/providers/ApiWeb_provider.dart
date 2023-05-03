
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movilidad/src/model/levantamiento_model.dart';
import 'package:movilidad/src/utils/tools_util.dart';

class _ApiWebProvider {
  final String api_key = "70ff001acdb9f7c";
  final String api_secret = "210a5620fc253a0";
  final String ip = "http://10.0.2.2:8000";
  String request = "";
  String token = "";
  
  //ApiWebConstructor
  ApiWebProvider() {}

  //GET /Levantamiento
  Future<List<dynamic>> getAllLevantamiento() async {
    request = "$ip/api/resource/Levantamiento";
    token = "token $api_key:$api_secret";
    final response = await http.get(
      Uri.parse(request),
      headers: {"Authorization": token},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Error al cargar');
    }
  }
  
  //POST /Levantamiento
  Future<String> postLevantamiento(LevantamientoModel levantamiento) async{
    request = "$ip/api/resource/Levantamiento";
    token = "token $api_key:$api_secret";
    final response = await http.post(
      Uri.parse(request),
      headers: {
        "Authorization": token
      },
      body: {
        "folio": levantamiento.folio,
        "poliza": levantamiento.poliza,
        "aseguradora": levantamiento.aseguradora,
        "vigenciaaseguradora": levantamiento.vigenciaAsc,
        "fechallegada": ReverseDate(levantamiento.fechaLlegada),
        "horallegada": levantamiento.horaLlegada,
        "horaaccidente": levantamiento.horaAccidente,
        "ubicacion": levantamiento.ubicacion,
        "entre": levantamiento.entre,
        "yentre": levantamiento.yentre,
        "longitud": levantamiento.longitud,
        "latitud": levantamiento.latitud,
        "noeconomico": levantamiento.noEconomico,
        "placas": levantamiento.placas,
        "descripcion": levantamiento.descripcion,
        "concesionario": levantamiento.concesionario,
        "nolicencia": levantamiento.noLicencia,
        "tipo": levantamiento.tipo,
        "nombre": levantamiento.nombre,
        "vigencia": levantamiento.vigencia,
      }
    );

    if (response.statusCode == 200) {
      return "OK";
    } else {
      throw Exception('Error al insertar');
    }
  }

}
//Inicializa el proveedor
final apiWebProvider = _ApiWebProvider();

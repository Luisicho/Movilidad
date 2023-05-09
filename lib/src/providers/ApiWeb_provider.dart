import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movilidad/src/model/levantamiento_model.dart';
import 'package:movilidad/src/model/afectado_model.dart';
import 'package:movilidad/src/model/vehiculos_model.dart';
import 'package:movilidad/src/utils/tools_util.dart';

class _ApiWebProvider {
  final String api_key = "70ff001acdb9f7c";
  final String api_secret = "210a5620fc253a0";
  final String ip = "http://10.0.2.2:8000";
  String request = "";
  String request2 = "";
  String token = "";
  String idV = "", idA = "";

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
  Future<String> postLevantamiento(
      LevantamientoModel levantamiento, String nameV, String nameA) async {
    request = "$ip/api/resource/Levantamiento";
    token = "token $api_key:$api_secret";
    final response = await http.post(Uri.parse(request), headers: {
      "Authorization": token
    }, body: {
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
      "casovehiculo": nameV,
      "casoafectado": nameA,
    });
    final idRe = jsonDecode(response.body)['data']['name'];
    if (response.statusCode == 200) {
      return idRe + "";
    } else {
      throw Exception('Error al insertar LEVANTAMIENTO');
    }
  }

  //POST /Afectado
  Future<String> postAfectado(List<AfectadoModel> afectado) async {
    request = "$ip/api/resource/Afectado";
    request2 = "$ip/api/resource/Detalle Afectados";
    token = "token $api_key:$api_secret";
    //add Afectado
    final response = await http.post(Uri.parse(request), headers: {
      "Authorization": token
    }, body: {
      "idafectado": "0",
    });
    if (response.statusCode != 200) {
      throw Exception('Error al insertar AFECTADO');
    }
    final String idRe = jsonDecode(response.body)['data']['name'];
    idA = idRe;
    //add Detalle Afectado
    afectado.forEach((element) async {
      final response2 = await http.post(Uri.parse(request2), headers: {
        "Authorization": token
      }, body: {
        "idafectado": "0",
        "aseguradora": element.aseguradora,
        "vigenciaaseguradora": ReverseDate(element.vigencia),
        "nombreac": element.nombreAc,
        "curp": element.curp,
        "domicilio": element.domicilio,
        "tipoatencion": element.tipoAtencion,
        "institucionmedica": element.institucionMedica,
        "fecharecepcion": ReverseDate(element.fechaRecepcion),
        "horarecepcion": element.horaRecepcion,
        "fechaalta": ReverseDate(element.fechaAlta),
        "horaalta": element.horaAlta,
        "observaciones": element.observaciones,
        "parent": idRe,
        "parentfield": "listaafectado",
        "parenttype": "Afectado",
        "doctype": "Detalle Afectados",
      });
      if (response2.statusCode != 200) {
        throw Exception('Error al insertar DETALLE AFECTADO');
      }
    });
    return idRe;
  }

  //POST /Vehiculo
  Future<String> postVehiculo(List<VehiculoModel> vehiculo) async {
    request = "$ip/api/resource/Vehiculo";
    request2 = "$ip/api/resource/Detalle Vehiculos";
    token = "token $api_key:$api_secret";
    //add Afectado
    final response = await http.post(Uri.parse(request), headers: {
      "Authorization": token
    }, body: {
      "idvehiculo": "0",
    });
    if (response.statusCode != 200) {
      throw Exception('Error al insertar VEHICULO');
    }
    final String idRe = jsonDecode(response.body)['data']['name'];
    idV = idRe;
    //add Detalle Afectado
    vehiculo.forEach((element) async {
      final response2 = await http.post(Uri.parse(request2), headers: {
        "Authorization": token
      }, body: {
        "idvehiculo": "0",
        "noeconomico": element.noeconomico,
        "placas": element.placas,
        "descripcion": element.descripcion,
        "concesionario": element.concesionario,
        "licencia": element.licencia,
        "tipo": element.tipo,
        "vigencia": element.vigencia,
        "nombre": element.nombre,
        "parent": idRe,
        "parentfield": "listavehiculos",
        "parenttype": "Vehiculo",
        "doctype": "Detalle Vehiculos"
      });
      if (response2.statusCode != 200) {
        throw Exception('Error al insertar DETALLE VEHICULO');
      }
    });
    return idRe;
  }

  //POST /LVA
  Future<String> postLVA(LevantamientoModel levantamiento,
      List<VehiculoModel> vehiculo, List<AfectadoModel> afectado) async {
    await apiWebProvider.postAfectado(afectado);
    await apiWebProvider.postVehiculo(vehiculo);
    postLevantamiento(levantamiento, idV, idA);
    return "OK";
  }

}

//Inicializa el proveedor
final apiWebProvider = _ApiWebProvider();

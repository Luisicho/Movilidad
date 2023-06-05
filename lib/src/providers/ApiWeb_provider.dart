import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movilidad/src/model/levantamiento_model.dart';
import 'package:movilidad/src/model/afectado_model.dart';
import 'package:movilidad/src/model/vehiculos_model.dart';
import 'package:movilidad/src/utils/tools_util.dart';

class _ApiWebProvider {
  // final String api_key = "12d87509ef28943";
  // final String api_secret = "33a253270d10c3a";
  // final String ip = "http://10.0.2.2:8001";
  final String api_key = "008b0db425b77d3";
  final String api_secret = "a42bfad28ce2110";
  final String ip = "http://10.0.2.2:8000";
  String request = "";
  String request2 = "";
  String token = "";
  String idV = "", idA = "";

  //ApiWebConstructor
  ApiWebProvider() {}

  //GET /Levantamiento
  Future<List<dynamic>> getAllLevantamiento() async {
    List<dynamic> LisLev = List<dynamic>.empty(growable: true);
    request = "$ip/api/resource/Levantamiento";
    token = "token $api_key:$api_secret";
    final response = await http.get(
      Uri.parse(request),
      headers: {"Authorization": token},
    );
    //Valida si respuesta OK
    if (response.statusCode == 200) {
      //Variable de recorido
      List<dynamic> idL = jsonDecode(response.body)['data'];
      //return idL[0]['name'];
      for(int i = 0; i< idL.length;i++){
        String idTemp = idL[i]['name'];
        //Consulta cada levantamiento
        request2 = "$ip/api/resource/Levantamiento/$idTemp";
        final response2 = await http.get(
          Uri.parse(request2),
          headers: {"Authorization": token},
        );
        //Valida si respuesta OK
        if (response.statusCode == 200) {
          var tempLev = jsonDecode(response2.body)['data'];
          LisLev.add(tempLev);
        } else {
          throw Exception('Error al leer levantamientos');
        }
      }
      //retorna lista
      return LisLev;
    } else {
      throw Exception('Error al cargar lista levantamientos');
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
      "asignado": 'luism18.1999@gmail.com',
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
      "foto1": levantamiento.fotosLev[0].path,
      "foto2": levantamiento.fotosLev[1].path,
      "foto3": levantamiento.fotosLev[2].path,
      "foto4": levantamiento.fotosLev[3].path,
      "foto5": levantamiento.fotosLev[4].path,
      "foto6": levantamiento.fotosLev[5].path,
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
    if (response.statusCode == 200) {
      return "OK";
    } else {
      throw Exception('Error al insertar LEVANTAMIENTO');
    }
  }
  
  //POST /Afectado
  Future<String> postAfectado(List<AfectadoModel> afectado) async {
    request = "$ip/api/resource/Afectado";
    request2 = "$ip/api/resource/Detalle Afectado";
    token = "token $api_key:$api_secret";
    //add Afectado
    final response = await http.post(Uri.parse(request), headers: {
      "Authorization": token,
      //"Keep-Alive": ''
    }, body: {
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
        "doctype": "Detalle Afectado",
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
    request2 = "$ip/api/resource/Detalle Vehiculo";
    token = "token $api_key:$api_secret";
    //add Vehiculo
    final response = await http.post(Uri.parse(request), headers: {
      "Authorization": token
    }, body: {
    });
    if (response.statusCode != 200) {
      throw Exception('Error al insertar VEHICULO');
    }
    final String idRe = jsonDecode(response.body)['data']['name'];
    idV = idRe;
    //add Detalle Vehiculo
    vehiculo.forEach((element) async {
      final response2 = await http.post(Uri.parse(request2), headers: {
        "Authorization": token
      }, body: {
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
        "doctype": "Detalle Vehiculo"
      });
      if (response2.statusCode != 200) {
        throw Exception('Error al insertar DETALLE VEHICULO');
      }
    });
    return idRe;
  }

}

//Inicializa el proveedor
final apiWebProvider = _ApiWebProvider();

// To parse this JSON data, do
//
//     final servicioMedicoModel = servicioMedicoModelFromJson(jsonString);

import 'dart:convert';

ServicioMedicoModel servicioMedicoModelFromJson(String str) =>
    ServicioMedicoModel.fromJson(json.decode(str));

String servicioMedicoModelToJson(ServicioMedicoModel data) =>
    json.encode(data.toJson());

class ServicioMedicoModel {
    ServicioMedicoModel({
        required this.nomEstab,
        required this.razSocial,
        required this.nomVial,
        required this.nomVE1,
        required this.nomVE2,
        required this.nomVE3,
        required this.numeroExt,
        required this.nombAsent,
        required this.nomCenCom,
        required this.codPostal,
        required this.cveEnt,
        required this.entidad,
        required this.cveMun,
        required this.municipio,
        required this.cveLoc,
        required this.localidad,
        required this.telefono,
        required this.latitud,
        required this.longitud,
    });

    String nomEstab;
    String? razSocial;
    String nomVial;
    String nomVE1;
    String nomVE2;
    String nomVE3;
    String? numeroExt;
    String nombAsent;
    String? nomCenCom;
    String? codPostal;
    String cveEnt;
    String entidad;
    String cveMun;
    String municipio;
    String cveLoc;
    String localidad;
    String? telefono;
    double latitud;
    double longitud;

    factory ServicioMedicoModel.fromJson(Map<String, dynamic> json) => ServicioMedicoModel(
        nomEstab: json["nom_estab"],
        razSocial: json["raz_social"],
        nomVial: json["nom_vial"],
        nomVE1: json["nom_v_e_1"],
        nomVE2: json["nom_v_e_2"],
        nomVE3: json["nom_v_e_3"],
        numeroExt: json["numero_ext"],
        nombAsent: json["nomb_asent"],
        nomCenCom: json["nom_CenCom"],
        codPostal: json["cod_postal"],
        cveEnt: json["cve_ent"],
        entidad: json["entidad"],
        cveMun: json["cve_mun"],
        municipio: json["municipio"],
        cveLoc: json["cve_loc"],
        localidad: json["localidad"],
        telefono: json["telefono"],
        latitud: json["latitud"].toDouble(),
        longitud: json["longitud"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "nom_estab": nomEstab,
        "raz_social": razSocial,
        "nom_vial": nomVial,
        "nom_v_e_1": nomVE1,
        "nom_v_e_2": nomVE2,
        "nom_v_e_3": nomVE3,
        "numero_ext": numeroExt,
        "nomb_asent": nombAsent,
        "nom_CenCom": nomCenCom,
        "cod_postal": codPostal,
        "cve_ent": cveEnt,
        "entidad": entidad,
        "cve_mun": cveMun,
        "municipio": municipio,
        "cve_loc": cveLoc,
        "localidad": localidad,
        "telefono": telefono,
        "latitud": latitud,
        "longitud": longitud,
    };
  //Funcion filtrando por Municipio
  List<ServicioMedicoModel> filtrarMunicipio(List<ServicioMedicoModel> listaVieja, String municipio) {
    return listaVieja.where((element) => element.municipio == municipio).toList();
  }
}

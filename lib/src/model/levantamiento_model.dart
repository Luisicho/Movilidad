import 'dart:io';

// To parse this JSON data, do
//
//     final levantamientoModel = levantamientoModelFromJson(jsonString);

import 'dart:convert';

LevantamientoModel levantamientoModelFromJson(String str) =>
    LevantamientoModel.fromJson(json.decode(str));

String levantamientoModelToJson(LevantamientoModel data) =>
    json.encode(data.toJson());

class LevantamientoModel {
  LevantamientoModel({
    required this.folio,
    required this.fechaLlegada,
    required this.horaLlegada,
    required this.horaAccidente,
    required this.ubicacion,
    required this.entre,
    required this.y,
    required this.longitud,
    required this.latitud,
    required this.noEconomico,
    required this.placas,
    required this.descripcion,
    required this.concesionario,
    required this.noLicencia,
    required this.tipo,
    required this.nombre,
    required this.vigencia,
    required this.fotosLev,
    required this.icon,
  });

  String folio;
  String fechaLlegada;
  String horaLlegada;
  String horaAccidente;
  String ubicacion;
  String entre;
  String y;
  String longitud;
  String latitud;
  String noEconomico;
  String placas;
  String descripcion;
  String concesionario;
  String noLicencia;
  String tipo;
  String nombre;
  String vigencia;
  List<File> fotosLev = [
    File(''),
    File(''),
    File(''),
    File(''),
    File(''),
    File('')
  ];
  String icon;

  factory LevantamientoModel.fromJson(Map<String, dynamic> json) =>
      LevantamientoModel(
        folio: json["folio"],
        fechaLlegada: json["fechaLlegada"],
        horaLlegada: json["horaLlegada"],
        horaAccidente: json["horaAccidente"],
        ubicacion: json["ubicacion"],
        entre: json["entre"],
        y: json["y"],
        longitud: json["longitud"],
        latitud: json["latitud"],
        noEconomico: json["noEconomico"],
        placas: json["placas"],
        descripcion: json["descripcion"],
        concesionario: json["concesionario"],
        noLicencia: json["noLicencia"],
        tipo: json["tipo"],
        nombre: json["nombre"],
        vigencia: json["vigencia"],
        fotosLev: json["fotosLev"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "folio": folio,
        "fechaLlegada": fechaLlegada,
        "horaLlegada": horaLlegada,
        "horaAccidente": horaAccidente,
        "ubicacion": ubicacion,
        "entre": entre,
        "y": y,
        "longitud": longitud,
        "latitud": latitud,
        "noEconomico": noEconomico,
        "placas": placas,
        "descripcion": descripcion,
        "concesionario": concesionario,
        "noLicencia": noLicencia,
        "tipo": tipo,
        "nombre": nombre,
        "vigencia": vigencia,
        "fotosLev": fotosLev,
        "icon": icon,
      };
  @override
  String toString() {
    return "Folio: $folio Nombre: $nombre FechaLlegada: $fechaLlegada Descripcion: $descripcion HoraLlegada: $horaLlegada HoraAccidente: $horaAccidente Ubicacion: $ubicacion Entre: $entre Y: $y Longitud: $longitud Latitud: $latitud NoEconomico: $noEconomico Placas: $placas Concesionario: $concesionario NoLicencia: $noLicencia Tipo: $tipo Vigencia: $vigencia";
  }
}

List<LevantamientoModel> listEjemploLevantamiento = [
  LevantamientoModel(
    folio: '01',
    fechaLlegada: 'FechaLlegada',
    horaLlegada: 'HoraLlegada',
    horaAccidente: 'HoraAccidente',
    ubicacion: 'Ubicacion',
    entre: 'Entre',
    y: 'Y',
    longitud: 'Longitud',
    latitud: 'Latitud',
    noEconomico: 'NoEconomico',
    placas: 'Placas',
    descripcion: 'Descripcion',
    concesionario: 'Concesionario',
    noLicencia: 'NoLicencia',
    tipo: 'Tipo',
    nombre: 'Nombre',
    vigencia: 'Vigencia',
    fotosLev: List<File>.empty(),
    icon: 'car_crash',
  ),
  LevantamientoModel(
    folio: '02',
    fechaLlegada: 'FechaLlegada',
    horaLlegada: 'HoraLlegada',
    horaAccidente: 'HoraAccidente',
    ubicacion: 'Ubicacion',
    entre: 'Entre',
    y: 'Y',
    longitud: 'Longitud',
    latitud: 'Latitud',
    noEconomico: 'NoEconomico',
    placas: 'Placas',
    descripcion: 'Descripcion',
    concesionario: 'Concesionario',
    noLicencia: 'NoLicencia',
    tipo: 'Tipo',
    nombre: 'Nombre',
    vigencia: 'Vigencia',
    fotosLev: List<File>.empty(),
    icon: 'car_crash',
  ),
  LevantamientoModel(
    folio: '03',
    fechaLlegada: 'FechaLlegada',
    horaLlegada: 'HoraLlegada',
    horaAccidente: 'HoraAccidente',
    ubicacion: 'Ubicacion',
    entre: 'Entre',
    y: 'Y',
    longitud: 'Longitud',
    latitud: 'Latitud',
    noEconomico: 'NoEconomico',
    placas: 'Placas',
    descripcion: 'Descripcion',
    concesionario: 'Concesionario',
    noLicencia: 'NoLicencia',
    tipo: 'Tipo',
    nombre: 'Nombre',
    vigencia: 'Vigencia',
    fotosLev: List<File>.empty(),
    icon: 'car_crash',
  ),
];

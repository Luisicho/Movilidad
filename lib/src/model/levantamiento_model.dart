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
    required this.poliza,
    this.aseguradora,
    this.fechaLlegada,
    this.horaLlegada,
    this.horaAccidente,
    this.ubicacion,
    this.entre,
    this.yentre,
    this.longitud,
    this.latitud,
    this.noEconomico,
    this.placas,
    this.descripcion,
    this.concesionario,
    this.noLicencia,
    this.tipo,
    this.nombre,
    this.vigencia,
    required this.fotosLev,
    this.icon,
  });

  String folio;
  String poliza;
  String? aseguradora;
  String? fechaLlegada;
  String? horaLlegada;
  String? horaAccidente;
  String? ubicacion;
  String? entre;
  String? yentre;
  String? longitud;
  String? latitud;
  String? noEconomico;
  String? placas;
  String? descripcion;
  String? concesionario;
  String? noLicencia;
  String? tipo;
  String? nombre;
  String? vigencia;
  List<File> fotosLev = [
    File(''),
    File(''),
    File(''),
    File(''),
    File(''),
    File('')
  ];
  String? icon;

  factory LevantamientoModel.fromJson(Map<String, dynamic> json) =>
      LevantamientoModel(
        folio: json["folio"],
        poliza: json["poliza"],
        aseguradora: json["aseguradora"],
        fechaLlegada: json["fechaLlegada"],
        horaLlegada: json["horaLlegada"],
        horaAccidente: json["horaAccidente"],
        ubicacion: json["ubicacion"],
        entre: json["entre"],
        yentre: json["yentre"],
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
        "poliza": poliza,
        "aseguradora": aseguradora,
        "fechaLlegada": fechaLlegada,
        "horaLlegada": horaLlegada,
        "horaAccidente": horaAccidente,
        "ubicacion": ubicacion,
        "entre": entre,
        "entre2": yentre,
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
    return "Folio: $folio Poliza $poliza Aseguradora: $aseguradora Nombre: $nombre FechaLlegada: $fechaLlegada Descripcion: $descripcion HoraLlegada: $horaLlegada HoraAccidente: $horaAccidente Ubicacion: $ubicacion Entre: $entre Yentre: $yentre Longitud: $longitud Latitud: $latitud NoEconomico: $noEconomico Placas: $placas Concesionario: $concesionario NoLicencia: $noLicencia Tipo: $tipo Vigencia: $vigencia";
  }
}

List<LevantamientoModel> listEjemploLevantamiento = [
  LevantamientoModel(
    folio: '01',
    poliza: '01',
    aseguradora: '',
    fechaLlegada: 'FechaLlegada',
    horaLlegada: 'HoraLlegada',
    horaAccidente: 'HoraAccidente',
    ubicacion: 'Ubicacion',
    entre: 'Entre',
    yentre: 'Entre2',
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
    poliza: '01',
    aseguradora: '',
    fechaLlegada: 'FechaLlegada',
    horaLlegada: 'HoraLlegada',
    horaAccidente: 'HoraAccidente',
    ubicacion: 'Ubicacion',
    entre: 'Entre',
    yentre: 'Entre2',
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
    poliza: '01',
    aseguradora: '',
    fechaLlegada: 'FechaLlegada',
    horaLlegada: 'HoraLlegada',
    horaAccidente: 'HoraAccidente',
    ubicacion: 'Ubicacion',
    entre: 'Entre',
    yentre: 'Entre2',
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

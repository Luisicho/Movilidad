// To parse this JSON data, do
//
//     final vehiculoModel = vehiculoModelFromJson(jsonString);

import 'dart:convert';

VehiculoModel? vehiculoModelFromJson(String str) => VehiculoModel.fromJson(json.decode(str));

String vehiculoModelToJson(VehiculoModel? data) => json.encode(data!.toJson());

class VehiculoModel {
    VehiculoModel({
        this.id = '',
        this.noeconomico = '',
        this.placas = '',
        this.descripcion = '',
        this.concesionario = '',
        this.licencia = '',
        this.tipo = 'Chofer',
        this.vigencia = '',
        this.nombre = '',
    });

    String id;
    String noeconomico;
    String placas;
    String descripcion;
    String concesionario;
    String licencia;
    String tipo;
    String vigencia;
    String nombre;

    factory VehiculoModel.fromJson(Map<String, dynamic> json) => VehiculoModel(
        id: json["id"],
        noeconomico: json["noeconomico"],
        placas: json["placas"],
        descripcion: json["descripcion"],
        concesionario: json["concesionario"],
        licencia: json["licencia"],
        tipo: json["tipo"],
        vigencia: json["vigencia"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "noeconomico": noeconomico,
        "placas": placas,
        "descripcion": descripcion,
        "concesionario": concesionario,
        "licencia": licencia,
        "tipo": tipo,
        "vigencia": vigencia,
        "nombre": nombre,
    };
}

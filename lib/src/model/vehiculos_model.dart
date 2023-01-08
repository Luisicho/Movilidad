// To parse this JSON data, do
//
//     final vehiculoModel = vehiculoModelFromJson(jsonString);

import 'dart:convert';

VehiculoModel? vehiculoModelFromJson(String str) => VehiculoModel.fromJson(json.decode(str));

String vehiculoModelToJson(VehiculoModel? data) => json.encode(data!.toJson());

class VehiculoModel {
    VehiculoModel({
        this.id,
        this.noeconomico,
        this.placas,
        this.descripcion,
        this.concecionario,
        this.licencia,
        this.tipo,
        this.vigencia,
        this.nombre,
    });

    String? id;
    String? noeconomico;
    String? placas;
    String? descripcion;
    String? concecionario;
    String? licencia;
    String? tipo;
    String? vigencia;
    String? nombre;

    factory VehiculoModel.fromJson(Map<String, dynamic> json) => VehiculoModel(
        id: json["id"],
        noeconomico: json["noeconomico"],
        placas: json["placas"],
        descripcion: json["descripcion"],
        concecionario: json["concecionario"],
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
        "concecionario": concecionario,
        "licencia": licencia,
        "tipo": tipo,
        "vigencia": vigencia,
        "nombre": nombre,
    };
}

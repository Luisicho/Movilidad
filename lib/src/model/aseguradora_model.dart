// To parse this JSON data, do
//
//     final servicioMedicoModel = servicioMedicoModelFromJson(jsonString);

import 'dart:convert';

ServicioMedicoModel servicioMedicoModelFromJson(String str) => ServicioMedicoModel.fromJson(json.decode(str));

String servicioMedicoModelToJson(ServicioMedicoModel data) => json.encode(data.toJson());

class ServicioMedicoModel {
    ServicioMedicoModel({
        required this.id,
        required this.nombre,
    });

    int id;
    String nombre;

    factory ServicioMedicoModel.fromJson(Map<String, dynamic> json) => ServicioMedicoModel(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
    };
}

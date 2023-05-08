import 'dart:convert';

AfectadoModel afectadoModelFromJson(String str) =>
    AfectadoModel.fromJson(json.decode(str));

String afectadoModelToJson(AfectadoModel data) => json.encode(data.toJson());

class AfectadoModel {
  AfectadoModel({
    this.aseguradora = "",
    this.vigencia = "",
    this.nombreAc = "",
    this.curp = "",
    this.domicilio = "",
    this.tipoAtencion = "",
    this.institucionMedica = "",
    this.fechaRecepcion = "",
    this.horaRecepcion = "",
    this.fechaAlta = "",
    this.horaAlta = "",
    this.observaciones = "",
    this.icon = "airline_seat_flat_outlined",
  });

  String aseguradora;
  String vigencia;
  String nombreAc;
  String curp;
  String domicilio;
  String tipoAtencion;
  String institucionMedica;
  String fechaRecepcion;
  String horaRecepcion;
  String fechaAlta;
  String horaAlta;
  String observaciones;
  String icon;

  factory AfectadoModel.fromJson(Map<String, dynamic> json) => AfectadoModel(
        aseguradora: json["aseguradora"],
        vigencia: json["vigencia"],
        nombreAc: json["nombreAc"],
        curp: json["curp"],
        domicilio: json["domicilio"],
        tipoAtencion: json["tipoAtencion"],
        institucionMedica: json["institucionMedica"],
        fechaRecepcion: json["fechaRecepcion"],
        horaRecepcion: json["horaRecepcion"],
        fechaAlta: json["fechaAlta"],
        horaAlta: json["horaAlta"],
        observaciones: json["observaciones"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "aseguradora": aseguradora,
        "vigencia": vigencia,
        "nombreAc": nombreAc,
        "curp": curp,
        "domicilio": domicilio,
        "tipoAtencion": tipoAtencion,
        "institucionMedica": institucionMedica,
        "fechaRecepcion": fechaRecepcion,
        "horaRecepcion": horaRecepcion,
        "fechaAlta": fechaAlta,
        "horaAlta": horaAlta,
        "observaciones": observaciones,
        "icon": icon,
      };

  @override
  String toString() {
    return "Aseguradora: $aseguradora Vigencia: $vigencia NombreAc: $nombreAc CURP: $curp Domicilio: $domicilio TipoAtencion $tipoAtencion InstitucionMedica $institucionMedica FechaRecepcion: $fechaRecepcion HoraRecepcion $horaRecepcion FechaAlta: $fechaAlta HoraAlta: $horaAlta Observaciones $observaciones";
  }
}

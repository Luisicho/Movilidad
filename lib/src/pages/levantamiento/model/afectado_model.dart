import 'dart:convert';

AfectadoModel afectadoModelFromJson(String str) =>
    AfectadoModel.fromJson(json.decode(str));

String afectadoModelToJson(AfectadoModel data) => json.encode(data.toJson());

class AfectadoModel {
  AfectadoModel({
    required this.aseguradora,
    required this.poliza,
    required this.vigencia,
    required this.nombreAc,
    required this.curp,
    required this.domicilio,
    required this.tipoAtencion,
    required this.institucionMedica,
    required this.fechaRecepcion,
    required this.horaRecepcion,
    required this.fechaAlta,
    required this.horaAlta,
    required this.observaciones,
    required this.icon,
  });

  String aseguradora;
  String poliza;
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
        poliza: json["poliza"],
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
        "poliza": poliza,
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
    // TODO: implement toString
    return "Aseguradora: $aseguradora Poliza: $poliza Vigencia: $vigencia NombreAc: $nombreAc CURP: $curp Domicilio: $domicilio TipoAtencion $tipoAtencion InstitucionMedica $institucionMedica FechaRecepcion: $fechaRecepcion HoraRecepcion $horaRecepcion FechaAlta: $fechaAlta HoraAlta: $horaAlta Observaciones $observaciones";
  }
}

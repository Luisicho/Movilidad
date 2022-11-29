import 'package:flutter/material.dart';

class Afectado {
  //Caracteristicas
  final String aseguradora;
  final String poliza;
  final String vigencia;
  final String nombreAc;
  final String CURP;
  final String domicilio;
  final String tipoAtencion;
  final String institucionMedica;
  final String fechaRecepcion;
  final String horaRecepcion;
  final String fechaAlta;
  final String horaAlta;
  final String Observaciones;

  //Constructor
  Afectado(this.aseguradora,this.poliza,this.vigencia,this.nombreAc,this.CURP,this.domicilio,this.tipoAtencion,this.institucionMedica,this.fechaRecepcion,this.horaRecepcion,this.fechaAlta,this.horaAlta,this.Observaciones);

  @override
  String toString() {
    // TODO: implement toString
    return 
      "Aseguradora: $aseguradora Poliza: $poliza Vigencia: $vigencia NombreAc: $nombreAc CURP: $CURP Domicilio: $domicilio TipoAtencion $tipoAtencion InstitucionMedica $institucionMedica FechaRecepcion: $fechaRecepcion HoraRecepcion $horaRecepcion FechaAlta: $fechaAlta HoraAlta: $horaAlta Observaciones $Observaciones";
  }

}

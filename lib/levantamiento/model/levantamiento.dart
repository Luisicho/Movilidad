import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Levantamiento {
  //Caracteristicas
  String Folio;
  String FechaLlegada;
  String HoraLlegada;
  String HoraAccidente;
  String Ubicacion;
  String Entre;
  String Y;
  String Longitud;
  String Latitud;
  List<File> FotosLev = [File(''),File(''),File(''),File(''),File(''),File('')];
  String NoEconomico;
  String Placas;
  String Descripcion;
  String Concesionario;
  String NoLicencia;
  String Tipo;
  String Nombre;
  String Vigencia;

  //Constructor objeto vacio
  Levantamiento():
    this.Folio = "",
    this.FechaLlegada = "",
    this.HoraLlegada = "",
    this.HoraAccidente = "",
    this.Ubicacion = "",
    this.Entre = "",
    this.Y = "",
    this.Longitud = "",
    this.Latitud = "",
    this.NoEconomico = "",
    this.Placas = "",
    this.Descripcion = "",
    this.Concesionario = "",
    this.NoLicencia = "",
    this.Tipo = "",
    this.Nombre = "",
    this.Vigencia = "";
  

  //Constructor
  Levantamiento._init(
      this.Folio,
      this.FechaLlegada,
      this.HoraLlegada,
      this.HoraAccidente,
      this.Ubicacion,
      this.Entre,
      this.Y,
      this.Longitud,
      this.Latitud,
      this.FotosLev,
      this.NoEconomico,
      this.Placas,
      this.Descripcion,
      this.Concesionario,
      this.NoLicencia,
      this.Tipo,
      this.Nombre,
      this.Vigencia);
}

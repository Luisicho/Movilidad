import 'package:flutter/cupertino.dart';

class Levantamiento {
  //Caracteristica
  final String Folio;
  final String Descripcion;

  //Constructor
  const Levantamiento({
    required this.Folio,
    required this.Descripcion,
  });
}

const listEjemploLevantamiento = [
  Levantamiento(
    Folio: '1', 
    Descripcion: 'saludos'
  ),
  Levantamiento(
    Folio: '2', 
    Descripcion: 'adios'
  ),
  Levantamiento(
    Folio: '3', 
    Descripcion: 'hasta luego'
  ),
];

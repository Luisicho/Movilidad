import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  //Instancia de base de datos
  static Database? _database;
  //Iniciando instancia unica
  static final DBProvider db = DBProvider._();
  //Constructor privado
  DBProvider._();

  //Metodos get
  Future<Database?> get database async {
    //Verifica si ya se inicio la instancia de DB
    if (database != null) return _database;

    //Crea nueva instancia de DB
    _database = await initDB();

    return _database;
  }
  //Retorna Nueva instancia de DB
  Future<Database?> initDB() async{}
}

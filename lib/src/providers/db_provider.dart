import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path_provider/path_provider.dart';
import 'package:movilidad/src/pages/levantamiento/model/levantamiento_model.dart';
export 'package:movilidad/src/pages/levantamiento/model/levantamiento_model.dart';

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
  Future<Database?> initDB() async {
    //Path de donde almacenar la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    //Crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE LEVANTAMIENTO(
            ID INTEGER PRIMARY KEY,
            TIPO TEXT,
            VALOR TEXT
          );
        ''');
      },
    );
  }

  Future<int?> nuevoLevantamiento(LevantamientoModel nuevoLevantamiento) async {
    final db = await database;
    final res = db?.insert('LEVANTAMIENTO', nuevoLevantamiento.toJson());
    return res;
  }

  //Insercion Manual RAW
  Future<int?> nuevoLevatamientoRaw(
      LevantamientoModel nuevoLevantamiento) async {
    //Extraer caracteristicas de levantamiento
    String id = nuevoLevantamiento.Folio;
    String tipo = nuevoLevantamiento.Descripcion;
    String valor = nuevoLevantamiento.FechaLlegada;
    //verificar la base de datos
    final db = await database;
    //Insercion
    final res = await db?.rawInsert('''
      INSERT INTO LEVANTAMIENTO(ID,TIPO,VALOR)
        VALUES ('$id','$tipo','$valor')
    ''');

    return res;
  }
}

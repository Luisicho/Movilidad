import 'dart:io';

import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
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
}

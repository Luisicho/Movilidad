import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:movilidad/src/model/levantamiento_model.dart';
export 'package:movilidad/src/model/levantamiento_model.dart';

class DBProvider {
  //Instancia de base de datos
  static Database? _database;
  //Iniciando instancia unica
  static final DBProvider db = DBProvider._();
  //Constructor privado
  DBProvider._();

  //Metodos get
  Future<Database?> get database async {
    // Delete the database
    //await deleteDatabase(path);
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    //Verifica si ya se inicio la instancia de DB
    //if (database != null) return _database;

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


    //Sincronizacion con el BackEnd
    //    Reglaz de negocio
    //---------------Frappe OpenSource (ERPNext)------------------
    //    Usuarios,roles    Notificaciones    DocType(Modelos)    UI
    // -------------------Python BACKEND------------------
    // -------------------Javascript FRONTEND-------------
    // Maria DB 
    //Crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE LEVANTAMIENTO(
            folio INTEGER PRIMARY KEY AUTOINCREMENT,
            fechaLlegada TEXT,
            horaLlegada TEXT,
            horaAccidente TEXT,
            ubicacion TEXT,
            entre TEXT,
            y TEXT,
            longitud TEXT,
            latitud TEXT,
            noEconomico TEXT,
            placas TEXT,
            descripcion TEXT,
            concesionario TEXT,
            noLicencia TEXT,
            tipo TEXT,
            nombre TEXT,
            vigencia TEXT,
            CONSTRAINT FK_lev_afectadoLev FOREIGN KEY (folio) REFERENCES AFECTADO_LEV(folio)
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
    String id = nuevoLevantamiento.folio;
    String tipo = nuevoLevantamiento.descripcion;
    String valor = nuevoLevantamiento.fechaLlegada;
    //verificar la base de datos
    final db = await database;
    //Insercion
    final res = await db?.rawInsert('''
      INSERT INTO LEVANTAMIENTO(ID,TIPO,VALOR)
        VALUES ('$id','$tipo','$valor')
    ''');
    //Es el ID del ultimo registro insertado
    return res;
  }

  //Get Levantamiento By ID
  Future<LevantamientoModel?> getLevById(String folio) async {
    //verificar la base de datos
    final db = await database;
    //Consulta
    final res = await db!
        .query('LEVANTAMIENTO', where: 'folio = ?', whereArgs: [folio]);
    // SELECT * FROM LEVANTAMIENTO WHERE folio = '$folio'
    return res.isNotEmpty ? LevantamientoModel.fromJson(res.first) : null;
  }

  //Get Levantamiento By ID
  Future<List<LevantamientoModel>?> getAllLev() async {
    //verificar la base de datos
    final db = await database;
    //Consulta
    final res = await db!.query('LEVANTAMIENTO');

    return res.isNotEmpty
        ? res.map((e) => LevantamientoModel.fromJson(e)).toList()
        : [];
  }

  Future<int> updateLev(LevantamientoModel lev) async {
    //verificar la base de datos
    final db = await database;
    //Actualizacion
    final res = await db!.update('LEVANTAMIENTO', lev.toJson(), where: 'folio = ?', whereArgs: [lev.folio]);
    
    return res;
  }

  Future<int> deleteLev( String folio ) async{
    //verificar la base de datos
    final db = await database;
    //Eliminacion
    final res = await db!.delete('LEVANTAMIENTO', where: 'folio = ?', whereArgs: [folio]);
    
    return res;
  }

  Future<int> deleteAllRawLev( String folio ) async{
    //verificar la base de datos
    final db = await database;
    //Eliminacion
    final res = await db!.rawDelete('''
      DELETE FROM LEVANTAMIENTO
    ''');
    return res;
  }

}

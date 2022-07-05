
import 'dart:core';
import 'package:gestorderecordatorios/model/MedicamentoService.dart';
import 'package:gestorderecordatorios/model/TratamientoService.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'dart:async';

abstract class TratamientoRepo{

  Future <List<Medicamento>> get_medicamentos(int id);
  void agregar_medicamento(Medicamento muestra, int id);
  void agregar_tratamiento(Tratamiento muestra);
  Future <List<Tratamiento>> get_tratamientos();
  Future<int?> getCount();
}

class TratamientoSqlite implements TratamientoRepo{
  static Database? _db=null;
  Future<Database?> get db async{
    if(_db != null) return _db;
    _db = await initDb();
    return _db;
  }
  initDb() async{
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "GestorMedico.db");
    var theDb = await openDatabase(path ,version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async{
    await db.execute(
      'CREATE TABLE "tratamientos" ("tratamiento_id"	INTEGER, "nombre"	TEXT NOT NULL, "estado"	INTEGER NOT NULL, "comentario"	TEXT, PRIMARY KEY("tratamiento_id"))'
    );
    await db.transaction((txn) async {
      return await txn.rawInsert( "INSERT INTO tratamientos(nombre,estado) VALUES('"+"tratamiento ejemplo" +"','"+"1"+"')");
    });
    /*await db.execute(
        'CREATE TABLE "medicamentos" ("medicamento_id"	INTEGER, "tratamiento_id"	INTEGER, "nombre"	TEXT NOT NULL, "presentacion"	TEXT NOT NULL, "dosis"	TEXT NOT NULL, "horarios_horas"	INTEGER NOT NULL, "numero_dosis"	INTEGER, "comentario"	TEXT, FOREIGN KEY("tratamiento_id") REFERENCES "tratamientos"("tratamiento_id"), PRIMARY KEY("medicamento_id" AUTOINCREMENT))'
    );*/
    /*await db.execute(
        'CREATE TABLE "dosis" ("tratamiento_id"	INTEGER, "medicamento_id"	INTEGER, "dosis_id"	INTEGER, "estado"	INTEGER NOT NULL, "momento"	datetime NOT NULL, "comentario"	TEXT FOREIGN KEY("tratamiento_id") REFERENCES "tratamientos"("tratamiento_id"), FOREIGN KEY("medicamento_id") REFERENCES "medicamentos"("medicamento_id"),PRIMARY KEY("dosis_id" AUTOINCREMENT))'
    );*/
  }
  @override
  void agregar_medicamento(Medicamento muestra, int id) async{
    // TODO: implement agregar_medicamento
  }

  @override
  Future<List<Medicamento>> get_medicamentos(int id)async {
    // TODO: implement get_medicamentos
    throw UnimplementedError();
  }

  @override
  void agregar_tratamiento(muestra) async{
    var dbClient = await db;
    await dbClient?.transaction((txn) async {
      return await txn.rawInsert( "INSERT INTO tratamientos(nombre,estado) VALUES('"+ muestra.nombre+"','"+muestra.estado.toString()+"')");
    });
  }

  @override
  Future<List<Tratamiento>> get_tratamientos() async {
    var dbClient = await db;
    final response = await dbClient?.rawQuery('SELECT * FROM tratamientos');
    final listatratamientos = response?.map((tratamiento) => Tratamiento.fromJson(tratamiento)).toList() ?? [];
    return listatratamientos;
  }
  @override
  Future<int?> getCount() async {
    var dbClient = await db;
    var result = Sqflite.firstIntValue(
        await dbClient!.rawQuery("SELECT COUNT (*) FROM tratamientos")
    );
    return result;
  }
}
import 'package:crud/crud_object.dart';
import 'package:crud/task_object.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class DbProvider {
  static Database? database;
  var dbName = "crudDatabase.db";
  DbProvider() {
    createDb();
  }

// craete db
  Future<Database> createDb() async {
    // if (database == null) {
    if (kIsWeb) {
      var databaseFactory = databaseFactoryFfiWeb;
      database = await databaseFactory.openDatabase(
        dbName,
        options: OpenDatabaseOptions(
          version: 1,
          onCreate: (db, version) async {
            await db.execute(
                "CREATE TABLE crudDb(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, rollNo INTEGER, phoneNo TEXT)");
            await db.execute(
                "CREATE TABLE crudItems(id INTEGER PRIMARY KEY AUTOINCREMENT, task TEXT, isCompleted BOOLEAN, taskId INTEGER REFERENCES crudDb(id))");
          },
          // second syntax (taskId INTEGER FOREIGN KEY(taskId) REFERENCE crudDb(id))
        ),
      );
    } else {
      var path = join(await getDatabasesPath(), dbName);
      return openDatabase(path, version: 1, onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE crudDb(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, rollNo INTEGER, phoneNo TEXT)");
        await db.execute(
            "CREATE TABLE crudItems(id INTEGER PRIMARY KEY AUTOINCREMENT, task TEXT, isCompleted BOOLEAN, taskId INTEGER REFERENCES crudDb(id))");
      });
    }
    // }
    return Future.value(database);
  }

  void insertDb(CrudObject crudObject) async {
    var db = await createDb();
    db.insert("crudDb", crudObject.toJson());
  }

  void insertTaskDb(TaskObject taskObject) async {
    var db = await createDb();
    db.insert("crudItems", taskObject.toJson());
  }

// get db
  Future<List<CrudObject>> getList() async {
    var db = await createDb();
    final List<Map<String, dynamic>> maps = await db.query('crudDb');
    return List.generate(
      maps.length,
      (i) {
        return CrudObject(
          id: maps[i]['id'],
          name: maps[i]['name'],
          rollNo: maps[i]['rollNo'],
          phoneNo: maps[i]['phoneNo'],
        );
      },
    );
  }

// update db

  void updateData(CrudObject crudObject, int id) async {
    var db = await createDb();
    db.update(
      'crudDb',
      crudObject.toJson(),
      where: "id = ?",
      whereArgs: [id],
    );
  }

// delete db
  void deleteData(CrudObject crudObject) async {
    final db = await createDb();
    db.delete(
      'crudDb',
      where: "id = ?",
      whereArgs: [crudObject.id],
    );
  }
}

import 'package:crud/crud_object.dart';
import 'package:flutter/foundation.dart';
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
  createDb() async {
    if (database == null) {
      if (kIsWeb) {
        var databaseFactory = databaseFactoryFfiWeb;
        database = await databaseFactory.openDatabase(
          dbName,
          options: OpenDatabaseOptions(
            version: 1,
            onCreate: (db, version) {
              db.execute(
                  "CREATE TABLE crudDb(id PRIMARY KEY AUTOINCREMENT INTEGER, name TEXT, rollNo INTEGER,phoneNo TEXT)");
            },
          ),
        );
      } else {
        var path = join(await getDatabasesPath(), dbName);
        var db = openDatabase(path, version: 1, onCreate: (db, version) {
          db.execute(
              "CREATE TABLE crudDb(id PRIMARY KEY AUTOINCREMENT INTEGER, name TEXT, rollNo INTEGER,phoneNo TEXT)");
        });
      }
    }
  }

  void insertDb(CrudObject crudObject) {
    if (database != null) {
      database?.insert("crudDb", crudObject.toJson());
    }
  }

// get db

// update db
// delete db
}

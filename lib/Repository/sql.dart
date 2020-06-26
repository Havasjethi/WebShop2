import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


abstract class Sql {
  Database _db;
  String cartTable = 'cart';
  String profileTable = 'profile';
  bool _dbInited = false;
  bool _dbInitInProgress = false;

  Sql () {
    if (!(_dbInited || _dbInitInProgress)) {
      initDb()
        .then((_) {
        _dbInited = true;
        _dbInitInProgress = false;
      });
      _dbInitInProgress = true;
    }
  }

  Future<Database> get db async {
    if (_db == null) {
      await initDb();
    }

    return _db;
  }

  Future<void> initDb () async {
    this._db = await openDatabase(
      await getPath(),
      version: 1,
      onOpen: (db) async {
          db.execute(
            '''
            CREATE TABLE IF NOT EXISTS $cartTable (
            id INTEGER,
            color Text,
            amount Integer,
            PRIMARY KEY (id, color)
            );
            '''
          );
          db.execute(
            '''
          CREATE TABLE IF NOT EXISTS $profileTable (
              id Integer,
              username text,
              profile_image_path text,
              password text
          );
          '''
          ).then((value) {
            db.query(profileTable).then((value) {
              if (value.length == 0) {
                db.execute('''Insert into $profileTable (id, username) values (1, 'anonym');''');
              }
            });
          });
      }
    );
  }

  Future<String> getPath () async {
    return join(await getDatabasesPath() + 'havas_store.db' );
  }
}
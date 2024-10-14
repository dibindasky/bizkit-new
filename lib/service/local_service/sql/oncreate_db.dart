import 'dart:developer';
import 'package:bizkit/core/model/token/access_token/token_model.dart';
import 'package:bizkit/service/local_service/sql/bizcard/bizcard_oncreate_db.dart';
import 'package:bizkit/service/local_service/sql/task/task_oncreate_db.dart';
import 'package:sqflite/sqflite.dart' as sql;

class Sql {
  static const userTable = 'Users';
  static const localStorageTable = 'LocalStorage';

  static Future onCreate(sql.Database db) async {
    try {
      log('-----------------oncreate database ---------------------');
      await db.execute(queryUserTableCreation);
      await db.execute(queryLocalStorageTableCreation);
      BizCardSql.onCreate(db);
      TaskSql.onCreate(db);
    } catch (e) {
      log('onCreate ==> ${e.toString()}');
    }
  }

  static const String queryUserTableCreation = '''
      CREATE TABLE IF NOT EXISTS $userTable (
        localId INTEGER PRIMARY KEY AUTOINCREMENT,
        ${TokenModel.colUserId} TEXT,
        ${TokenModel.colName} TEXT,
        ${TokenModel.colAccess} TEXT,
        ${TokenModel.colRefresh} TEXT,
        ${TokenModel.colLogout} TEXT
      )
    ''';

  static const String queryLocalStorageTableCreation = '''
      CREATE TABLE IF NOT EXISTS $localStorageTable (
        localId INTEGER PRIMARY KEY AUTOINCREMENT,
        id TEXT,
        key TEXT,
        value TEXT
      )
    ''';
}

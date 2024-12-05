import 'dart:developer';
import 'package:bizkit/core/model/token/access_token/token_model.dart';
import 'package:bizkit/core/model/userSearch/user_search_success_responce/user_search_success_responce.dart';
import 'package:bizkit/module/module_manager/domain/model/access/access.dart';
import 'package:bizkit/service/local_service/sql/bizcard/bizcard_oncreate_db.dart';
import 'package:bizkit/service/local_service/sql/task/task_oncreate_db.dart';
import 'package:sqflite/sqflite.dart' as sql;

class Sql {
  static const userTable = 'Users';
  static const localStorageTable = 'LocalStorage';
  static const accessTable = 'AccessStorage';
  static const userFreequentSearchTable = 'UserFreequentSearchStorage';

  static Future onCreate(sql.Database db) async {
    try {
      log('-----------------oncreate database ---------------------');
      await db.execute(queryUserTableCreation);
      await db.execute(queryLocalStorageTableCreation);
      await db.execute(queryAccessTableCreation);
      await db.execute(queryUserFreequentlySearchTableCreation);
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
        ${TokenModel.colLogout} TEXT,
        ${TokenModel.colRole} TEXT,
        ${TokenModel.colOrganisationId} TEXT
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

  static const String queryAccessTableCreation = '''
      CREATE TABLE IF NOT EXISTS $accessTable (
        ${Access.colLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${Access.colId} TEXT,
        ${Access.colComesUnder} TEXT,
        ${Access.colAccess} TEXT,
        ${Access.colPermissions} TEXT,
        ${Access.colCurrentUserId} TEXT
      )
    ''';

  static const String queryUserFreequentlySearchTableCreation = '''
      CREATE TABLE IF NOT EXISTS $userFreequentSearchTable (
        ${UserSearchSuccessResponce.colLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${UserSearchSuccessResponce.colUserId} TEXT,
        ${UserSearchSuccessResponce.colName} TEXT,
        ${UserSearchSuccessResponce.colEmail} TEXT,
        ${UserSearchSuccessResponce.colPhoneNumber} TEXT,
        ${UserSearchSuccessResponce.colPhoto} TEXT,
        ${UserSearchSuccessResponce.colCount} TEXT,
        ${UserSearchSuccessResponce.colCurrentUserId} TEXT,
        ${UserSearchSuccessResponce.colModule} TEXT
      )
    ''';
}

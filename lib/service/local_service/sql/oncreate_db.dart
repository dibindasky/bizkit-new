import 'dart:developer';
import 'package:bizkit/core/model/token/access_token/token_model.dart';
import 'package:bizkit/module/biz_card/domain/model/contact/get_contact_responce_model/contact.dart';
import 'package:sqflite/sqflite.dart' as sql;

class Sql {
  static const userTable = 'Users';
  static const contactTable = 'Contact';
  static const localStorageTable = 'LocalStorage';

  static Future onCreate(sql.Database db) async {
    try {
      log('-----------------oncreate database---------------------');
      await db.execute(queryUserTableCreation);
      await db.execute(queryContactTableCreation);
      await db.execute(queryLocalStorageTableCreation);
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
        ${TokenModel.colRefresh} TEXT
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

  static const String queryContactTableCreation = '''
      CREATE TABLE IF NOT EXISTS $contactTable (
        ${ContactModel.colLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${ContactModel.colCurrentUserId} TEXT,
        ${ContactModel.colUserId} TEXT,
        ${ContactModel.colName} TEXT,
        ${ContactModel.colPhone} TEXT,
        ${ContactModel.colPhoto} TEXT,
        ${ContactModel.colEmail} TEXT,
        ${ContactModel.colCardId} TEXT,
        ${ContactModel.colConnectionId} TEXT
      )
    ''';
}

import 'package:bizkit/domain/model/contact/get_contacts_response_model/contact.dart';
import 'package:bizkit/domain/model/user/user.dart';
import 'package:sqflite/sqflite.dart' as sql;

class Sql {
  static const userTable = 'Users';
  static const contactTable = 'Contact';

  static Future onCreate(sql.Database db) async {
    await db.execute(queryUserTableCreation);
    await db.execute(queryContactTableCreation);
  }

  static const String queryContactTableCreation = '''
      CREATE TABLE IF NOT EXISTS $contactTable (
        ${Contact.colLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${Contact.colUserId} INTEGER,
        ${Contact.colName} TEXT,
        ${Contact.colPhone} TEXT,
      )
    ''';
    
  static const String queryUserTableCreation = '''
      CREATE TABLE IF NOT EXISTS $userTable (
        ${User.colLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${User.colId} INTEGER,
        ${User.colName} TEXT,
        ${User.colEmail} TEXT,
        ${User.colPhone} TEXT,
        ${User.colCompanyName} TEXT,
        ${User.colAddress} TEXT,
        ${User.colIsBusiness} INTEGER DEFAULT 0
      )
    ''';
}

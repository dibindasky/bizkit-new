import 'dart:developer';

import 'package:bizkit/module/biz_card/domain/model/contact/get_contact_responce_model/contact.dart';
import 'package:sqflite/sqflite.dart' as sql;

class BizCardSql {
  static const contactTable = 'Contact';

  static Future onCreate(sql.Database db) async {
    try {
      log('-----------------oncreate database bizcard module ---------------------');
      await db.execute(queryContactTableCreation);
    } catch (e) {
      log('onCreate ==> ${e.toString()}');
    }
  }

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

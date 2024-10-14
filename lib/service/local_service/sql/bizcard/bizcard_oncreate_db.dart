import 'dart:developer';

import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/card.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/connection.dart';
import 'package:bizkit/module/biz_card/domain/model/contact/get_contact_responce_model/contact.dart';
import 'package:sqflite/sqflite.dart' as sql;

class BizCardSql {
  static const contactTable = 'Contact';
  static const myConnectionTable = 'MyConnectionTable';
  static const myConnectcionCardTable = 'MyConnectionCardTable';

  static Future onCreate(sql.Database db) async {
    try {
      log('-----------------oncreate database bizcard module ---------------------');
      await db.execute(queryMyConnections);
      await db.execute(queryContactTableCreation);
      await db.execute(queryMyconnectionCard);
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

  static const String queryMyConnections = '''
    CREATE TABLE $myConnectionTable(
      ${MyConnection.colLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${MyConnection.colToUser}TEXT,
      ${MyConnection.colUserNmae}TEXT
    )''';

  static const String queryMyconnectionCard = '''
    CREATE TABLE $myConnectcionCardTable(
    ${Card.colLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${Card.colCollectionId}TEXT,
    ${Card.colCard}TEXT,
    ${Card.colUSer}TEXT,
    ${Card.colName}TEXT,
    ${Card.colBusinessName}TEXT,
    ${Card.colBusinessDesignation}TEXT,
    ${Card.colConnectedDate}TEXT,
    ${Card.colImageUrl}TEXT,
    ${Card.colConnectedVirQr}TEXT,
    FOREIGN KEY (relation_id) REFERENCE $myConnectionTable(${MyConnection.colLocalId}) ON DELETE CASCADE
    )
    ''';
}

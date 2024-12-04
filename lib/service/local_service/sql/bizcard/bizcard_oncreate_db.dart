import 'dart:developer';

import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/card.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/connection.dart';
import 'package:bizkit/module/biz_card/domain/model/contact/get_contact_responce_model/contact.dart';
import 'package:sqflite/sqflite.dart' as sql;

class BizCardSql {
  static const contactTable = 'Contact';
  static const myConnectionTable = 'MyConnectionTable';
  static const myConnectionCardTable = 'MyConnectionCardTable';
  static const bizcardTable = 'bizcard_table';

  static Future onCreate(sql.Database db) async {
    try {
      log('-----------------oncreate database bizcard module ---------------------');
      await db.execute(_bizcardTableCreation);
      await db.execute(queryContactTableCreation);
      await db.execute(queryMyConnections);
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
    CREATE TABLE IF NOT EXISTS $myConnectionTable(
      ${MyConnection.colLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${MyConnection.colCurrentUserId} TEXT,
      ${MyConnection.colToUser} TEXT,
      ${MyConnection.colUserNmae} TEXT
    )''';

  static const String queryMyconnectionCard = '''
    CREATE TABLE IF NOT EXISTS $myConnectionCardTable(
    ${Card.colLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${Card.colConnectionId} TEXT,
    ${Card.colCard} TEXT,
    ${Card.colUSer} TEXT,
    ${Card.colName} TEXT,
    ${Card.colBusinessName} TEXT,
    ${Card.colBusinessDesignation} TEXT,
    ${Card.colConnectedDate} TEXT,
    ${Card.colImageUrl} TEXT,
    ${Card.colConnectedVirQr} TEXT,
    ${Card.myConnectionIdReference} INTEGER,
    FOREIGN KEY (${Card.myConnectionIdReference}) REFERENCES $myConnectionTable(${MyConnection.colLocalId}) ON DELETE CASCADE
    )
    ''';

  // Table for bizcards
  static const String _bizcardTableCreation = '''
  CREATE TABLE IF NOT EXISTS $bizcardTable (
    ${CardDetailModel.colBizcardLocalId} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${CardDetailModel.colUserId} TEXT,
    ${CardDetailModel.colBizcardId} TEXT,
    ${CardDetailModel.colBizcardCompletionLevel} INTEGER,
    ${CardDetailModel.colBizcardisDefault} INTEGER, -- Boolean field (1 for true, 0 for false)
    ${CardDetailModel.colBizcardisBusinessEditable} INTEGER, -- Boolean field (1 for true, 0 for false)
    ${CardDetailModel.colBizcardIsArchived} INTEGER, -- Boolean field (1 for true, 0 for false)
    ${CardDetailModel.colBizcardIsDisabled} INTEGER, -- Boolean field (1 for true, 0 for false)
    ${CardDetailModel.colBizcardQrCode} TEXT,
    ${CardDetailModel.colBizcardUniversalLink} TEXT,
    ${CardDetailModel.colBizcardPersonlId} TEXT,
    ${CardDetailModel.colBizcardPersonlName} TEXT,
    ${CardDetailModel.colBizcardPersonlEmail} TEXT,
    ${CardDetailModel.colBizcardPersonlPhone} TEXT, -- Personal phone numbers stored as TEXT (e.g. comma-separated)
    ${CardDetailModel.colBizcardPersonlAddress} TEXT,
    ${CardDetailModel.colBizcardPersonlBloodGroup} TEXT,
    ${CardDetailModel.colBizcardPersonlDob} TEXT,
    ${CardDetailModel.colBizcardPersonlImages} TEXT, -- Personal images stored as TEXT (e.g. comma-separated)
    ${CardDetailModel.colBizcardPersonalStory} TEXT,
    ${CardDetailModel.colBizcardWantToShowPersonalStory} INTEGER, -- Boolean field (1 for true, 0 for false)
    ${CardDetailModel.colBizcardBusinessId} TEXT,
    ${CardDetailModel.colBizcardBusinessCategory} TEXT,
    ${CardDetailModel.colBizcardBusinessDesignation} TEXT,
    ${CardDetailModel.colBizcardBusinessCompanyName} TEXT,
    ${CardDetailModel.colBizcardBusinessLogo} TEXT,
    ${CardDetailModel.colBizcardBusinessLogoStory} TEXT,
    ${CardDetailModel.colBizcardBusinessemail} TEXT,
    ${CardDetailModel.colBizcardBusinessName} TEXT,
    ${CardDetailModel.colBizcardBusinessPhone} TEXT, -- Business phone numbers stored as TEXT (e.g. comma-separated)
    ${CardDetailModel.colBizcardBusinessWebSite} TEXT,
    ${CardDetailModel.colBizcardBusinessCompanyStory} TEXT,
    ${CardDetailModel.colBizcardBusinessBankDetailsId} TEXT,
    ${CardDetailModel.colBizcardBusinessBankName} TEXT,
    ${CardDetailModel.colBizcardBusinessAccountNumber} TEXT,
    ${CardDetailModel.colBizcardBusinessIFSCcode} TEXT,
    ${CardDetailModel.colBizcardBusinessUPI} TEXT,
    ${CardDetailModel.colBizcardBusinessGST} TEXT,
    ${CardDetailModel.colBizcardViews} INTEGER,
    ${CardDetailModel.colBizcardShareCount} INTEGER
  )
  ''';
}

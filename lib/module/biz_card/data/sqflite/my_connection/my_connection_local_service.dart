import 'dart:developer';

import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/card.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/connection.dart';
import 'package:bizkit/module/biz_card/domain/repository/sqflite/my_connection_repo.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:bizkit/service/local_service/sqflite_local_service.dart';
import 'package:bizkit/service/local_service/sql/bizcard/bizcard_oncreate_db.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:dartz/dartz.dart';

class MyConnectionLocalService implements MyConnectionLocalRepo {
  deleteAllLocalDatas() async {
    await localService.delete(BizCardSql.myConnectionTable);
  }

  final localService = LocalService();
  @override
  Future<Either<Failure, SuccessResponce>> addMyConnectionsIntoLocal(
      {required MyConnection myconnection}) async {
    try {
      final currentUserId = await SecureStorage.getUserId();
      const query = '''INSERT INTO ${BizCardSql.myConnectionTable}(
          ${MyConnection.colCurrentUserId},
          ${MyConnection.colToUser},
          ${MyConnection.colUserNmae} )
          VALUES (?,?,?)
           ''';
      int referenceLocalId = await localService.rawInsert(query, [
        currentUserId ?? '',
        myconnection.toUser ?? '',
        myconnection.username ?? ''
      ]);

      await cardInsertOrUpdate(myconnection.cards ?? [], referenceLocalId);

      return Right(SuccessResponce());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  cardInsert(Card card, referenceLocalId) async {
    const cardQeury = '''INSERT INTO ${BizCardSql.myConnectionCardTable}(
          ${Card.colConnectionId},
          ${Card.colCard},
          ${Card.colUSer},
          ${Card.colName},
          ${Card.colBusinessName},
          ${Card.colBusinessDesignation},
          ${Card.colConnectedDate},
          ${Card.colImageUrl},
          ${Card.colConnectedVirQr},
          ${Card.myConnectionIdReference})
          VALUES(?,?,?,?,?,?,?,?,?,?)
         ''';

    await localService.rawInsert(cardQeury, [
      card.connectionId ?? '',
      card.toCard ?? '',
      card.toUser ?? '',
      card.name ?? '',
      card.businessName ?? '',
      card.businessDesignation ?? '',
      card.connectedDate?.toString() ?? '',
      card.imageUrl?.toString() ?? '',
      card.connectedViaQr?.toString() ?? '',
      referenceLocalId
    ]);
  }

  @override
  Future<Either<Failure, SuccessResponseModel>>
      addMyConnecitonToLocalStorageIfNotPresentInStorage(
          {required MyConnection myconnection}) async {
    try {
      final currentUserId = await SecureStorage.getUserId();
      const String query =
          '''SELECT COUNT(*) FROM ${BizCardSql.myConnectionTable} WHERE ${MyConnection.colCurrentUserId} = ? AND ${MyConnection.colToUser} = ?''';
      final bool present = await localService.presentOrNot(
          query, [currentUserId ?? '', myconnection.toUser ?? '']);

      if (!present) {
        await addMyConnectionsIntoLocal(myconnection: myconnection);
      } else {
        await updateCurrentUserData(myconnection: myconnection);
        // await addMyConnectionsIntoLocal(myconnection: myconnection);
      }
      return Right(SuccessResponseModel());
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> updateCurrentUserData(
      {required MyConnection myconnection}) async {
    try {
      final currentUserId = await SecureStorage.getUserId();
      final localId = myconnection.localId ?? '';

      // Update the MyConnection table with new values
      const updateMyconnectionQuery = '''
      UPDATE ${BizCardSql.myConnectionTable}
      SET ${MyConnection.colCurrentUserId} = ?, 
          ${MyConnection.colToUser} = ?, 
          ${MyConnection.colUserNmae} = ?
      WHERE ${MyConnection.colLocalId} = ?''';

      await localService.rawUpdate(updateMyconnectionQuery, [
        currentUserId ?? '',
        myconnection.toUser ?? '',
        myconnection.username ?? '',
        localId
      ]);
      // Update the MyConnectionCard table for each card
      await cardInsertOrUpdate(myconnection.cards ?? [], localId);

      return Right(SuccessResponce());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  cardInsertOrUpdate(List<Card> listOfCards, localId) async {
    try {
      const String query =
          '''SELECT COUNT(*) FROM ${BizCardSql.myConnectionCardTable} WHERE ${Card.myConnectionIdReference} = ? AND ${Card.colCard} = ?''';
      for (var card in listOfCards) {
        bool present =
            await localService.presentOrNot(query, [localId, card.toCard]);
        if (!present) {
          await cardInsert(card, localId);
        } else {
          await cardUpdate(card: card, referenceLocalId: localId);
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  cardUpdate({required Card card, required int referenceLocalId}) async {
    const updateCardQuery = '''
      UPDATE ${BizCardSql.myConnectionCardTable}
      SET ${Card.colConnectionId} = ?, 
          ${Card.colCard} = ?, 
          ${Card.colUSer} = ?, 
          ${Card.colName} = ?, 
          ${Card.colBusinessName} = ?, 
          ${Card.colBusinessDesignation} = ?, 
          ${Card.colConnectedDate} = ?, 
          ${Card.colImageUrl} = ?, 
          ${Card.colConnectedVirQr} = ?
      WHERE ${Card.myConnectionIdReference} = ? AND ${Card.colCard} = ?''';

    await localService.rawUpdate(updateCardQuery, [
      card.connectionId ?? '',
      card.toCard ?? '',
      card.toUser ?? '',
      card.name ?? '',
      card.businessName ?? '',
      card.businessDesignation ?? '',
      card.connectedDate?.toString() ?? '',
      card.imageUrl?.toString() ?? '',
      card.connectedViaQr?.toString() ?? '',
      referenceLocalId,
      card.toCard ?? '' // The card's existing connectionId as a reference
    ]);
  }

  @override
  Future<Either<Failure, SuccessResponce>> getMyconnectionsFromLocal() async {
    try {
      final currentUserId = await SecureStorage.getUserId();
      // First, get the connections for the current user
      const myConnectionQuery =
          '''SELECT * FROM ${BizCardSql.myConnectionTable} WHERE ${MyConnection.colCurrentUserId} = ?''';
      final myConnectionResult =
          await localService.rawQuery(myConnectionQuery, [currentUserId]);
      if (myConnectionResult.isEmpty) {
        return Left(Failure());
      }

      // Prepare a list to store the retrieved connections
      List<MyConnection> connections = [];

      // Iterate through each connection result to fetch associated cards
      for (var connection in myConnectionResult) {
        final localId = connection[MyConnection.colLocalId] as int;

        // Get the associated cards for the current connection
        const cardQuery =
            '''SELECT * FROM ${BizCardSql.myConnectionCardTable} WHERE ${Card.myConnectionIdReference} = ?''';

        final cardResults = await localService.rawQuery(cardQuery, [localId]);

        // Convert the card results to a list of Card objects
        List<Card> cards = cardResults.map((cardData) {
          return Card(
            connectionId: cardData[Card.colConnectionId] as String,
            toCard: cardData[Card.colCard] as String,
            toUser: cardData[Card.colUSer] as String,
            name: cardData[Card.colName] as String,
            businessName: cardData[Card.colBusinessName] as String,
            businessDesignation:
                cardData[Card.colBusinessDesignation] as String,
            connectedDate:
                DateTime.tryParse(cardData[Card.colConnectedDate] as String),
            imageUrl: cardData[Card.colImageUrl] as String,
            connectedViaQr:
                (cardData[Card.colConnectedVirQr] == 'true') ? true : false,
          );
        }).toList();

        // Create a MyConnection object and add it to the list
        connections.add(MyConnection(
            localId: localId,
            toUser: connection[MyConnection.colToUser] as String,
            username: connection[MyConnection.colUserNmae] as String,
            cards: cards));
      }

      return Right(SuccessResponce(data: connections));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> deleteMyconnectionFromlocal(
      {required String currentUserId, required String colToUser}) async {
    try {
      const deleteUserQuery =
          '''DELETE FROM ${BizCardSql.myConnectionTable} WHERE ${MyConnection.colCurrentUserId} = ? AND ${MyConnection.colToUser} = ?''';
      await localService.rawDelete(deleteUserQuery, [currentUserId, colToUser]);
      return Right(SuccessResponce(data: 'success'));
    } catch (e) {
      return Left(Failure(data: e.toString()));
    }
  }
}

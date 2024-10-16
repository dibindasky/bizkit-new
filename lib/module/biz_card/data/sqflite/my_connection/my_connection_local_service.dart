import 'package:bizkit/core/model/failure/failure.dart';
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
      int myConnectionId = await localService.rawInsert(query, [
        currentUserId ?? '',
        myconnection.toUser ?? '',
        myconnection.username ?? ''
      ]);

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

      for (var cards in myconnection.cards ?? <Card>[]) {
        await localService.rawInsert(cardQeury, [
          cards.connectionId ?? '',
          cards.toCard ?? '',
          cards.toUser ?? '',
          cards.name ?? '',
          cards.businessName ?? '',
          cards.businessDesignation ?? '',
          cards.connectedDate?.toString() ?? '',
          cards.imageUrl?.toString() ?? '',
          cards.connectedViaQr?.toString() ?? '',
          myConnectionId
        ]);
      }

      return Right(SuccessResponce());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponce>> deleteAndUpdateCurrentUserData(
      {required MyConnection myconnection}) async {
    try {
      final localId = myconnection.localId ?? '';

      const deleteMyconnectionQuery =
          '''DELETE FROM ${BizCardSql.myConnectionTable} WHERE ${MyConnection.colLocalId} =?''';
      const deleteMyconnectionCardQuery =
          '''DELETE FROM ${BizCardSql.myConnectionCardTable} WHERE ${Card.myConnectionIdReference} =?''';

      await localService.rawDelete(deleteMyconnectionQuery, [localId]);
      await localService.rawDelete(deleteMyconnectionCardQuery, [localId]);

      await addMyConnectionsIntoLocal(myconnection: myconnection);

      return Right(SuccessResponce());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
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
        final localId = connection[MyConnection.colLocalId];

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
            localId: localId as int,
            toUser: connection[MyConnection.colToUser] as String,
            username: connection[MyConnection.colUserNmae] as String,
            cards: cards));
      }

      return Right(SuccessResponce(data: connections));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}

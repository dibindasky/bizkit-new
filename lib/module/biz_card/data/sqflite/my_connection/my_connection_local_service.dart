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
  final localService = LocalService();
  @override
  Future<Either<Failure, SuccessResponce>> addMyConnectionsIntoLocal(
      {required MyConnection myconnection}) async {
    try {
      final currentUserId = await SecureStorage.getUserId();
      const query = '''INSERT INTO ${BizCardSql.myConnectionTable}(
          ${MyConnection.colCurrentUserId}
          ${MyConnection.colToUser},
          ${MyConnection.colUserNmae} 
          VALUES (?,?,?)
          ) ''';
      final myConnectionId = await localService.rawInsert(query, [
        currentUserId ?? '',
        myconnection.toUser ?? '',
        myconnection.username ?? ''
      ]);

      const cardQeury = '''INSERT INTO ${BizCardSql.myConnectcionCardTable}(
          ${Card.colConnectionId}
          ${Card.colCard}
          ${Card.colUSer}
          ${Card.colName}
          ${Card.colBusinessName}
          ${Card.colBusinessDesignation}
          ${Card.colConnectedDate}
          ${Card.colImageUrl}
          ${Card.colConnectedVirQr},
          ${Card.myConnectionIdReference}
          VALUES(?,?,?,?,?,?,?,?,?,?)
        ) ''';

      for (var cards in myconnection.cards ?? <Card>[]) {
        await localService.rawInsert(cardQeury, [
          cards.connectionId,
          cards.toCard,
          cards.toUser,
          cards.name,
          cards.businessName,
          cards.businessDesignation,
          cards.connectedDate,
          cards.imageUrl,
          cards.connectedViaQr,
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
          '''DELETE FROM ${BizCardSql.myConnectcionCardTable} WHERE ${Card.myConnectionIdReference} =?''';

      await localService.rawDelete(deleteMyconnectionQuery, [localId]);
      await localService.rawDelete(deleteMyconnectionCardQuery, [localId]);

      await addMyConnectionsIntoLocal(myconnection: myconnection);

      return Right(SuccessResponce());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, SuccessResponce>> getMyconnections({required MyConnection myconnection})async {
    try{
      return Right(SuccessResponce());
    }catch(e){
      return Left(Failure(message: e.toString()));
    }
  }
}

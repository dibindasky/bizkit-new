import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/connection.dart';
import 'package:bizkit/module/biz_card/domain/repository/sqflite/my_connection_repo.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:bizkit/service/local_service/sqflite_local_service.dart';
import 'package:bizkit/service/local_service/sql/bizcard/bizcard_oncreate_db.dart';
import 'package:dartz/dartz.dart';

class MyConnectionLocalService implements MyConnectionLocalRepo {
  final localService =LocalService();
  @override
  Future<Either<Failure, SuccessResponce>> addMyConnectionsIntoLocal(
      {required MyConnection myconnection})async {
        try{
          const query ='''INSERT INTO ${BizCardSql.myConnectionTable}(
          ${MyConnection.colToUser},
          ${MyConnection.colUserNmae} 
          VALUES (?,?)
          ) ''';
          await localService.rawInsert(query,[
            myconnection.toUser??'',
            myconnection.username??''
          ]);

        // const cardQeury = '''INSERT INTO ${BizCardSql.myConnectcionCardTable}(
          
        // ) '''

         return Right(SuccessResponce());
        }catch(e){
          return Left(Failure(message: e.toString()));
        }
      }
}

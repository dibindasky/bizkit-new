import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/connection.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:dartz/dartz.dart';

abstract class MyConnectionLocalRepo{
  Future<Either<Failure,SuccessResponce>> addMyConnectionsIntoLocal({required MyConnection myconnection});
  Future<Either<Failure,SuccessResponce>>updateCurrentUserData({required MyConnection myconnection});
  Future<Either<Failure,SuccessResponce>>getMyconnectionsFromLocal();
  Future<Either<Failure, SuccessResponseModel>>addMyConnecitonToLocalStorageIfNotPresentInStorage({required MyConnection myconnection});
  Future<Either<Failure, SuccessResponce>>deleteMyconnectionFromlocal({required String currentUserId,required String colToUser});
}
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/connection.dart';
import 'package:bizkit/module/task/domain/model/success_responce/success_responce.dart';
import 'package:dartz/dartz.dart';

abstract class MyConnectionLocalRepo{
  Future<Either<Failure,SuccessResponce>>addMyConnectionsIntoLocal({required MyConnection myconnection});
  Future<Either<Failure,SuccessResponce>>deleteAndUpdateCurrentUserData({required MyConnection myconnection});
  Future<Either<Failure,SuccessResponce>>getMyconnections({required MyConnection myconnection});
}
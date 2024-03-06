import 'dart:developer';

import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/model/connections/add_connection_tag_model/add_connection_tag_model.dart';
import 'package:bizkit/domain/model/connections/block_bizkit_connection/block_bizkit_connection.dart';
import 'package:bizkit/domain/model/connections/create_connection_with_card_id_model/create_connection_with_card_id_model.dart';
import 'package:bizkit/domain/model/connections/get_bizkit_connections_response_model/get_bizkit_connections_response_model.dart';
import 'package:bizkit/domain/repository/service/connection_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ConnectionRepo)
@injectable
class ConnectionService implements ConnectionRepo {
  final ApiService _apiService;

  ConnectionService(this._apiService);

  @override
  Future<Either<Failure, SuccessResponseModel>> createBizkitConnection(
      {required CreateConnectionWithCardIdModel
          createConnectionWithCardIdModel}) async {
    try {
      log('createBizkitConnection ');
      print(
          'createBizkitConnection  ${createConnectionWithCardIdModel.toJson()}');
      await _apiService.post(ApiEndPoints.createBizkitConnection,
          data: createConnectionWithCardIdModel.toJson());
      log('createBizkitConnection done');
      return Right(
          SuccessResponseModel(message: 'added to connection successfully'));
    } on DioException catch (e) {
      log('createBizkitConnection dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure(message: 'Failed to create connection'));
    } catch (e) {
      log('createBizkitConnection exception error');
      log(e.toString());
      return Left(Failure(message: 'Failed to create connection'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> addTagToBizkitconnection(
      {required AddConnectionTagModel addConnectionTagModel,
      required int connectionId}) async {
    try {
      log('addTagToBizkitconnection ');
      print('addTagToBizkitconnection  ${addConnectionTagModel.toJson()}');
      await _apiService.patch(
          ApiEndPoints.addTagToBizkitconnection
              .replaceFirst('{connection_id}', connectionId.toString()),
          data: addConnectionTagModel.toJson());
      log('addTagToBizkitconnection done');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('addTagToBizkitconnection dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('addTagToBizkitconnection exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> blockBizkitConnecction(
      {required BlockBizkitConnection blockBizkitConnection,
      required int connectionId}) async {
    try {
      log('blockBizkitConnecction ');
      print('blockBizkitConnecction  ${blockBizkitConnection.toJson()}');
      await _apiService.patch(
          ApiEndPoints.blockBizkitConnecction
              .replaceFirst('{connection_id}', connectionId.toString()),
          data: blockBizkitConnection.toJson());
      log('blockBizkitConnecction done');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('blockBizkitConnecction dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('blockBizkitConnecction exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, GetBizkitConnectionsResponseModel>>
      getBizkitConnections({required PageQuery pageQuery}) async {
    try {
      log('getBizkitConnections ');
      final response = await _apiService.patch(ApiEndPoints.createCardBusiness,
          queryParameters: pageQuery.toJson());
      log('getBizkitConnections done');
      return Right(GetBizkitConnectionsResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      log('getBizkitConnections dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('getBizkitConnections exception error');
      log(e.toString());
      return Left(Failure());
    }
  }
}

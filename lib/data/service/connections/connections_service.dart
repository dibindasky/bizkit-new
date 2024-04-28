import 'dart:developer';
import 'package:bizkit/data/service/api_service.dart';
import 'package:bizkit/domain/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/model/connections/add_connection_request_model/add_connection_request_model.dart';
import 'package:bizkit/domain/model/connections/add_connection_tag_model/add_connection_tag_model.dart';
import 'package:bizkit/domain/model/connections/block_bizkit_connection/block_bizkit_connection.dart';
import 'package:bizkit/domain/model/connections/connection_request_id_model/connection_request_id_model.dart';
import 'package:bizkit/domain/model/connections/create_connection_with_card_id_model/create_connection_with_card_id_model.dart';
import 'package:bizkit/domain/model/connections/get_bizkit_connections_response_model/get_bizkit_connections_response_model.dart';
import 'package:bizkit/domain/model/connections/get_request_list_responsemodel/get_request_list_responsemodel.dart';
import 'package:bizkit/domain/model/connections/get_serch_connection_response_model/get_serch_connection_response_model.dart';
import 'package:bizkit/domain/model/profile/blocked_connection_model/blocked_connection_model.dart';
import 'package:bizkit/domain/model/search_query/search_query.dart';
import 'package:bizkit/domain/repository/service/connection_request_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ConnectionRequestRepo)
@injectable
class ConnectionService implements ConnectionRequestRepo {
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
      final response = await _apiService.post(
          ApiEndPoints.createBizkitConnection,
          data: createConnectionWithCardIdModel.toJson());
      log('createBizkitConnection done');
      return Right(SuccessResponseModel(
          message: 'added to connection successfully',
          data: response.data['id']));
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
      final response = await _apiService.get(
          ApiEndPoints.bizkitConnectionListing,
          queryParameters: pageQuery.toJson());
      log('getBizkitConnections done');
      print(response.data);
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

  @override
  Future<Either<Failure, GetSerchConnectionResponseModel>> searchBizkitUser(
      {required SearchQuery searchQuery}) async {
    try {
      log('searchBizkitUser ');
      final response = await _apiService.get(ApiEndPoints.searchBizkitUser,
          queryParameters: searchQuery.toJson());
      log('searchBizkitUser done');
      return Right(GetSerchConnectionResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      log('searchBizkitUser dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('searchBizkitUser exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> addConnectionRequest(
      {required AddConnectionRequestModel addConnectionRequestModel}) async {
    try {
      log('addConnectionRequest ');
      print(addConnectionRequestModel.toJson());
      final response = await _apiService.post(ApiEndPoints.connectionRequest,
          data: addConnectionRequestModel.toJson());
      log('addConnectionRequest done');
      return Right(SuccessResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      log('addConnectionRequest dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('addConnectionRequest exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, GetRequestListResponsemodel>> getRequestList() async {
    try {
      log('getRequestList ');
      final response = await _apiService.get(ApiEndPoints.connectionRequest);
      log('getRequestList done');
      return Right(GetRequestListResponsemodel.fromJson(response.data));
    } on DioException catch (e) {
      log('getRequestList dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('getRequestList exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> deleteConnectionRequest(
      {required int id}) async {
    try {
      log('deleteConnectionRequest ');
      print('deleteConnectionRequest  $id');
      await _apiService.delete(ApiEndPoints.deleteConnectionRequest
          .replaceFirst('{id}', id.toString()));
      log('deleteConnectionRequest done');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('deleteConnectionRequest dio error');
      log(e.toString());
      log(e.response.toString());
      return Left(Failure());
    } catch (e) {
      log('deleteConnectionRequest exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, BlockedConnectionModel>> getBlockeConnections({
    required PageQuery pageQuery,
  }) async {
    try {
      final responce = await _apiService.get(
        ApiEndPoints.getBlockedConnections,
        data: pageQuery.toJson(),
      );
      log('getBlockeConnections data ${responce.data}');
      return Right(BlockedConnectionModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('getBlockeConnections dio error $e');
      return Left(Failure());
    } catch (e) {
      log('getBlockeConnections exception error');
      log(e.toString());
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> removeConnectionRequest(
      {required ConnectionRequestIdModel connectionRequestIdModel}) async {
    try {
      final responce = await _apiService.get(
        ApiEndPoints.removeConnectionRequest,
        data: connectionRequestIdModel.toJson(),
      );
      log('removeConnectionRequest data ${responce.data}');
      return Right(SuccessResponseModel());
    } on DioException catch (e) {
      log('removeConnectionRequest dio error $e');
      return Left(Failure());
    } catch (e) {
      log('removeConnectionRequest exception error');
      log(e.toString());
      return Left(Failure());
    }
  }
}

import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/search_query/search_query.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/recieved_connection_requests_responce/recieved_connection_requests_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/search_connections_responce/search_connections_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_request/send_connection_request.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/connections/connections_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ConnectionsService implements ConnectionsRepo {
  final ApiService apiService = ApiService();

  @override
  Future<Either<Failure, SuccessResponseModel>> sendConnectionRequest(
      {required SendConnectionRequest connectionRequest}) async {
    try {
      final responce = await apiService.post(
        ApiEndPoints.sentConnectionRequest,
        data: connectionRequest.toJson(),
      );
      log('sendConnectionRequest ==> success ${responce.data}');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('sendConnectionRequest DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('sendConnectionRequest catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SearchConnectionsResponce>> searchConnections(
      {required SearchQuery searchQuery}) async {
    try {
      final responce = await apiService.post(
        ApiEndPoints.searchConnection,
        data: searchQuery.toJson(),
      );
      log('searchConnections ==> success ${responce.data} ');
      return Right(SearchConnectionsResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('searchConnections DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('searchConnections catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, RecievedConnectionRequestsResponce>>
      recievedConnectionRequests() async {
    try {
      final responce = await apiService.get(
        ApiEndPoints.recievedConnectionRequests,
      );
      log('recievedConnectionRequests ==> success ${responce.data}');
      return Right(RecievedConnectionRequestsResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('recievedConnectionRequests DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('recievedConnectionRequests catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }
}

import 'dart:developer';

import 'package:bizkit/core/api_endpoints/api_endpoints.dart';
import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/pagination_query/pagination_query.dart';
import 'package:bizkit/core/model/search_query/search_query.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/accept_or_reject_connection_request/accept_or_reject_connection_request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/bizcard_users_search_responce/bizcard_users_search_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/cancel_connection_request_model/cancel_connection_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/connection_check/connection_check_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/connection_detail/connection_detail.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/connection_request_accept_or_reject_responce/connection_request_accept_or_reject_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/follow_back_request_model/follow_back_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/my_connections_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/recieved_connection_requests_responce/recieved_connection_requests_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_request/send_connection_request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_requets_responce/send_connection_requets_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_responce/send_connection_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/shared_cards/shared_cards_response.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/unfollow_connection_model/unfollow_connection_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/connections/connections_repo.dart';
import 'package:bizkit/service/api_service/api_service.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ConnectionsRepo)
@injectable
class ConnectionsService implements ConnectionsRepo {
  final ApiService apiService = ApiService();

  @override
  Future<Either<Failure, SendConnectionResponce>> sendConnectionRequest(
      {required SendConnectionRequest connectionRequest}) async {
    try {
      final responce = await apiService.post(
        ApiEndPoints.sentConnectionRequest,
        data: connectionRequest.toJson(),
      );
      log('sendConnectionRequest ==> success ');
      return Right(SendConnectionResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('sendConnectionRequest DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('sendConnectionRequest catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, MyConnectionsResponce>> searchConnections(
      {required SearchQuery searchQuery}) async {
    try {
      log('search tojson = ${searchQuery.toJson()}');
      final responce = await apiService.post(
        ApiEndPoints.searchConnection,
        data: searchQuery.toJson(),
      );
      log('searchConnections ==--> success ');
      return Right(MyConnectionsResponce.fromJson(responce.data));
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
      log('recievedConnectionRequests ==> success ');
      return Right(RecievedConnectionRequestsResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('recievedConnectionRequests DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('recievedConnectionRequests catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, BizcardUsersSearchResponce>> searchBizkitUsers(
      {required SearchQuery searchQuery}) async {
    try {
      log('searchbiskit${searchQuery.toJson()}');
      final responce = await apiService.post(
        ApiEndPoints.searchCardUsers,
        data: searchQuery.toJson(),
      );
      log('searchBizkitUsers ==> success ');

      return Right(BizcardUsersSearchResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('searchBizkitUsers DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('searchBizkitUsers catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SendConnectionRequetsResponce>>
      getAllSendConnectionRequests() async {
    try {
      final responce = await apiService.get(
        ApiEndPoints.getAllSendConnectionRequests,
      );
      log('getAllSendConnectionRequests ==> success ');

      return Right(SendConnectionRequetsResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('getAllSendConnectionRequests DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getAllSendConnectionRequests catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, MyConnectionsResponce>> getMyconnections(
      {required PaginationQuery paginationQuery}) async {
    try {
      // log('getMyconnections TO JSON -> ${paginationQuery.toJson()}');
      final responce = await apiService.get(ApiEndPoints.myConnections,
          queryParameters: paginationQuery.toJson());
      log('getMyconnections ==> success ');
      return Right(MyConnectionsResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('getMyconnections DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getMyconnections catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> cancelConnectionRequest(
      {required CancelConnectionRequestModel cancelConnectionRequest}) async {
    try {
      final responce = await apiService.post(
        ApiEndPoints.cancelConnectionRequest,
        data: cancelConnectionRequest.toJson(),
      );
      log('cancelConnectionRequest ==> success ');

      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('cancelConnectionRequest DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('cancelConnectionRequest catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> folowbackRequest(
      {required FollowBackRequestModel folowbackRequest}) async {
    try {
      final responce = await apiService.post(ApiEndPoints.followbackRequest,
          data: folowbackRequest.toJson());
      log('folowbackRequest ==> success ');

      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('folowbackRequest DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('folowbackRequest catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, ConnectionRequestAcceptOrRejectResponce>>
      acceptOrRejectConnectionRequest(
          {required AcceptOrRejectConnectionRequest acceptOrReject}) async {
    log(acceptOrReject.toJson().toString());
    log(acceptOrReject.sharedFields!.business!.toJson().toString());

    try {
      final responce = await apiService.patch(
        ApiEndPoints.recievedConnectionRequests,
        data: acceptOrReject.toJson(),
      );
      log('acceptOrRejectConnectionRequest ==> success  ');

      return Right(
          ConnectionRequestAcceptOrRejectResponce.fromJson(responce.data));
    } on DioException catch (e) {
      log('acceptOrRejectConnectionRequest DioException ${e.response?.data} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('acceptOrRejectConnectionRequest catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> unfollowRequest(
      {required UnfollowConnectionModel unfollowRequest}) async {
    try {
      final responce = await apiService.delete(
        ApiEndPoints.unfollowConnection,
        data: unfollowRequest.toJson(),
      );
      log('unfollowRequest ==> success ');

      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('unfollowRequest DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('unfollowRequest catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, CardDetailModel>> getConnectionCard(
      {required String cardId}) async {
    try {
      final responce = await apiService.get(
        ApiEndPoints.viewConnectionCards,
        data: {'bizcard_id': cardId},
      );
      log('getConnectionCard ==> success ');
      return Right(CardDetailModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('getConnectionCard DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getConnectionCard catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> addOrUpdateConnectionDetails(
      {required ConnectionDetail connectionDetail}) async {
    try {
      log('addOrUpdateConnectionDetails data => ${connectionDetail.toJson()}');
      final responce = await apiService.patch(
        ApiEndPoints.updateConnectionDetails,
        data: connectionDetail.toJson(),
      );
      log('addOrUpdateConnectionDetails ==> success ');
      final map = responce.data as Map<String, dynamic>?;
      return Right(SuccessResponseModel(data: map));
    } on DioException catch (e) {
      log('addOrUpdateConnectionDetails DioException ${e.response?.data['error']} $e');
      return Left(Failure(
          message: (e.response?.data as Map<String, dynamic>?)?['error'] ??
              errorMessage));
    } catch (e) {
      log('addOrUpdateConnectionDetails catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, List<ConnectionCheckResponseModel>>>
      checkConnecitonExists({required String userID}) async {
    try {
      log('checkConnecitonExists data => $userID');
      final responce = await apiService.post(
        ApiEndPoints.checkConnectionExists,
        data: {"user_id": userID},
      );
      log('checkConnecitonExists ==> success ');
      return Right((responce.data['result'] as List<dynamic>)
          .map((e) =>
              ConnectionCheckResponseModel.fromJson(e as Map<String, dynamic>))
          .toList());
    } on DioException catch (e) {
      log('checkConnecitonExists DioException ${e.response?.data['error']} $e');
      return Left(Failure(
          message: (e.response?.data as Map<String, dynamic>?)?['error'] ??
              errorMessage));
    } catch (e) {
      log('checkConnecitonExists catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SharedCardsResponseModel>> getMySharedCards() async {
    try {
      final responce = await apiService.get(ApiEndPoints.sharedCardRequests);
      log('getMySharedCards ==> success ');
      return Right(SharedCardsResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('getMySharedCards DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('getMySharedCards catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }

  @override
  Future<Either<Failure, SuccessResponseModel>> sharedCardAcceptOrReject(
      {required String id, required bool accept}) async {
    try {
      final responce = await apiService.patch(ApiEndPoints.sharedCardRequests,
          data: {
            "shared_card_collection_id": id,
            "status": accept ? 'accepted' : 'rejected'
          });
      log('sharedCardAcceptOrReject ==> success ');
      log('sharedCardAcceptOrReject ==> ${responce.data} ');
      return Right(SuccessResponseModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('sharedCardAcceptOrReject message=> ${e.response}');
      log('sharedCardAcceptOrReject DioException ${e.response?.statusCode} $e');
      return Left(Failure(message: errorMessage));
    } catch (e) {
      log('sharedCardAcceptOrReject catch $e');
      return Left(Failure(message: 'Failed to request'));
    }
  }
}

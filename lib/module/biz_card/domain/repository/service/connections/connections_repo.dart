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
import 'package:bizkit/module/biz_card/domain/model/connections/search_connection_responce/search_connection_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_request/send_connection_request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_requets_responce/send_connection_requets_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_responce/send_connection_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/shared_cards/shared_cards_response.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/unfollow_connection_model/unfollow_connection_model.dart';
import 'package:dartz/dartz.dart';

abstract class ConnectionsRepo {
  /// Send a connection request
  Future<Either<Failure, SendConnectionResponce>> sendConnectionRequest(
      {required SendConnectionRequest connectionRequest});

  // Search connections
  Future<Either<Failure, SearchConnectionResponce>> searchConnections(
      {required SearchQuery searchQuery});

  // Recieved connection requests
  Future<Either<Failure, RecievedConnectionRequestsResponce>>
      recievedConnectionRequests();

  /// Search bizkit users
  Future<Either<Failure, BizcardUsersSearchResponce>> searchBizkitUsers(
      {required SearchQuery searchQuery});

  /// List of send connection requests
  Future<Either<Failure, SendConnectionRequetsResponce>>
      getAllSendConnectionRequests();

  // Get all My connections
  Future<Either<Failure, MyConnectionsResponce>> getMyconnections({
    required PaginationQuery paginationQuery
  });

  /// Cancel connection request
  Future<Either<Failure, SuccessResponseModel>> cancelConnectionRequest(
      {required CancelConnectionRequestModel cancelConnectionRequest});

  /// Folow back request
  Future<Either<Failure, SuccessResponseModel>> folowbackRequest(
      {required FollowBackRequestModel folowbackRequest});

  /// Unfollow a connection
  Future<Either<Failure, SuccessResponseModel>> unfollowRequest(
      {required UnfollowConnectionModel unfollowRequest});

  ///  Accept OR Reject connection request
  Future<Either<Failure, ConnectionRequestAcceptOrRejectResponce>>
      acceptOrRejectConnectionRequest(
          {required AcceptOrRejectConnectionRequest acceptOrReject});

  ///  Accept OR Reject connection request
  Future<Either<Failure, CardDetailModel>> getConnectionCard(
      {required String cardId});

  /// update connection detail
  Future<Either<Failure, SuccessResponseModel>> addOrUpdateConnectionDetails(
      {required ConnectionDetail connectionDetail});

  /// check wether a connection exist with the given user id
  Future<Either<Failure, List<ConnectionCheckResponseModel>>>
      checkConnecitonExists({required String userID});

  /// get all the shared cards of user
  Future<Either<Failure, SharedCardsResponseModel>> getMySharedCards();

  /// accept or reject shared card
  Future<Either<Failure, SuccessResponseModel>> sharedCardAcceptOrReject(
      {required String id, required bool accept});
}

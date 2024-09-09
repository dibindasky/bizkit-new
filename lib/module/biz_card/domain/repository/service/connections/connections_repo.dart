import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/search_query/search_query.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/bizcard_users_search_responce/bizcard_users_search_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/recieved_connection_requests_responce/recieved_connection_requests_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/search_connections_responce/search_connections_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_request/send_connection_request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_requets_responce/send_connection_requets_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_responce/send_connection_responce.dart';
import 'package:dartz/dartz.dart';

abstract class ConnectionsRepo {
  // Send a connection request
  Future<Either<Failure, SendConnectionResponce>> sendConnectionRequest(
      {required SendConnectionRequest connectionRequest});

  // Search connections
  Future<Either<Failure, SearchConnectionsResponce>> searchConnections(
      {required SearchQuery searchQuery});

  // Recieved connection requests
  Future<Either<Failure, RecievedConnectionRequestsResponce>>
      recievedConnectionRequests();

  // Search bizkit users
  Future<Either<Failure, BizcardUsersSearchResponce>> searchBizkitUsers(
      {required SearchQuery searchQuery});

  // list of send connection requests
  Future<Either<Failure, SendConnectionRequetsResponce>>
      getAllSendConnectionRequests();
}

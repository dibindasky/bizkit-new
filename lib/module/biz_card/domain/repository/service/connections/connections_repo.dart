import 'package:bizkit/core/model/failure/failure.dart';
import 'package:bizkit/core/model/search_query/search_query.dart';
import 'package:bizkit/core/model/success_response_model/success_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/recieved_connection_requests_responce/recieved_connection_requests_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/search_connections_responce/search_connections_responce.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_request/send_connection_request.dart';
import 'package:dartz/dartz.dart';

abstract class ConnectionsRepo {
  // Send a connection request
  Future<Either<Failure, SuccessResponseModel>> sendConnectionRequest(
      {required SendConnectionRequest connectionRequest});

  // Send a connection request
  Future<Either<Failure, SearchConnectionsResponce>> searchConnections(
      {required SearchQuery searchQuery});

  // Recieved connection requests

  Future<Either<Failure, RecievedConnectionRequestsResponce>>
      recievedConnectionRequests();
}

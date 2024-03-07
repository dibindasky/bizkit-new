import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/commen/success_response_model/success_response_model.dart';
import 'package:bizkit/domain/model/connections/add_connection_request_model/add_connection_request_model.dart';
import 'package:bizkit/domain/model/connections/add_connection_tag_model/add_connection_tag_model.dart';
import 'package:bizkit/domain/model/connections/block_bizkit_connection/block_bizkit_connection.dart';
import 'package:bizkit/domain/model/connections/create_connection_with_card_id_model/create_connection_with_card_id_model.dart';
import 'package:bizkit/domain/model/connections/get_bizkit_connections_response_model/get_bizkit_connections_response_model.dart';
import 'package:bizkit/domain/model/connections/get_request_list_responsemodel/get_request_list_responsemodel.dart';
import 'package:bizkit/domain/model/connections/get_serch_connection_response_model/get_serch_connection_response_model.dart';
import 'package:bizkit/domain/model/search_query/search_query.dart';
import 'package:dartz/dartz.dart';

abstract class ConnectionRequestRepo {
  Future<Either<Failure, GetBizkitConnectionsResponseModel>>
      getBizkitConnections({required PageQuery pageQuery});
  Future<Either<Failure, SuccessResponseModel>> blockBizkitConnecction(
      {required BlockBizkitConnection blockBizkitConnection,
      required int connectionId});
  Future<Either<Failure, SuccessResponseModel>> addTagToBizkitconnection(
      {required AddConnectionTagModel addConnectionTagModel,
      required int connectionId});
  Future<Either<Failure, SuccessResponseModel>> createBizkitConnection(
      {required CreateConnectionWithCardIdModel
          createConnectionWithCardIdModel});
  Future<Either<Failure, GetSerchConnectionResponseModel>> searchBizkitUser(
      {required SearchQuery searchQuery});
  Future<Either<Failure, SuccessResponseModel>> addConnectionRequest(
      {required AddConnectionRequestModel addConnectionRequestModel});
  Future<Either<Failure, GetRequestListResponsemodel>> getRequestList();
  Future<Either<Failure, SuccessResponseModel>> deleteConnectionRequest({required int id});
}

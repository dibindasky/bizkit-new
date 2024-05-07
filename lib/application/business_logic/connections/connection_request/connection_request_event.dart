part of 'connection_request_bloc.dart';

@freezed
class ConnectionRequestEvent with _$ConnectionRequestEvent {
  const factory ConnectionRequestEvent.getBizkitConnections(
      {required String query}) = GetBizkitConnections;
  const factory ConnectionRequestEvent.getBizkitConnectionsNextPage(
      {required String query}) = GetBizkitConnectionsNextPage;
  const factory ConnectionRequestEvent.blockBizkitConnections(
      {required BlockBizkitConnection blockBizkitConnection,
      required int connectionId}) = BlockBizkitConnections;
  const factory ConnectionRequestEvent.addConnection(
      {required CreateConnectionWithCardIdModel
          createConnectionWithCardIdModel}) = AddConnection;
  const factory ConnectionRequestEvent.removeConnectionRequest(
      {required ConnectionRequestIdModel connectionRequestIdModel,
      required int id}) = RemoveConnectionRequest;
  const factory ConnectionRequestEvent.addTagToBizkitconnection(
      {required AddConnectionTagModel addConnectionTagModel,
      required int connectionId}) = AddTagToBizkitconnection;
  const factory ConnectionRequestEvent.searchBizkitUsers(
      {required SearchQuery searchQuery}) = SearchBizkitUsers;
  const factory ConnectionRequestEvent.addConnectionRequests(
      {required AddConnectionRequestModel addConnectionRequestModel,
      required int index}) = AddConnectionRequests;
  const factory ConnectionRequestEvent.getRequestLoadList({required int id}) = GetRequestLoadList;
  const factory ConnectionRequestEvent.getRequestLists() = GetRequestLists;
  const factory ConnectionRequestEvent.deleteRequest({required int id}) =
      DeleteRequest;
  const factory ConnectionRequestEvent.getBlockeConnections(
      {required bool isLoad}) = GetBlockeConnections;
  const factory ConnectionRequestEvent.getBlockeConnectionsEvent() =
      GgetBlockeConnectionsEvent;
  const factory ConnectionRequestEvent.clear() = Clear;
}

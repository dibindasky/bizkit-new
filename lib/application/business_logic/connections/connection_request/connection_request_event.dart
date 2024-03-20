part of 'connection_request_bloc.dart';

@freezed
class ConnectionRequestEvent with _$ConnectionRequestEvent {
  const factory ConnectionRequestEvent.getBizkitConnections() =
      GetBizkitConnections;
  const factory ConnectionRequestEvent.getBizkitConnectionsNextPage() =
      GetBizkitConnectionsNextPage;
  const factory ConnectionRequestEvent.blockBizkitConnections(
      {required BlockBizkitConnection blockBizkitConnection,
      required int connectionId}) = BlockBizkitConnections;
  const factory ConnectionRequestEvent.addConnection(
      {required CreateConnectionWithCardIdModel
          createConnectionWithCardIdModel}) = AddConnection;
  const factory ConnectionRequestEvent.addTagToBizkitconnection(
      {required AddConnectionTagModel addConnectionTagModel,
      required int connectionId}) = AddTagToBizkitconnection;
  const factory ConnectionRequestEvent.searchBizkitUsers(
      {required SearchQuery searchQuery}) = SearchBizkitUsers;
  const factory ConnectionRequestEvent.addConnectionRequests(
      {required AddConnectionRequestModel addConnectionRequestModel,
      required int index}) = AddConnectionRequests;
  const factory ConnectionRequestEvent.getRequestLists() = GetRequestLists;
  const factory ConnectionRequestEvent.deleteRequest({required int id}) =
      DeleteRequest;
  const factory ConnectionRequestEvent.getBlockeConnections() =
      GetBlockeConnections;
  const factory ConnectionRequestEvent.getBlockeConnectionsEvent() =
      GgetBlockeConnectionsEvent;
}

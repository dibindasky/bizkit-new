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
}

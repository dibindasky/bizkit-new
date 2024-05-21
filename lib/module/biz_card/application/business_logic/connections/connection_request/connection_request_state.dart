part of 'connection_request_bloc.dart';

@freezed
class ConnectionRequestState with _$ConnectionRequestState {
  const factory ConnectionRequestState({
    required bool isLoading,
    required bool isPageLoading,
    required bool connected,
    required bool hasError,
    required bool blockedLoading,
    required bool connectionBlocked,
    required bool connectionUnblocked,
    required bool connectionRequestLoading,
    required bool connectionRequestRemoved,
    required List<int> requestLoadingIndex,
    required bool blockedConnectionsLoading,
    int? connectedId,
    String? message,
    List<BizkitConnection>? bizkitConnections,
    List<BizkitUser>? bizkitUsers,
    List<BizkitUser>? connectionRequestedList,
    List<RequestModel>? requestList,
    List<BlockedConnection>? blockedConnections,
  }) = _Initial;
  factory ConnectionRequestState.initial() => const ConnectionRequestState(
        connected: false,
        connectionBlocked: false,
        connectionUnblocked: false,
        connectionRequestLoading: false,
        blockedConnectionsLoading: false,
        blockedLoading: false,
        connectionRequestRemoved: false,
        requestLoadingIndex: [],
        hasError: false,
        isLoading: false,
        isPageLoading: false,
      );
}

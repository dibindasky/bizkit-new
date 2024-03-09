part of 'connection_request_bloc.dart';

@freezed
class ConnectionRequestState with _$ConnectionRequestState {
  const factory ConnectionRequestState({
    required bool isLoading,
    required bool isPageLoading,
    required bool connected,
    required bool hasError,
    required int requestLoadingIndex,
     int? connectedId,
    String? message,
    List<BizkitConnection>? bizkitConnections,
    List<BizkitUser>? bizkitUsers,
    List<RequestModel>? requestList,
  }) = _Initial;
  factory ConnectionRequestState.initial() => const ConnectionRequestState(
      connected: false,
      requestLoadingIndex: -1,
      hasError: false,
      isLoading: false,
      isPageLoading: false);
}

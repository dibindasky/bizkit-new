part of 'connection_request_bloc.dart';

@freezed
class ConnectionRequestState with _$ConnectionRequestState {
  const factory ConnectionRequestState({
    required bool isLoading,
    required bool isPageLoading,
    required bool hasError,
    String? message,
    List<BizkitConnection>? bizkitConnections,
  }) = _Initial;
  factory ConnectionRequestState.initial() => const ConnectionRequestState(
      hasError: false, isLoading: false, isPageLoading: false);
}

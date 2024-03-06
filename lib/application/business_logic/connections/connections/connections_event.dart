part of 'connections_bloc.dart';

@freezed
class ConnectionsEvent with _$ConnectionsEvent {
  const factory ConnectionsEvent.started() = _Started;
}

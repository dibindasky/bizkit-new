import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connections_event.dart';
part 'connections_state.dart';
part 'connections_bloc.freezed.dart';

class ConnectionsBloc extends Bloc<ConnectionsEvent, ConnectionsState> {
  ConnectionsBloc() : super(_Initial()) {
    on<ConnectionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

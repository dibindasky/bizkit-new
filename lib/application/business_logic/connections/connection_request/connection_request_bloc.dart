import 'dart:async';
import 'package:bizkit/domain/model/commen/page_query/page_query.dart';
import 'package:bizkit/domain/model/connections/add_connection_tag_model/add_connection_tag_model.dart';
import 'package:bizkit/domain/model/connections/block_bizkit_connection/block_bizkit_connection.dart';
import 'package:bizkit/domain/model/connections/create_connection_with_card_id_model/create_connection_with_card_id_model.dart';
import 'package:bizkit/domain/model/connections/get_bizkit_connections_response_model/bizkit_connection.dart';
import 'package:bizkit/domain/repository/service/connection_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'connection_request_event.dart';
part 'connection_request_state.dart';
part 'connection_request_bloc.freezed.dart';

@injectable
class ConnectionRequestBloc
    extends Bloc<ConnectionRequestEvent, ConnectionRequestState> {
  final ConnectionRepo _connectionRepo;
  int page = 1;

  ConnectionRequestBloc(this._connectionRepo)
      : super(ConnectionRequestState.initial()) {
    on<GetBizkitConnections>(getBizkitConnections);
    on<GetBizkitConnectionsNextPage>(getBizkitConnectionsNextPage);
    on<BlockBizkitConnections>(blockBizkitConnections);
    on<AddTagToBizkitconnection>(addTagToBizkitConnection);
    on<AddConnection>(addConnection);
  }

  FutureOr<void> addConnection(AddConnection event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final result = await _connectionRepo.createBizkitConnection(
        createConnectionWithCardIdModel: event.createConnectionWithCardIdModel);
    result.fold(
        (l) => emit(state.copyWith(
            isLoading: false, hasError: true, message: l.message)),
        (r) => emit(state.copyWith(isLoading: false, message: r.message)));
  }

  FutureOr<void> addTagToBizkitConnection(
      AddTagToBizkitconnection event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final result = await _connectionRepo.addTagToBizkitconnection(
        addConnectionTagModel: event.addConnectionTagModel,
        connectionId: event.connectionId);
    result.fold(
        (l) => emit(state.copyWith(
            isLoading: false, hasError: true, message: l.message)),
        (r) => emit(state.copyWith(isLoading: false, message: r.message)));
  }

  FutureOr<void> blockBizkitConnections(
      BlockBizkitConnections event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    final result = await _connectionRepo.blockBizkitConnecction(
        blockBizkitConnection: event.blockBizkitConnection,
        connectionId: event.connectionId);
    result.fold(
        (l) => emit(state.copyWith(
            isLoading: false, hasError: true, message: l.message)),
        (r) => emit(state.copyWith(isLoading: false, message: r.message)));
  }

  FutureOr<void> getBizkitConnections(GetBizkitConnections event, emit) async {
    emit(state.copyWith(isLoading: true, hasError: false, message: null));
    page = 1;
    final result = await _connectionRepo.getBizkitConnections(
        pageQuery: PageQuery(page: 1));
    result.fold(
        (l) => emit(state.copyWith(
            isLoading: false, hasError: true, message: l.message)),
        (r) => emit(
            state.copyWith(isLoading: false, bizkitConnections: r.results)));
  }

  FutureOr<void> getBizkitConnectionsNextPage(
      GetBizkitConnectionsNextPage event, emit) async {
    emit(state.copyWith(isPageLoading: true, hasError: false, message: null));

    final result = await _connectionRepo.getBizkitConnections(
        pageQuery: PageQuery(page: ++page));
    result.fold(
        (l) => emit(state.copyWith(isPageLoading: false, hasError: true)),
        (r) => emit(state.copyWith(isPageLoading: false, bizkitConnections: [
              ...state.bizkitConnections!,
              ...r.results ?? <BizkitConnection>[]
            ])));
  }
}

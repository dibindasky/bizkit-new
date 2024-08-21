import 'dart:async';
import 'dart:developer';
import 'package:bizkit/core/model/page_query/page_query.dart';
import 'package:bizkit/core/model/search_query/search_query.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/add_connection_request_model/add_connection_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/add_connection_tag_model/add_connection_tag_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/block_bizkit_connection/block_bizkit_connection.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/connection_request_id_model/connection_request_id_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/create_connection_with_card_id_model/create_connection_with_card_id_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/get_bizkit_connections_response_model/bizkit_connection.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/get_request_list_responsemodel/request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/get_serch_connection_response_model/bizkit_user.dart';
import 'package:bizkit/module/biz_card/domain/model/profile/blocked_connection_model/blocked_connection.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/connection_request_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'connection_request_event.dart';
part 'connection_request_state.dart';
part 'connection_request_bloc.freezed.dart';

@injectable
class ConnectionRequestBloc
    extends Bloc<ConnectionRequestEvent, ConnectionRequestState> {
  final ConnectionRequestRepo _connectionRepo;
  int page = 1, blockedConnetions = 1;
  final TextEditingController connectionController = TextEditingController();
  ConnectionRequestBloc(this._connectionRepo)
      : super(ConnectionRequestState.initial()) {
    on<GetBizkitConnections>(getBizkitConnections);
    on<GetBizkitConnectionsNextPage>(getBizkitConnectionsNextPage);
    on<BlockBizkitConnections>(blockBizkitConnections);
    on<AddTagToBizkitconnection>(addTagToBizkitConnection);
    on<AddConnection>(addConnection);
    on<SearchBizkitUsers>(searchBizkitUsers);
    on<AddConnectionRequests>(addConnectionRequests);
    on<GetRequestLists>(getRequestLists);
    on<GetConnectionRequestedList>(getConnectionRequestedList);
    on<DeleteRequest>(deleteRequest);
    on<GetBlockeConnections>(getBlockeConnections);
    on<GgetBlockeConnectionsEvent>(getBlockedConnectionsEvent);
    on<RemoveConnectionRequest>(removeConnectionRequest);
    on<GetRequestLoadList>(getRequestLoadList);
    on<RemoveConnectionRequestFromPendingScreen>(
        removeConnectionRequestFromPendingScreen);
    on<Clear>(clear);
  }

  FutureOr<void> removeConnectionRequestFromPendingScreen(
    RemoveConnectionRequestFromPendingScreen event,
    emit,
  ) async {
    emit(state.copyWith(
      requestLoadingIndex: [...state.requestLoadingIndex, event.id],
      blockedConnectionsLoading: true,
      connectionRequestRemoved: false,
      hasError: false,
      message: null,
    ));
    final data = await _connectionRepo.removeConnectionRequest(
        connectionRequestIdModel: event.connectionRequestIdModel);
    List<int> indexs = List.from(state.requestLoadingIndex);
    indexs.removeWhere((element) => element == event.id);
    List<BizkitUser> searchList =
        List.from(state.connectionRequestedList ?? []);
    // for (int i = 0; i < searchList.length; i++) {
    //   if (searchList[i].connectionId == event.id) {
    //     searchList[i] = searchList[i].copyWith(connectionId: null);
    //     break;
    //   }
    // }
    searchList.removeWhere((element) => element.id == event.id);
    data.fold(
        (l) => emit(state.copyWith(
            blockedConnectionsLoading: false,
            requestLoadingIndex: indexs,
            hasError: true,
            message: null)), (r) {
      emit(state.copyWith(
        requestLoadingIndex: indexs,
        bizkitUsers: searchList,
        blockedConnectionsLoading: false,
        connectionRequestRemoved: true,
        hasError: false,
      ));
      add(const ConnectionRequestEvent.getConnectionRequestedList());
    });
  }

  FutureOr<void> getConnectionRequestedList(
      GetConnectionRequestedList event, emit) async {
    emit(state.copyWith(connectionRequestLoading: false, hasError: false));
    final data = await _connectionRepo.getConnectionList();
    data.fold(
        (l) => emit(
            state.copyWith(connectionRequestLoading: false, hasError: true)),
        (r) {
      for (var element in r.results ?? []) {
        log('${element.name}', name: 'getConnectionList name');
      }
      emit(state.copyWith(
        connectionRequestLoading: false,
        hasError: false,
        connectionRequestedList: r.results,
      ));
    });
  }

  FutureOr<void> clear(Clear event, emit) async {
    return emit(ConnectionRequestState.initial());
  }

  FutureOr<void> getBlockedConnectionsEvent(
      GgetBlockeConnectionsEvent event, emit) async {
    emit(state.copyWith(
        blockedConnectionsLoading: true, hasError: false, message: null));

    final data = await _connectionRepo.getBlockeConnections(
        pageQuery: PageQuery(page: ++blockedConnetions));
    data.fold(
        (l) => emit(state.copyWith(
            blockedConnectionsLoading: false,
            hasError: true,
            message: null)), (r) {
      emit(
        state.copyWith(
          blockedConnectionsLoading: false,
          hasError: false,
          blockedConnections: [...state.blockedConnections!, ...r.results!],
        ),
      );
    });
  }

  FutureOr<void> getBlockeConnections(GetBlockeConnections event, emit) async {
    if (state.blockedConnections != null && !event.isLoad) return;
    blockedConnetions = 1;
    emit(state.copyWith(
      blockedConnectionsLoading: true,
      hasError: false,
      message: null,
    ));
    final data = await _connectionRepo.getBlockeConnections(
        pageQuery: PageQuery(page: blockedConnetions));
    data.fold(
      (l) => emit(
        state.copyWith(
          blockedConnectionsLoading: false,
          hasError: true,
        ),
      ),
      (r) => emit(state.copyWith(
        blockedConnectionsLoading: false,
        hasError: false,
        blockedConnections: [...r.results ?? []],
      )),
    );
  }

  FutureOr<void> addConnection(AddConnection event, emit) async {
    emit(state.copyWith(
        isLoading: true,
        hasError: false,
        message: null,
        connected: false,
        connectedId: null));
    final result = await _connectionRepo.createBizkitConnection(
        createConnectionWithCardIdModel: event.createConnectionWithCardIdModel);
    result.fold(
        (l) => emit(state.copyWith(
            isLoading: false, hasError: true, message: l.message)), (r) {
      emit(state.copyWith(
          isLoading: false,
          message: r.message,
          connected: true,
          connectedId: r.data as int));
      add(const ConnectionRequestEvent.getRequestLists());
      add(const ConnectionRequestEvent.getBizkitConnections(query: ''));
    });
  }

  FutureOr<void> addTagToBizkitConnection(
      AddTagToBizkitconnection event, emit) async {
    emit(state.copyWith(
        isLoading: true,
        hasError: false,
        message: null,
        connected: false,
        connectedId: null));
    final result = await _connectionRepo.addTagToBizkitconnection(
        addConnectionTagModel: event.addConnectionTagModel,
        connectionId: event.connectionId);
    result.fold(
        (l) => emit(state.copyWith(
            isLoading: false, hasError: true, message: l.message)), (r) {
      emit(state.copyWith(isLoading: false, message: r.message));
      add(const ConnectionRequestEvent.getBizkitConnections(query: ''));
    });
  }

  FutureOr<void> blockBizkitConnections(
      BlockBizkitConnections event, emit) async {
    emit(state.copyWith(
        isLoading: true, hasError: false, message: null, connected: false));
    final result = await _connectionRepo.blockBizkitConnecction(
      blockBizkitConnection: event.blockBizkitConnection,
      connectionId: event.connectionId,
    );
    result.fold(
        (l) => emit(state.copyWith(
            isLoading: false, hasError: true, message: l.message)), (r) {
      emit(state.copyWith(
        isLoading: false,
        message: event.blockBizkitConnection.isBlock!
            ? 'Blocked User Successfully'
            : 'Un Blocked User Successfully',
      ));
      add(const ConnectionRequestEvent.getBizkitConnections(query: ''));
      add(const ConnectionRequestEvent.getBlockeConnections(isLoad: true));
    });
  }

  FutureOr<void> getBizkitConnections(GetBizkitConnections event, emit) async {
    emit(state.copyWith(
        connectionRequestRemoved: false,
        isLoading: true,
        hasError: false,
        message: null,
        connected: false));
    page = 1;
    final result = await _connectionRepo.getBizkitConnections(
        pageQuery: PageQuery(page: 1, search: event.query));
    result.fold(
        (l) => emit(state.copyWith(
            isLoading: false, hasError: true, message: l.message)),
        (r) => emit(
            state.copyWith(isLoading: false, bizkitConnections: r.results)));
  }

  FutureOr<void> getBizkitConnectionsNextPage(
      GetBizkitConnectionsNextPage event, emit) async {
    emit(state.copyWith(
        isPageLoading: true, hasError: false, message: null, connected: false));

    final result = await _connectionRepo.getBizkitConnections(
        pageQuery: PageQuery(page: ++page, search: event.query));
    result.fold(
        (l) => emit(state.copyWith(isPageLoading: false, hasError: true)),
        (r) => emit(state.copyWith(isPageLoading: false, bizkitConnections: [
              ...state.bizkitConnections!,
              ...r.results ?? <BizkitConnection>[]
            ])));
  }

  FutureOr<void> searchBizkitUsers(SearchBizkitUsers event, emit) async {
    if (event.searchQuery.search!.length < 3) {
      return emit(state.copyWith(isLoading: false, bizkitUsers: null));
    }
    emit(state.copyWith(
        isLoading: true, hasError: false, message: null, connected: false));

    final result =
        await _connectionRepo.searchBizkitUser(searchQuery: event.searchQuery);
    result.fold((l) => emit(state.copyWith(isLoading: false, hasError: true)),
        (r) => emit(state.copyWith(isLoading: false, bizkitUsers: r.results)));
  }

  FutureOr<void> getRequestLoadList(GetRequestLoadList event, emit) async {
    emit(state.copyWith(hasError: false, message: null, connected: false));

    List<int> indexs = List.from(state.requestLoadingIndex);
    indexs.removeWhere((element) => element == event.id);
    final result = await _connectionRepo.searchBizkitUser(
        searchQuery: SearchQuery(search: connectionController.text.trim()));
    result.fold(
        (l) =>
            emit(state.copyWith(hasError: true, requestLoadingIndex: indexs)),
        (r) => emit(state.copyWith(
            bizkitUsers: r.results, requestLoadingIndex: indexs)));
  }

  FutureOr<void> removeConnectionRequest(
      RemoveConnectionRequest event, emit) async {
    emit(state.copyWith(
      requestLoadingIndex: [...state.requestLoadingIndex, event.id],
      blockedConnectionsLoading: true,
      connectionRequestRemoved: false,
      hasError: false,
      message: null,
    ));
    final data = await _connectionRepo.removeConnectionRequest(
        connectionRequestIdModel: event.connectionRequestIdModel);
    List<int> indexs = List.from(state.requestLoadingIndex);
    indexs.removeWhere((element) => element == event.id);
    List<BizkitUser> searchList = List.from(state.bizkitUsers ?? []);
    for (int i = 0; i < searchList.length; i++) {
      if (searchList[i].connectionId == event.id) {
        searchList[i] = searchList[i].copyWith(connectionId: null);
        break;
      }
    }
    data.fold(
        (l) => emit(state.copyWith(
            blockedConnectionsLoading: false,
            requestLoadingIndex: indexs,
            hasError: true,
            bizkitUsers: searchList,
            message: null)), (r) {
      emit(state.copyWith(
        // requestLoadingIndex: indexs,
        bizkitUsers: searchList,
        // isLoading: false,
        blockedConnectionsLoading: false,
        connectionRequestRemoved: true,
        hasError: false,
      ));
      add(ConnectionRequestEvent.getRequestLoadList(id: event.id));
    });
  }

  FutureOr<void> addConnectionRequests(
      AddConnectionRequests event, emit) async {
    emit(state.copyWith(
        requestLoadingIndex: [...state.requestLoadingIndex, event.index],
        hasError: false,
        message: null,
        connected: false));

    final result = await _connectionRepo.addConnectionRequest(
        addConnectionRequestModel: event.addConnectionRequestModel);
    List<int> indexs = List.from(state.requestLoadingIndex);
    indexs.removeWhere((element) => element == event.index);
    List<BizkitUser> searchList = List.from(state.bizkitUsers ?? []);
    for (int i = 0; i < searchList.length; i++) {
      if (searchList[i].connectionId == event.index) {
        searchList[i] = searchList[i].copyWith(connectionId: null);
        break;
      }
    }
    result.fold(
        (l) => emit(state.copyWith(
            bizkitUsers: searchList,
            requestLoadingIndex: indexs,
            hasError: true,
            message: l.message)), (r) {
      // SecureStorage.setHasConnection(hasCard: true);
      emit(state.copyWith(
          bizkitUsers: searchList, message: r.message, connected: true));
      add(ConnectionRequestEvent.getRequestLoadList(id: event.index));
    });
  }

  FutureOr<void> getRequestLists(GetRequestLists event, emit) async {
    emit(state.copyWith(
        isLoading: true, hasError: false, message: null, connected: false));

    final result = await _connectionRepo.getRequestList();
    result.fold(
        (l) => emit(state.copyWith(
            isLoading: false, hasError: true, message: l.message)),
        (r) => emit(state.copyWith(isLoading: false, requestList: r.results)));
  }

  FutureOr<void> deleteRequest(DeleteRequest event, emit) async {
    emit(state.copyWith(
        isLoading: true, hasError: false, message: null, connected: false));
    final result = await _connectionRepo.deleteConnectionRequest(id: event.id);
    result.fold(
        (l) => emit(state.copyWith(
            isLoading: false, hasError: true, message: l.message)), (r) {
      emit(state.copyWith(isLoading: false));
      add(const ConnectionRequestEvent.getRequestLists());
    });
  }
}

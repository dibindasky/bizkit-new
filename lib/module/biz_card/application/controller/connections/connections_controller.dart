import 'package:bizkit/core/model/search_query/search_query.dart';
import 'package:bizkit/module/biz_card/data/service/connections/connections_service.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/accept_or_reject_connection_request/accept_or_reject_connection_request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/bizcard_users_search_responce/result.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/cancel_connection_request_model/cancel_connection_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/follow_back_request_model/follow_back_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/connection.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/recieved_connection_requests_responce/request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_request/send_connection_request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_requets_responce/request.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/connections/connections_repo.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectionsController extends GetxController {
  final ConnectionsRepo connectionService = ConnectionsService();

  // Loadings
  RxBool sendConnectionRequestLoading = false.obs;
  RxBool searchConnectionsLoading = false.obs;
  RxBool recievedConnectionRequestLoading = false.obs;
  RxBool searchBizkitUsersLoading = false.obs;
  RxBool allSendConnectionRequestsLoading = false.obs;
  RxBool myConnectionsLoading = false.obs;
  RxBool cancelConnectionRequestLoading = false.obs;
  RxBool followbackRequestLoading = false.obs;

  RxList<MyConnection> connectionsSearchList = <MyConnection>[].obs;

  RxList<RecievedConnectionRequest> recievedConnectionRequests =
      <RecievedConnectionRequest>[].obs;

  RxList<BizCardUsers> bizkitUsers = <BizCardUsers>[].obs;

  RxList<SendConnectionRequet> allSendConnectionRequests =
      <SendConnectionRequet>[].obs;

  RxList<MyConnection> myConnections = <MyConnection>[].obs;

  RxString connectionRequestId = ''.obs;

  // Send connection request
  void sendConnectionRequest(
      {required SendConnectionRequest connectionRequest,
      required BuildContext context}) async {
    sendConnectionRequestLoading.value = true;

    final result = await connectionService.sendConnectionRequest(
        connectionRequest: connectionRequest);

    result.fold(
      (failure) {
        sendConnectionRequestLoading.value = false;
        showSnackbar(context, message: errorMessage, backgroundColor: kred);
      },
      (success) {
        sendConnectionRequestLoading.value = false;
        final index = bizkitUsers.indexWhere(
          (element) => element.userId == connectionRequest.toUser,
        );
        if (index != -1) {
          bizkitUsers[index] = bizkitUsers[index].copyWith(
              connectionRequestId: success.connectionRequestId,
              connectionExist: true);
        }
      },
    );
  }

  // Search connections
  void searchConnections({required SearchQuery searchQuery}) async {
    searchConnectionsLoading.value = true;
    final result =
        await connectionService.searchConnections(searchQuery: searchQuery);

    result.fold(
      (failure) {
        searchConnectionsLoading.value = false;
      },
      (success) {
        connectionsSearchList.assignAll(success.connections ?? []);
        searchConnectionsLoading.value = false;
      },
    );
  }

  // Recieved connection requests
  void fetchRecievedConnectionRequests() async {
    recievedConnectionRequestLoading.value = true;
    final result = await connectionService.recievedConnectionRequests();

    result.fold(
      (failure) {
        recievedConnectionRequestLoading.value = false;
      },
      (success) {
        recievedConnectionRequestLoading.value = false;
        recievedConnectionRequests.assignAll(success.requests ?? []);
      },
    );
  }

  // Search bizkit users
  void searchBizkitUsers({required SearchQuery searchQuery}) async {
    searchBizkitUsersLoading.value = true;
    final result =
        await connectionService.searchBizkitUsers(searchQuery: searchQuery);

    result.fold(
      (failure) {
        searchBizkitUsersLoading.value = false;
      },
      (success) {
        bizkitUsers.assignAll(success.results ?? []);
        searchBizkitUsersLoading.value = false;
      },
    );
  }

  // Get all send connection requests
  void fetchAllSendConnectionRequests() async {
    allSendConnectionRequestsLoading.value = true;
    final result = await connectionService.getAllSendConnectionRequests();
    result.fold(
      (failure) {
        allSendConnectionRequestsLoading.value = false;
      },
      (success) {
        allSendConnectionRequests.assignAll(success.requests ?? []);
        allSendConnectionRequestsLoading.value = false;
      },
    );
  }

  // Get my all connections
  void fetchMyConnections() async {
    if (myConnections.isNotEmpty) return;
    myConnectionsLoading.value = true;
    final result = await connectionService.getMyconnections();
    result.fold(
      (failure) {
        myConnectionsLoading.value = false;
      },
      (success) {
        myConnections.assignAll(success.connections ?? []);
        myConnectionsLoading.value = false;
      },
    );
  }

  // Cancel connection request
  void cancelConnectionRequest(
      {required CancelConnectionRequestModel cancelConnectionRequest,
      required bool fromSendrequests}) async {
    cancelConnectionRequestLoading.value = true;
    final result = await connectionService.cancelConnectionRequest(
        cancelConnectionRequest: cancelConnectionRequest);

    result.fold(
      (failure) {
        cancelConnectionRequestLoading.value = false;
      },
      (success) {
        cancelConnectionRequestLoading.value = false;
        if (fromSendrequests) {
          fetchAllSendConnectionRequests();
        }
      },
    );
  }

  // Follow back request
  void followbackRequest(
      {required FollowBackRequestModel folowbackRequest}) async {
    followbackRequestLoading.value = true;
    final result = await connectionService.folowbackRequest(
        folowbackRequest: folowbackRequest);

    result.fold(
      (failure) {
        followbackRequestLoading.value = false;
      },
      (success) {
        followbackRequestLoading.value = false;
      },
    );
  }

  // Connection request accept Or reject
  void connectionRequestAcceptOrReject(
      {required AcceptOrRejectConnectionRequest acceptOrReject}) async {
    recievedConnectionRequestLoading.value = true;
    final result = await connectionService.acceptOrRejectConnectionRequest(
        acceptOrReject: acceptOrReject);

    result.fold(
      (failure) {
        recievedConnectionRequestLoading.value = false;
      },
      (success) {
        recievedConnectionRequestLoading.value = false;
        fetchMyConnections();
      },
    );
  }
}

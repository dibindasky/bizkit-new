import 'package:bizkit/core/model/search_query/search_query.dart';
import 'package:bizkit/module/biz_card/data/service/connections/connections_service.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/recieved_connection_requests_responce/request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/search_connections_responce/result.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_request/send_connection_request.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/connections/connections_repo.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectionsController extends GetxController {
  final ConnectionsRepo connectionService = ConnectionsService();

  RxBool sendConnectionRequestLoading = false.obs;
  RxBool searchConnectionsLoading = false.obs;
  RxBool recievedConnectionRequestLoading = false.obs;

  RxList<ConnectionsList> connectionsSearchList = <ConnectionsList>[].obs;
  RxList<RecievedConnectionRequest> recievedConnectionRequests =
      <RecievedConnectionRequest>[].obs;

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
        showSnackbar(context, message: errorMessage);
      },
      (success) {
        sendConnectionRequestLoading.value = false;
        showSnackbar(context, message: 'Connection request sent successfully');
      },
    );
  }

  // Search connections
  void searchBizkitUsers({required SearchQuery searchQuery}) async {
    searchConnectionsLoading.value = true;
    final result =
        await connectionService.searchConnections(searchQuery: searchQuery);

    result.fold(
      (failure) {
        searchConnectionsLoading.value = false;
      },
      (success) {
        searchConnectionsLoading.value = false;
        connectionsSearchList.assignAll(success.results ?? []);
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
}

import 'package:bizkit/core/model/search_query/search_query.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/data/service/connections/connections_service.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/accept_or_reject_connection_request/accept_or_reject_connection_request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/bizcard_users_search_responce/result.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/cancel_connection_request_model/cancel_connection_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/connection_detail/connection_detail.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/follow_back_request_model/follow_back_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/connection.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/recieved_connection_requests_responce/request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/search_connection_responce/result.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_request/send_connection_request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_requets_responce/request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/unfollow_connection_model/unfollow_connection_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/connections/connections_repo.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/debouncer/debouncer.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ConnectionsController extends GetxController {
  final ConnectionsRepo connectionService = ConnectionsService();
  final Debouncer debouncer = Debouncer(milliseconds: 300);
  // Loadings
  RxBool sendConnectionRequestLoading = false.obs;
  RxBool searchConnectionsLoading = false.obs;
  RxBool recievedConnectionRequestLoading = false.obs;
  RxBool searchBizkitUsersLoading = false.obs;
  RxBool allSendConnectionRequestsLoading = false.obs;
  RxBool myConnectionsLoading = false.obs;
  RxBool cancelConnectionRequestLoading = false.obs;
  RxBool followbackRequestLoading = false.obs;
  RxBool cardLoading = false.obs;

  /// Loading responsible for connection detail api loading
  RxBool connectionDetailLoading = false.obs;

  /// selfi images from connection details
  RxList<String> connectionSelfieIamges = <String>[].obs;

  RxList<SearchConnection> connectionsSearchList = <SearchConnection>[].obs;

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
    final index = bizkitUsers.indexWhere(
      (element) => element.userId == connectionRequest.toUser,
    );
    if (index != -1) {
      bizkitUsers[index] = bizkitUsers[index].copyWith(checkLoading: true);
    }
    final result = await connectionService.sendConnectionRequest(
        connectionRequest: connectionRequest);

    result.fold(
      (failure) {
        if (index != -1) {
          bizkitUsers[index] = bizkitUsers[index].copyWith(checkLoading: false);
        }
        showSnackbar(context, message: errorMessage, backgroundColor: kred);
      },
      (success) {
        if (index != -1) {
          bizkitUsers[index] = bizkitUsers[index].copyWith(
            connectionRequestId: success.connectionRequestId,
            checkLoading: false,
          );
        }
      },
    );
  }

  // Search connections
  void searchConnections({required SearchQuery searchQuery}) {
    debouncer.run(
      () async {
        searchConnectionsLoading.value = true;
        final result =
            await connectionService.searchConnections(searchQuery: searchQuery);

        result.fold(
          (failure) {
            searchConnectionsLoading.value = false;
          },
          (success) {
            connectionsSearchList.assignAll(success.results ?? []);
            searchConnectionsLoading.value = false;
          },
        );
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
  void searchBizkitUsers({required SearchQuery searchQuery}) {
    debouncer.run(
      () async {
        searchBizkitUsersLoading.value = true;
        final result =
            await connectionService.searchBizkitUsers(searchQuery: searchQuery);

        result.fold(
          (failure) {
            searchBizkitUsersLoading.value = false;
          },
          (success) {
            final filteredUsers = (success.results ?? [])
                .where((user) => user.connectionExist != true)
                .toList();

            bizkitUsers.assignAll(filteredUsers);

            searchBizkitUsersLoading.value = false;
          },
        );
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
  void fetchMyConnections(bool isLoad) async {
    if (myConnections.isNotEmpty && !isLoad) return;
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

    final index = bizkitUsers.indexWhere(
      (element) => element.userId == cancelConnectionRequest.userId,
    );
    if (index != -1) {
      bizkitUsers[index] = bizkitUsers[index].copyWith(checkLoading: true);
    }
    if (fromSendrequests) {
      final index = allSendConnectionRequests.indexWhere(
        (element) => element.toUserId == cancelConnectionRequest.userId,
      );

      if (index != -1) {
        allSendConnectionRequests[index] =
            allSendConnectionRequests[index].copyWith(checkLoading: true);
      }
    }
    final result = await connectionService.cancelConnectionRequest(
        cancelConnectionRequest: cancelConnectionRequest);

    result.fold(
      (failure) {
        final index = bizkitUsers.indexWhere(
          (element) => element.userId == cancelConnectionRequest.userId,
        );
        if (index != -1) {
          bizkitUsers[index] = bizkitUsers[index].copyWith(
            checkLoading: false,
          );
        }
        if (fromSendrequests) {
          final index = allSendConnectionRequests.indexWhere(
            (element) => element.toUserId == cancelConnectionRequest.userId,
          );

          if (index != -1) {
            allSendConnectionRequests[index] =
                allSendConnectionRequests[index].copyWith(checkLoading: false);
          }
        }
        cancelConnectionRequestLoading.value = false;
      },
      (success) {
        cancelConnectionRequestLoading.value = false;
        final index = bizkitUsers.indexWhere(
          (element) => element.userId == cancelConnectionRequest.userId,
        );
        if (index != -1) {
          bizkitUsers[index] = BizCardUsers(
              connectionRequestId: null,
              checkLoading: false,
              bizcardId: bizkitUsers[index].bizcardId,
              companyName: bizkitUsers[index].companyName,
              connectionExist: bizkitUsers[index].connectionExist,
              designation: bizkitUsers[index].designation,
              email: bizkitUsers[index].email,
              phoneNumber: bizkitUsers[index].phoneNumber,
              profilePicture: bizkitUsers[index].profilePicture,
              userId: bizkitUsers[index].userId,
              username: bizkitUsers[index].username);
        }
        if (fromSendrequests) {
          final index = allSendConnectionRequests.indexWhere(
            (element) => element.toUserId == cancelConnectionRequest.userId,
          );

          if (index != -1) {
            allSendConnectionRequests[index] =
                allSendConnectionRequests[index].copyWith(
              checkLoading: false,
            );
            allSendConnectionRequests.removeAt(index);
          }
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

  // Unfollow a connection
  void unfollowRequest(
      {required UnfollowConnectionModel unfollowRequest,
      required BuildContext context}) async {
    myConnectionsLoading.value = true;
    final result = await connectionService.unfollowRequest(
        unfollowRequest: unfollowRequest);
    result.fold(
      (failure) {
        myConnectionsLoading.value = false;
        showSnackbar(context, message: errorMessage, backgroundColor: kred);
      },
      (success) {
        myConnectionsLoading.value = false;

        showSnackbar(context,
            message: 'Unfollow successfully', backgroundColor: neonShade);
        fetchMyConnections(true);
        searchConnections(searchQuery: SearchQuery(search: ''));
      },
    );
  }

  // Connection request accept Or reject
  Future<bool> connectionRequestAcceptOrReject(
      {required AcceptOrRejectConnectionRequest acceptOrReject,
      required BuildContext context}) async {
    recievedConnectionRequestLoading.value = true;
    bool followBackPossible = false;
    final result = await connectionService.acceptOrRejectConnectionRequest(
        acceptOrReject: acceptOrReject);

    result.fold(
      (failure) {
        recievedConnectionRequestLoading.value = false;
      },
      (success) {
        recievedConnectionRequestLoading.value = false;
        fetchMyConnections(true);
        fetchRecievedConnectionRequests();
        searchConnections(searchQuery: SearchQuery(search: ''));
        followBackPossible = success.followBackPossible ?? false;
      },
    );
    return followBackPossible;
  }

  void getConnectionCardDetail({required String cardId}) async {
    cardLoading.value = true;
    final data = await connectionService.getConnectionCard(cardId: cardId);
    data.fold(
      (l) => null,
      (r) {
        final cardController = Get.find<CardController>();
        cardController.bizcardDetail.value = r;
        cardController.personalDetails.value = r.personalDetails;
        cardController.businessDetails.value = r.businessDetails;
      },
    );
    cardLoading.value = false;
  }

  /// patch for connection detail filling
  void addOrUpdateConnectionDetails(BuildContext context,
      {required ConnectionDetail connectionDtail}) async {
    connectionDetailLoading.value = true;
    final result = await connectionService.addOrUpdateConnectionDetails(
        connectionDetail: connectionDtail);
    result.fold((l) {
      connectionDetailLoading.value = false;
      showSnackbar(context, message: l.message ?? errorMessage);
    }, (r) {
      GoRouter.of(context).pop();
      connectionSelfieIamges.value = [];
      connectionDetailLoading.value = false;
    });
  }

  /// add selfie image to list
  void addSelfieimageToList({required bool cameraOrGallery}) async {
    final image = await ImagePickerClass.getImage(
        camera: cameraOrGallery, cameraDeviceFront: true);
    if (image == null) return;
    connectionSelfieIamges.insert(0, image.base64 ?? '');
  }

  /// remove selfi image form list
  void removeSelfieImage(int index) {
    connectionSelfieIamges.removeAt(index);
  }

  /// reset images and loader for connection detail filling
  void restConnectionDetails() {
    connectionSelfieIamges.value = [];
    connectionDetailLoading.value = false;
  }
}

import 'dart:developer';
import 'package:bizkit/core/model/pagination_query/pagination_query.dart';
import 'package:bizkit/core/model/search_query/search_query.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/data/service/connections/connections_service.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/accept_or_reject_connection_request/accept_or_reject_connection_request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/bizcard_users_search_responce/result.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/cancel_connection_request_model/cancel_connection_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/connection_check/connection_check_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/connection_detail/connection_detail.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/follow_back_request_model/follow_back_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/connection.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/recieved_connection_requests_responce/request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/search_connection_responce/result.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_request/send_connection_request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_requets_responce/request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/shared_cards/shared_card_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/unfollow_connection_model/unfollow_connection_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/connections/connections_repo.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/debouncer/debouncer.dart';
import 'package:bizkit/utils/widgets/event_button.dart';
import 'package:bizkit/utils/image_picker/image_picker.dart';
import 'package:bizkit/utils/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ConnectionsController extends GetxController {
  final ScrollController userSearchScrollController = ScrollController();
  final ScrollController myConnectionScrollController = ScrollController();
  final ScrollController fetchMyConnectionScrollController = ScrollController();

  final ConnectionsRepo connectionService = ConnectionsService();
  final Debouncer debouncer = Debouncer(milliseconds: 300);
  // Loadings
  RxBool sendConnectionRequestLoading = false.obs;

  //my connection loading and pagination variables
  RxBool myConnectionLoadMore = false.obs;
  RxBool searchConnectionsLoading = false.obs;

  RxBool recievedConnectionRequestLoading = false.obs;

  RxBool searchBizkitUsersLoading = false.obs;
  RxBool usersLoadMore = false.obs;

  RxBool allSendConnectionRequestsLoading = false.obs;

  //fechMyconnection pagination
  RxBool fetchMyconnectionLoadMore = false.obs;
  RxBool myConnectionsLoading = false.obs;

  RxBool cancelConnectionRequestLoading = false.obs;
  RxBool followbackRequestLoading = false.obs;
  RxBool cardLoading = false.obs;

  final TextEditingController searchBizkitUsersController =
      TextEditingController();

  final TextEditingController myConnectionsearchController =
      TextEditingController();

  int userSearchPageNumber = 1, pageSize = 15;
  int myConnectionPageNumber = 1;
  int fetchMyConnectionPageNumber = 1;

  /// loading for shared card
  RxBool sharedCardLoading = false.obs;
  RxString sharedCardLoadingId = ''.obs;

  /// for loading in list tile of contact list
  RxString loadingContact = ''.obs;

  /// lading for pop up while requseting form contact list
  RxBool connecionRequestingLoadingFromContactPopup = false.obs;

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

  /// shared card list
  RxList<SharedCardModel> sharedCards = <SharedCardModel>[].obs;

  @override
  void onInit() {
    userSearchScrollController.addListener(userSearchScrollListner);
    myConnectionScrollController.addListener(myConnectionScrollListner);
    fetchMyConnectionScrollController
        .addListener(fetchMyCollectionScrollListner);
    super.onInit();
  }

  void userSearchScrollListner() {
    if (userSearchScrollController.position.pixels ==
        userSearchScrollController.position.maxScrollExtent) {
      searchBizkitUsersLoadMore();
    }
  }

  void myConnectionScrollListner() {
    if (myConnectionScrollController.position.pixels ==
        myConnectionScrollController.position.maxScrollExtent) {
      searchConnectionsLoadMore();
    }
  }

  void fetchMyCollectionScrollListner() {
    if (fetchMyConnectionScrollController.position.pixels ==
        fetchMyConnectionScrollController.position.maxScrollExtent) {
      fetchMyConnectionsLoadMore();
    }
  }

  // Send connection request
  void sendConnectionRequest(
      {required SendConnectionRequest connectionRequest,
      required BuildContext context}) async {
    connecionRequestingLoadingFromContactPopup.value = true;
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
        final index = bizkitUsers.indexWhere(
          (element) => element.userId == connectionRequest.toUser,
        );
        if (index != -1) {
          bizkitUsers[index] = bizkitUsers[index].copyWith(checkLoading: false);
        }
        showSnackbar(context, message: errorMessage, backgroundColor: kred);
      },
      (success) {
        final index = bizkitUsers.indexWhere(
          (element) => element.userId == connectionRequest.toUser,
        );
        if (index != -1) {
          bizkitUsers[index] = bizkitUsers[index].copyWith(
            connectionRequestId: success.connectionRequestId,
            checkLoading: false,
          );
        }
      },
    );
    connecionRequestingLoadingFromContactPopup.value = false;
  }

  // Search My connections
  void searchConnections() {
    debouncer.run(
      () async {
        searchConnectionsLoading.value = true;
        myConnectionPageNumber = 1;
        connectionsSearchList.value = [];
        final result = await connectionService.searchConnections(
            searchQuery: SearchQuery(
                page: myConnectionPageNumber,
                pageSize: pageSize,
                search: myConnectionsearchController.text));

        result.fold(
          (failure) {
            searchConnectionsLoading.value = false;
          },
          (success) {
            connectionsSearchList.assignAll(success.data ?? []);
            searchConnectionsLoading.value = false;
          },
        );
      },
    );
  }

  // Search My connections for pagination
  void searchConnectionsLoadMore() {
    debouncer.run(
      () async {
        if (myConnectionLoadMore.value == true) {
          return;
        }
        myConnectionLoadMore.value = true;

        final result = await connectionService.searchConnections(
            searchQuery: SearchQuery(
                page: ++myConnectionPageNumber,
                pageSize: pageSize,
                search: myConnectionsearchController.text));

        result.fold(
          (failure) {
            myConnectionLoadMore.value = false;
          },
          (success) {
            connectionsSearchList.addAll(success.data ??[]);
            myConnectionLoadMore.value = false;
          },
        );
      },
    );
  }

  //search all bizkit users
  void searchBizkitUsers() {
    debouncer.run(
      () async {
        searchBizkitUsersLoading.value = true;
        userSearchPageNumber = 1;
        bizkitUsers.value = [];
        final result = await connectionService.searchBizkitUsers(
            searchQuery: SearchQuery(
                page: userSearchPageNumber,
                pageSize: pageSize,
                search: searchBizkitUsersController.text));

        result.fold(
          (failure) {
            searchBizkitUsersLoading.value = false;
          },
          (success) {
            final filteredUsers = (success.data ?? [])
                .where((user) => user.connectionExist != true)
                .toList();

            bizkitUsers.assignAll(filteredUsers);

            searchBizkitUsersLoading.value = false;
          },
        );
      },
    );
  }

  // Search bizkit users for pagination
  void searchBizkitUsersLoadMore() {
    debouncer.run(
      () async {
        if (usersLoadMore.value == true) {
          return;
        }
        usersLoadMore.value = true;

        final result = await connectionService.searchBizkitUsers(
          searchQuery: SearchQuery(
            page: ++userSearchPageNumber,
            pageSize: pageSize,
            search: searchBizkitUsersController.text,
          ),
        );

        result.fold(
          (failure) {
            usersLoadMore.value = false;
          },
          (success) {
            final filteredUsers = (success.data ?? [])
                .where((user) => user.connectionExist != true)
                .toList();

            bizkitUsers.addAll(filteredUsers);

            usersLoadMore.value = false;
          },
        );
        usersLoadMore.value = false;
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
    myConnections.value = [];
    fetchMyConnectionPageNumber = 1;

    myConnectionsLoading.value = true;
    final result = await connectionService.getMyconnections(
        paginationQuery: PaginationQuery(
            page: fetchMyConnectionPageNumber, pageSize: pageSize));
    result.fold(
      (failure) {
        myConnectionsLoading.value = false;
      },
      (success) {
        myConnections.assignAll(success.data ?? []);
        myConnectionsLoading.value = false;
        
      },
    );
  }

  void fetchMyConnectionsLoadMore() async {
    
    if (fetchMyconnectionLoadMore.value) {
      return;
    }
    fetchMyconnectionLoadMore.value = true;
    final result = await connectionService.getMyconnections(
        paginationQuery: PaginationQuery(
            page: ++fetchMyConnectionPageNumber, pageSize: pageSize));
    result.fold(
      (failure) {
        fetchMyconnectionLoadMore.value = false;
      },
      (success) {
        myConnections.addAll(success.data ?? []);
        fetchMyconnectionLoadMore.value = false;
      },
    );
    fetchMyconnectionLoadMore.value = false;
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
        searchConnections();
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
        searchConnections();
        followBackPossible = success.followBackPossible ?? false;
      },
    );
    return followBackPossible;
  }

  /// get card detail connection
  void getConnectionCardDetail({required String cardId}) async {
    log('Bizcard ID -->> $cardId');
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
      Get.find<CardController>().bizcardDetail.value.selfie =
          connectionSelfieIamges;
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
  void restConnectionDetails(List<String> imgs) {
    connectionSelfieIamges.value = imgs;
    connectionDetailLoading.value = false;
  }

  /// check connection exists if exist then call for card
  void checkConnecitonExistsAndCallCardDetail(BuildContext context,
      {required String userID}) async {
    loadingContact.value = userID;
    final result =
        await connectionService.checkConnecitonExists(userID: userID);
    result.fold((l) => loadingContact.value = '', (r) {
      List<ConnectionCheckResponseModel> connected = [], requested = [];
      if (r.isNotEmpty) {
        for (var e in r) {
          if (e.connectionId != null && e.status == 'accepted') {
            connected.add(e);
          } else if (e.connectionId != null && e.status == null) {
            requested.add(e);
          }
        }
        loadingContact.value = '';
        if (connected.isNotEmpty) {
          GoRouter.of(context).pushNamed(Routes.cardView,
              pathParameters: {'cardId': connected.first.toCard ?? ''});
          getConnectionCardDetail(cardId: connected.first.toCard ?? '');
        } else if (requested.isNotEmpty) {
          Get.dialog(Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: kBorderRadius10,
                border: Border.all(color: kneonShade)),
            child:
                const Text('Your request is still not accepeted by the user'),
          ));
        }
      } else {
        loadingContact.value = '';
        Get.dialog(Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: kBorderRadius10,
              border: Border.all(color: kneonShade)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Request Connection'),
              kHeight10,
              EventButton(
                  text: 'Request',
                  onTap: () {
                    sendConnectionRequest(
                        connectionRequest:
                            SendConnectionRequest(toUser: userID),
                        context: context);
                  })
            ],
          ),
        ));
      }
      loadingContact.value = '';
    });
  }

  /// get shared card list
  void getSharedCardList() async {
    sharedCardLoading.value = true;
    final result = await connectionService.getMySharedCards();
    result.fold((l) {
      sharedCards.value = [];
      sharedCardLoading.value = false;
    }, (r) {
      sharedCards.value = r.results ?? [];
      sharedCardLoading.value = false;
    });
  }

  /// get shared card list
  void acceptOrRejectSharedCard(BuildContext context,
      {required String id, required bool accept}) async {
    sharedCardLoadingId.value = id;
    final result = await connectionService.sharedCardAcceptOrReject(
        id: id, accept: accept);
    result.fold((l) {
      sharedCardLoadingId.value = '';
      showSnackbar(context,
          message: 'Failed to ${accept ? 'accept' : 'reject'} request',
          backgroundColor: kred);
    }, (r) {
      sharedCards.removeWhere((e) => e.id == id);
      sharedCardLoadingId.value = '';
      showSnackbar(context,
          message: 'Succesfully ${accept ? 'accepted' : 'rejected'} request');
    });
  }
}

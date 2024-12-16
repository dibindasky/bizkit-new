import 'dart:developer';
import 'package:bizkit/core/model/pagination_query/pagination_query.dart';
import 'package:bizkit/core/model/search_query/search_query.dart';
import 'package:bizkit/core/routes/routes.dart';
import 'package:bizkit/module/biz_card/application/controller/card/create_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/contacts/contacts_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/received_card/received_card_controller.dart';
import 'package:bizkit/module/biz_card/data/service/connections/connections_service.dart';
import 'package:bizkit/module/biz_card/data/sqflite/my_connection/my_connection_local_service.dart';
import 'package:bizkit/module/biz_card/domain/model/cards/card_detail_model/card_detail_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/accept_or_reject_connection_request/accept_or_reject_connection_request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/bizcard_users_search_responce/result.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/cancel_connection_request_model/cancel_connection_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/connection_check/connection_check_response_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/connection_detail/connection_detail.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/follow_back_request_model/follow_back_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/my_connections_responce/connection.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/recieved_connection_requests_responce/request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_request/send_connection_request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_requets_responce/request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/shared_cards/shared_card_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/unfollow_connection_model/unfollow_connection_model.dart';
import 'package:bizkit/module/biz_card/domain/repository/service/connections/connections_repo.dart';
import 'package:bizkit/module/biz_card/domain/repository/sqflite/my_connection_repo.dart';
import 'package:bizkit/service/secure_storage/flutter_secure_storage.dart';
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

  final TextEditingController searchController = TextEditingController();

  // final ConnectionsRepo connectionService = getIt<ConnectionsRepo>();
  final ConnectionsRepo connectionService = ConnectionsService();
  final MyConnectionLocalRepo myConnectionLocalService =
      MyConnectionLocalService();
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

  int userSearchPageNumber = 1, pageSize = 10;
  int myConnectionPageNumber = 1;
  int fetchMyConnectionPageNumber = 1;

  List<RecievedConnectionRequest> recievedConnectionRequests = [];

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

  RxList<MyConnection> connectionsSearchList = <MyConnection>[].obs;

  RxList<RecievedConnectionRequest> filterdConnectionRequest =
      <RecievedConnectionRequest>[].obs;

  RxList<BizCardUsers> bizkitUsers = <BizCardUsers>[].obs;

  RxList<SendConnectionRequet> allSendConnectionRequests =
      <SendConnectionRequet>[].obs;

  RxList<MyConnection> myConnections = <MyConnection>[].obs;

  RxString connectionRequestId = ''.obs;

  List<SharedCardModel> sharedCards = [];

  /// shared card list
  RxList<SharedCardModel> filteredSharedCards = <SharedCardModel>[].obs;

  @override
  void onInit() {
    searchConnections();
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

  ///this search for every search actions in the bizcard and connection screen.
  void searchBizcardAndConnection(int index, String query) {
    final contactsController = Get.find<ContactsController>();
    final receivedCardController = Get.find<ReceivedCardController>();
    debouncer.run(() {
      switch (index) {
        case 0:
          searchConnections(refresh: true);
          break;
        case 1:
          contactsController.searchContact(query);
          break;
        case 2:
          searchReceivedConnectionRequest();
          break;
        case 3:
          receivedCardController.searchQueryforVisitingCards(query);
          break;
        case 4:
          searchSharedCardList();
          break;
        default:
      }
    });
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
  void searchConnections({bool refresh = false}) async {
    if (connectionsSearchList.isNotEmpty && !refresh) {
      return;
    }
    // print('searchConnections ->========1');
    searchConnectionsLoading.value = true;
    // myConnectionsLoading.value = false;
    myConnectionPageNumber = 1;
    connectionsSearchList.value = [];

    if (searchController.text.isEmpty) {
      await getConnectionDatasFromLocal(search: true);
      // log("sear connection datas ---- ${connectionsSearchList.toJson()}");
      // searchConnectionsLoading.value = false;
    }
    if (connectionsSearchList.isNotEmpty) {
      searchConnectionsLoading.value = false;
    }
    final result = await connectionService.searchConnections(
        searchQuery: SearchQuery(
            page: myConnectionPageNumber,
            pageSize: pageSize,
            search: searchController.text));

    result.fold(
      (failure) {
        // print('searchConnections ->========fail');
        searchConnectionsLoading.value = false;
      },
      (success) async {
        // print('searchConnections ->========success ${success.data?.length}');
        if (connectionsSearchList.isEmpty) {
          // connectionsSearchList.assignAll(success.data ?? []);
          for (var eachMyConnection in connectionsSearchList) {
            await myConnectionLocalService
                .addMyConnecitonToLocalStorageIfNotPresentInStorage(
                    myconnection: eachMyConnection);
            if (eachMyConnection.cards?.isNotEmpty ?? false) {
              connectionsSearchList.add(eachMyConnection);
            }
          }
        } else {
          for (var datas in success.data ?? <MyConnection>[]) {
            final index = connectionsSearchList
                .indexWhere((value) => value.toUser == datas.toUser);
            if (index == -1) {
              if (datas.cards?.isNotEmpty ?? false) {
                connectionsSearchList.insert(0, datas);
              }

              myConnectionLocalService
                  .addMyConnecitonToLocalStorageIfNotPresentInStorage(
                      myconnection: datas);
            } else {
              if (!connectionsSearchList[index].equals(datas)) {
                int localId = connectionsSearchList[index].localId!;
                if (datas.cards?.isNotEmpty ?? false) {
                  connectionsSearchList[index] = datas;
                } else {
                  connectionsSearchList.removeAt(index);
                }
                myConnectionLocalService
                    .addMyConnecitonToLocalStorageIfNotPresentInStorage(
                        myconnection: datas.copyWith(localId: localId));
              }
            }
          }
        }
        // TODO: connections need to check local conditions above
        connectionsSearchList.assignAll(success.data ?? []);
        // if (myConnections.isEmpty) {
        //   myConnections.assignAll(success.data ?? []);
        //   myConnectionsLoading.value = false;
        // }
        searchConnectionsLoading.value = false;
      },
    );
  }

  // Search My connections for pagination
  void searchConnectionsLoadMore() {
    debouncer.run(
      () async {
        // print('called my connection load more ==>1');
        if (myConnectionLoadMore.value == true) {
          // print('called my connection load more ==>2');
          return;
        }
        myConnectionLoadMore.value = true;
        // print('called my connection load more ==>3');

        final result = await connectionService.searchConnections(
            searchQuery: SearchQuery(
                page: (connectionsSearchList.length ~/ pageSize) + 1,
                pageSize: pageSize,
                search: searchController.text));
        result.fold(
          (failure) {
            // print('called my connection load more ==>4');
            myConnectionLoadMore.value = false;
          },
          (success) {
            myConnectionLoadMore.value = false;
            for (var datas in success.data ?? <MyConnection>[]) {
              final index = connectionsSearchList
                  .indexWhere((value) => value.toUser == datas.toUser);
              if (index == -1) {
                connectionsSearchList.add(datas);
                myConnectionLocalService
                    .addMyConnecitonToLocalStorageIfNotPresentInStorage(
                        myconnection: datas);
              } else {
                if (!connectionsSearchList[index].equals(datas)) {
                  int localId = connectionsSearchList[index].localId!;
                  connectionsSearchList[index] = datas;
                  myConnectionLocalService
                      .addMyConnecitonToLocalStorageIfNotPresentInStorage(
                          myconnection: datas.copyWith(localId: localId));
                }
              }
            }
            // connectionsSearchList.addAll(success.data ?? []);
          },
        );
        myConnectionLoadMore.value = false;
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

  searchReceivedConnectionRequest() {
    if (searchController.text.isEmpty) {
      filterdConnectionRequest.assignAll(recievedConnectionRequests);
      return;
    }
    filterdConnectionRequest.assignAll(recievedConnectionRequests
        .where((data) =>
            searchController.text.toLowerCase() ==
                data.fromUserName?.toLowerCase() ||
            searchController.text.toLowerCase() ==
                data.fromUserCompanyName?.toLowerCase() ||
            searchController.text.toLowerCase() ==
                data.fromUserDesignation?.toLowerCase())
        .toList());
  }

  // Recieved connection requests
  void fetchRecievedConnectionRequests({bool isRfresh = false}) async {
    if (recievedConnectionRequests.isNotEmpty && !isRfresh) {
      filterdConnectionRequest.assignAll(recievedConnectionRequests);
      return;
    }
    recievedConnectionRequestLoading.value = true;
    final result = await connectionService.recievedConnectionRequests();

    result.fold(
      (failure) {
        recievedConnectionRequestLoading.value = false;
      },
      (success) {
        recievedConnectionRequestLoading.value = false;
        log('Recieved connection requests = > ${success.requests}');
        filterdConnectionRequest.assignAll(success.requests ?? []);
        recievedConnectionRequests.assignAll(success.requests ?? []);
      },
    );
    recievedConnectionRequestLoading.value = false;
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

  Future<void> getConnectionDatasFromLocal({bool search = false}) async {
    // myConnectionsLoading.value = true;
    final resultLocal =
        await myConnectionLocalService.getMyconnectionsFromLocal();

    resultLocal.fold((failure) {
      log('getConnectionDatasFromLocal => local data fetch fail');
    }, (success) {
      if (search) {
        connectionsSearchList.clear();
      } else {
        myConnections.clear();
      }
      for (var data in success.data as List<MyConnection>) {
        if (data.cards?.isNotEmpty ?? false) {
          if (search) {
            connectionsSearchList.add(data);
          } else {
            myConnections.add(data);
          }
        }
      }
      if (search) {
        return;
      }

      // log('success local data get -----------------------------------------------------------------');
      // for (var datas in myConnections) {
      //   log('from dta ${datas.cards?.length.toString()}');
      // }
      if (myConnections.isNotEmpty) myConnectionsLoading.value = false;
    });
  }

  /// Get my all connections
  void fetchMyConnections(bool isLoad) async {
    if (myConnections.isNotEmpty && !isLoad) return;
    myConnections.value = [];
    fetchMyConnectionPageNumber = 1;

    ////delete complete datas of table
    // await MyConnectionLocalService().deleteAllLocalDatas();

    //get connection datas form local
    myConnectionsLoading.value = true;
    await getConnectionDatasFromLocal();

    //get connection datas from api
    final result = await connectionService.getMyconnections(
        paginationQuery: PaginationQuery(
            page: fetchMyConnectionPageNumber, pageSize: pageSize));

    await result.fold(
      (failure) {
        myConnectionsLoading.value = false;
      },
      (success) async {
        if (myConnections.isEmpty) {
          // myConnections.assignAll(success.data ?? []);
          for (var eachMyConnection in success.data ?? []) {
            await myConnectionLocalService
                .addMyConnecitonToLocalStorageIfNotPresentInStorage(
                    myconnection: eachMyConnection);
            if (eachMyConnection.cards?.isNotEmpty ?? false) {
              myConnections.add(eachMyConnection);
            }
          }
        } else {
          for (var datas in success.data ?? <MyConnection>[]) {
            final index = myConnections
                .indexWhere((value) => value.toUser == datas.toUser);
            if (index == -1) {
              if (datas.cards?.isNotEmpty ?? false) {
                myConnections.insert(0, datas);
              }
              myConnectionLocalService
                  .addMyConnecitonToLocalStorageIfNotPresentInStorage(
                      myconnection: datas);
            } else {
              if (!myConnections[index].equals(datas)) {
                int localid = myConnections[index].localId!;
                myConnections[index] = datas;
                myConnectionLocalService
                    .addMyConnecitonToLocalStorageIfNotPresentInStorage(
                        myconnection: datas.copyWith(localId: localid));
              }
            }
          }
        }
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
            page: (myConnections.length ~/ pageSize) + 2, pageSize: pageSize));
    result.fold(
      (failure) {
        fetchMyconnectionLoadMore.value = false;
      },
      (success) {
        for (var datas in success.data ?? <MyConnection>[]) {
          final index =
              myConnections.indexWhere((value) => value.toUser == datas.toUser);
          if (index == -1) {
            myConnections.add(datas);
            myConnectionLocalService
                .addMyConnecitonToLocalStorageIfNotPresentInStorage(
                    myconnection: datas);
          } else {
            if (!myConnections[index].equals(datas)) {
              int localid = myConnections[index].localId!;
              myConnections[index] = datas;
              myConnectionLocalService
                  .addMyConnecitonToLocalStorageIfNotPresentInStorage(
                      myconnection: datas.copyWith(localId: localid));
            }
          }
        }
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
      {required FollowBackRequestModel folowbackRequest, context}) async {
    followbackRequestLoading.value = true;
    final result = await connectionService.folowbackRequest(
        folowbackRequest: folowbackRequest);

    result.fold(
      (failure) {
        followbackRequestLoading.value = false;
        showSnackbar(context,
            message: 'Follow back successfull', backgroundColor: kred);
      },
      (success) {
        followbackRequestLoading.value = false;
        showSnackbar(context,
            message: 'Follow back successfull', backgroundColor: kneon);
      },
    );
  }

  // Unfollow a connection
  void unfollowRequest({
    required UnfollowConnectionModel unfollowRequest,
    required BuildContext context,
    required String? toUserId,
  }) async {
    myConnectionsLoading.value = true;
    final result = await connectionService.unfollowRequest(
        unfollowRequest: unfollowRequest);
    result.fold(
      (failure) {
        myConnectionsLoading.value = false;
        showSnackbar(context, message: errorMessage, backgroundColor: kred);
      },
      (success) async {
        connectionsSearchList.removeWhere((value) => value.toUser == toUserId);
        myConnectionsLoading.value = false;
        await myConnectionLocalService.deleteMyconnectionFromlocal(
            currentUserId: await SecureStorage.getUserId() ?? '',
            colToUser: toUserId ?? '');

        // for(var data in connectionsSearchList){
        //   if(data.toUser==toUserId){
        //     data.
        //   }
        // }

        showSnackbar(context,
            message: 'Unfollow successfully', backgroundColor: neonShade);
        // fetchMyConnections(true);
        myConnections.clear();
        searchConnections();
      },
    );
  }

  // Connection request accept Or reject
  Future<bool> connectionRequestAcceptOrReject(
      {required AcceptOrRejectConnectionRequest acceptOrReject,
      required BuildContext context}) async {
    acceptOrReject.sharedFields?.business?.branchOffices ??= false;
    acceptOrReject.sharedFields?.business?.brochure ??= false;
    acceptOrReject.sharedFields?.business?.businessAchievements ??= false;
    acceptOrReject.sharedFields?.business?.businessCategory ??= false;
    acceptOrReject.sharedFields?.business?.businessLogo ??= false;
    acceptOrReject.sharedFields?.business?.businessSocialMedia ??= false;
    acceptOrReject.sharedFields?.business?.designation ??= false;
    acceptOrReject.sharedFields?.business?.logoStory ??= false;
    acceptOrReject.sharedFields?.business?.product ??= false;
    acceptOrReject.sharedFields?.business?.bankDetails ??= false;

    acceptOrReject.sharedFields?.personal?.bloodGroup ??= false;
    acceptOrReject.sharedFields?.personal?.dob ??= false;
    acceptOrReject.sharedFields?.personal?.email ??= false;
    acceptOrReject.sharedFields?.personal?.name ??= false;
    acceptOrReject.sharedFields?.personal?.personalAchievements ??= false;
    acceptOrReject.sharedFields?.personal?.personalSocialMedia ??= false;
    acceptOrReject.sharedFields?.personal?.phone ??= false;

    recievedConnectionRequestLoading.value = true;
    bool followBackPossible = false;
    final result = await connectionService.acceptOrRejectConnectionRequest(
        acceptOrReject: acceptOrReject);

    result.fold(
      (failure) {
        recievedConnectionRequestLoading.value = false;
      },
      (success) {
        filterdConnectionRequest
            .removeWhere((e) => e.id == acceptOrReject.connectionId);
        recievedConnectionRequests
            .removeWhere((e) => e.id == acceptOrReject.connectionId);
        recievedConnectionRequestLoading.value = false;
        // fetchMyConnections(true);
        // fetchRecievedConnectionRequests();
        // searchConnections();
        followBackPossible = success.followBackPossible ?? false;
      },
    );
    return followBackPossible;
  }

  /// get card detail connection
  void getConnectionCardDetail(
      {required String cardId, bool refresh = false,required String uid}) async {
    log('Bizcard ID -->> $cardId');
    final cardController = Get.find<CardController>();
    cardController.toUserId=uid;
    if (refresh ||
        cardId != (cardController.bizcardDetail.value.bizcardId ?? "")) {
      cardController.isLoading.value = true;
      cardLoading.value = true;
    }
    cardController.bizcardDetail.value = CardDetailModel();
    final data = await connectionService.getConnectionCard(cardId: cardId);
    data.fold(
      (l) => null,
      (r) {
        cardController.bizcardDetail.value = r;
        cardController.bizcardDetail.value.personalDetails = r.personalDetails;
        cardController.bizcardDetail.value.businessDetails = r.businessDetails;
      },
    );
    cardController.isLoading.value = false;
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
      final controller = Get.find<CardController>();
      //  controller.bizcardDetail.value = controller.bizcardDetail.value.copyWith(selfie: r.data['image']);
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
              
          getConnectionCardDetail(cardId: connected.first.toCard ?? '',uid: userID);
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

  void searchSharedCardList() {
    if (searchController.text.isEmpty) {
      filteredSharedCards.assignAll(sharedCards);
      return;
    }
    filteredSharedCards.assignAll(sharedCards
        .where((data) =>
            searchController.text.toLowerCase() ==
                data.sharedByName?.toLowerCase() ||
            searchController.text.toLowerCase() ==
                data.sharedByEmail?.toLowerCase())
        .toList());
  }

  /// get shared card list
  void getSharedCardList({bool isRefresh = false}) async {
    if (!isRefresh && sharedCards.isNotEmpty) {
      filteredSharedCards.assignAll(sharedCards);
      return;
    }
    sharedCardLoading.value = true;
    final result = await connectionService.getMySharedCards();
    result.fold((l) {
      filteredSharedCards.value = [];
      sharedCardLoading.value = false;
    }, (r) {
      filteredSharedCards.value = r.results ?? [];
      sharedCards = r.results ?? [];
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
      filteredSharedCards.removeWhere((e) => e.id == id);
      sharedCardLoadingId.value = '';
      showSnackbar(context,
          message: 'Succesfully ${accept ? 'accepted' : 'rejected'} request');
    });
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:bizkit/core/model/search_query/search_query.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/bizcard_users_search_responce/result.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/cancel_connection_request_model/cancel_connection_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_request/send_connection_request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_requets_responce/request.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/text_field/textform_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ScreenCardAddConnections extends StatefulWidget {
  const ScreenCardAddConnections({super.key});

  @override
  State<ScreenCardAddConnections> createState() =>
      _ScreenCardAddConnectionsState();
}

class _ScreenCardAddConnectionsState extends State<ScreenCardAddConnections> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    if (_focusNode.hasFocus) {
      _focusNode.unfocus();
      return false;
    }
    return true;
  }

  final TextEditingController searchBizkitUsersController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final connectionController = Get.find<ConnectionsController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // context.read<ConnectionRequestBloc>().connectionController.text = '';
      _focusNode.requestFocus();
    });
    bool show = false;
    return PopScope(
      canPop: _focusNode.hasFocus || !_focusNode.hasFocus,
      onPopInvoked: (didPop) {
        _onWillPop();
      },
      child: GestureDetector(
        onTap: () {
          _focusNode.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 18,
              ),
              onPressed: () {
                GoRouter.of(context).pop();
                // Navigator.of(context).pop();
              },
              color: kwhite,
            ),
            backgroundColor: knill,
            title: Text(
              'New Connection',
              style: textStyle1.copyWith(fontWeight: FontWeight.w700),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  connectionController.fetchAllSendConnectionRequests();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ConnectionPendingRequests()));
                },
                icon: const Icon(Icons.person_2_outlined),
              ),
              kWidth10
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomTextFormField(
                  focusNode: _focusNode,
                  controller: searchBizkitUsersController,
                  onChanaged: (value) {
                    if (value.length < 3) {
                      show = false;
                    } else {
                      show = true;
                    }
                    connectionController.searchBizkitUsers(
                        searchQuery: SearchQuery(search: value));
                  },
                  labelText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                ),
                adjustHieght(10),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      connectionController.searchBizkitUsers(
                          searchQuery: SearchQuery(search: ''));
                      await Future.delayed(const Duration(milliseconds: 1500));
                    },
                    child: Obx(
                      () {
                        if (connectionController
                            .searchBizkitUsersLoading.value) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (connectionController.bizkitUsers.isEmpty) {
                          return ErrorRefreshIndicator(
                            onRefresh: () {
                              connectionController.searchBizkitUsers(
                                  searchQuery: SearchQuery(search: ''));
                            },
                            errorMessage: 'No bizcard users',
                            image: emptyNodata2,
                          );
                        } else {
                          return GridView.builder(
                            itemCount: connectionController.bizkitUsers.length,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1 / 1.15,
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            itemBuilder: (context, index) {
                              return GridTileAddRequestConnection(
                                data: connectionController.bizkitUsers[index],
                                index: index,
                                fromPendingRequests: false,
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GridTileAddRequestConnection extends StatefulWidget {
  const GridTileAddRequestConnection({
    super.key,
    this.data,
    required this.index,
    this.allSendRequests,
    this.fromPendingRequests = false,
  });

  final BizCardUsers? data;
  final SendConnectionRequet? allSendRequests;
  final int index;
  final bool fromPendingRequests;

  @override
  State<GridTileAddRequestConnection> createState() =>
      _GridTileAddRequestConnectionState();
}

class _GridTileAddRequestConnectionState
    extends State<GridTileAddRequestConnection> {
  bool requested = false;
  // @override
  // void initState() {
  //   log("added ==== ${widget.data.toJson()}");
  //   if (widget.data.connectionId != null) {
  //     requested = true;
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final connectionController = Get.find<ConnectionsController>();
    // final name = widget.data.name ?? '';
    // final company = widget.data.company ?? '';
    // final designation = widget.data.designation ?? '';
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: kneonShade),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(children: [
        // image profile
        CircleAvatar(
            radius: kwidth * 0.08,
            backgroundColor: textFieldFillColr,
            backgroundImage: MemoryImage(base64.decode(
                imageTestingBase64.startsWith('data')
                    ? imageTestingBase64.substring(22)
                    : imageTestingBase64))

            // child: widget.data.image != null
            //     ? null
            //     :
            //const Icon(Icons.person, color: neonShade),
            ),
        adjustHieght(10),
        Text(
          widget.fromPendingRequests
              ? widget.allSendRequests?.toUserName ?? 'name'
              : widget.data?.username ?? 'name',
          overflow: TextOverflow.ellipsis,
          style: textThinStyle1.copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          widget.fromPendingRequests
              ? widget.allSendRequests?.toUserDesignation ?? 'designation'
              : widget.data?.designation ?? 'designation',
          overflow: TextOverflow.ellipsis,
          style: textThinStyle1,
        ),
        adjustHieght(7),
        GestureDetector(
          onTap: () {
            if (widget.fromPendingRequests) {
              connectionController.cancelConnectionRequest(
                  fromSendrequests: true,
                  cancelConnectionRequest: CancelConnectionRequestModel(
                      connectionId: widget.allSendRequests?.requestId,
                      userId: widget.allSendRequests?.toUserId));
            } else {
              if (widget.data?.connectionRequestId != null) {
                connectionController.cancelConnectionRequest(
                    fromSendrequests: false,
                    cancelConnectionRequest: CancelConnectionRequestModel(
                        connectionId: widget.data?.connectionRequestId,
                        userId: widget.data?.userId));
              } else if (widget.data?.connectionExist == false) {
                connectionController.sendConnectionRequest(
                    connectionRequest: SendConnectionRequest(
                        toUser: widget.data?.userId ?? ''),
                    context: context);
              }
            }
          },
          child: widget.fromPendingRequests &&
                  widget.allSendRequests?.requestId != null
              ? widget.allSendRequests?.checkLoading == true
                  ? Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: const LoadingAnimation(),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                          gradient: neonShadeGradient,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: FittedBox(
                        child: Text(
                          'Remove Connection',
                          style: textThinStyle1,
                        ),
                      ),
                    )
              : widget.data?.checkLoading == true
                  ? Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: const LoadingAnimation(),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                          gradient: neonShadeGradient,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: FittedBox(
                        child: Text(
                          widget.data?.connectionRequestId != null
                              ? 'Remove Connection'
                              : 'Add Connection',
                          style: textThinStyle1,
                        ),
                      ),
                    ),
        ),
      ]),
    );
  }
}

class ConnectionPendingRequests extends StatelessWidget {
  const ConnectionPendingRequests({super.key});

  @override
  Widget build(BuildContext context) {
    final connectionController = Get.find<ConnectionsController>();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        // context
        //     .read<ConnectionRequestBloc>()
        //     .add(const ConnectionRequestEvent.getConnectionRequestedList());
      },
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: kwhite,
        ),
        backgroundColor: knill,
        title: Text(
          'Pending Connection requests',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: RefreshIndicator(
            onRefresh: () async {
              connectionController.fetchAllSendConnectionRequests();
              await Future.delayed(const Duration(milliseconds: 1500));
            },
            child: Obx(
              () {
                if (connectionController
                    .allSendConnectionRequestsLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (connectionController
                    .allSendConnectionRequests.isEmpty) {
                  return ErrorRefreshIndicator(
                    onRefresh: () {
                      connectionController.fetchAllSendConnectionRequests();
                    },
                    errorMessage: 'No send connection requests',
                    image: emptyNodata2,
                  );
                } else {
                  return GridView.builder(
                    itemCount:
                        connectionController.allSendConnectionRequests.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.15,
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return GridTileAddRequestConnection(
                        fromPendingRequests: true,
                        index: index,
                        allSendRequests: connectionController
                            .allSendConnectionRequests[index],
                      );
                    },
                  );
                }
              },
            ),
          )),
    );
  }
}

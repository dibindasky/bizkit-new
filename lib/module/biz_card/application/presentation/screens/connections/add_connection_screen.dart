import 'dart:convert';

import 'package:bizkit/core/model/search_query/search_query.dart';
import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/bizcard_users_search_responce/result.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_request/send_connection_request.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
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
                GoRouter.of(context).pop(); // Navigator.of(context).pop();
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
                  // controller: context
                  //     .read<ConnectionRequestBloc>()
                  //     .connectionController,
                  onChanaged: (value) {
                    if (value.length < 3) {
                      show = false;
                    } else {
                      show = true;
                    }
                    connectionController.searchBizkitUsers(
                        searchQuery: SearchQuery(search: value));
                    // context.read<ConnectionRequestBloc>().add(
                    //     ConnectionRequestEvent.searchBizkitUsers(
                    //         searchQuery: SearchQuery(search: value)));
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
                              connectionController
                                  .fetchRecievedConnectionRequests();
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
    required this.data,
    required this.index,
    this.fromPendingRequests = false,
  });

  final BizCardUsers data;
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
          widget.data.username ?? 'Name',
          overflow: TextOverflow.ellipsis,
          style: textThinStyle1.copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          widget.data.designation ?? 'Designation',
          overflow: TextOverflow.ellipsis,
          style: textThinStyle1,
        ),
        adjustHieght(7),
        GestureDetector(
          onTap: () {
            if (widget.fromPendingRequests) {
              // context.read<ConnectionRequestBloc>().add(
              //     ConnectionRequestEvent
              //         .removeConnectionRequestFromPendingScreen(
              //             connectionRequestIdModel:
              //                 ConnectionRequestIdModel(
              //                     connectionRequestId: widget.data.id!),
              //             id: widget.data.id!));
            } else {
              // if (widget.data.connectionId == null) {
              //   context.read<ConnectionRequestBloc>().add(
              //       ConnectionRequestEvent.addConnectionRequests(
              //           addConnectionRequestModel:
              //               AddConnectionRequestModel(
              //                   cardUserId: widget.data.id),
              //           index: widget.data.id!));
              // } else {
              //   context.read<ConnectionRequestBloc>().add(
              //       ConnectionRequestEvent.removeConnectionRequest(
              //           connectionRequestIdModel: ConnectionRequestIdModel(
              //               connectionRequestId: widget.data.connectionId),
              //           id: widget.data.id!));
              // }

              if (widget.data.connectionExist == false) {
                connectionController.sendConnectionRequest(
                    connectionRequest:
                        SendConnectionRequest(toUser: widget.data.userId ?? ''),
                    context: context);
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
                gradient: neonShadeGradient,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: FittedBox(
              child: Text(
                widget.data.connectionExist == true ||
                        widget.data.connectionRequestId != null
                    ? 'Remove Request'
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
              // context.read<ConnectionRequestBloc>().add(
              //     const ConnectionRequestEvent
              //         .getConnectionRequestedList());
              await Future.delayed(const Duration(milliseconds: 1500));
            },
            child: GridView.builder(
              itemCount: 3,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.15,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemBuilder: (context, index) {
                return GridTileAddRequestConnection(
                  fromPendingRequests: true,
                  data: connectionController.bizkitUsers[index],
                  index: index,
                );
              },
            ),
          )),
    );
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/accept_or_reject_connection_request/accept_or_reject_connection_request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/follow_back_request_model/follow_back_request_model.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/dailog.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ScreenConnectionRequests extends StatelessWidget {
  const ScreenConnectionRequests({super.key});

  @override
  Widget build(BuildContext context) {
    final connectionController = Get.find<ConnectionsController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // context
      //     .read<ConnectionRequestBloc>()
      //     .add(const ConnectionRequestEvent.getRequestLists());
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
          onPressed: () {
            GoRouter.of(context).pop();
          },
          color: kwhite,
        ),
        backgroundColor: knill,
        title: Text(
          'Connection Requests',
          style: textHeadStyle1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: RefreshIndicator(
          onRefresh: () async {
            connectionController.fetchRecievedConnectionRequests();
            await Future.delayed(const Duration(seconds: 2));
          },
          child: Obx(
            () {
              if (connectionController.recievedConnectionRequestLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (connectionController
                  .recievedConnectionRequests.isEmpty) {
                return ErrorRefreshIndicator(
                  onRefresh: () {
                    connectionController.fetchRecievedConnectionRequests();
                  },
                  errorMessage: 'No recieved connection requests',
                  image: emptyNodata2,
                );
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.2,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount:
                      connectionController.recievedConnectionRequests.length,
                  itemBuilder: (context, index) {
                    // final data = state.requestList![index];
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
                          backgroundImage: MemoryImage(base64.decode(
                              imageTestingBase64.startsWith('data')
                                  ? imageTestingBase64.substring(22)
                                  : imageTestingBase64)),
                          backgroundColor: smallBigGrey,
                        ),
                        adjustHieght(10),
                        Text(
                          connectionController.recievedConnectionRequests[index]
                                  .fromUserName ??
                              'Name',
                          overflow: TextOverflow.ellipsis,
                          style: textThinStyle1,
                        ),
                        Text(
                          connectionController.recievedConnectionRequests[index]
                                  .fromUserDesignation ??
                              'Designation',
                          overflow: TextOverflow.ellipsis,
                          style: textThinStyle1,
                        ),
                        adjustHieght(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // cancel request
                            InkWell(
                              onTap: () {
                                // context.read<ConnectionRequestBloc>().add(
                                //     ConnectionRequestEvent.deleteRequest(
                                //         id: data.id!));
                                // showDialog(
                                //   context: context,
                                //   builder: (context) => AlertDialog(
                                //       title: const Text('Reject  Connection'),
                                //       actions: [
                                //         OutlinedButton(
                                //             onPressed: () {
                                //               Navigator.pop(context);
                                //             },
                                //             child: const Text('Cancel')),
                                //         OutlinedButton(
                                //             onPressed: () {
                                //               //context
                                //               // .read<
                                //               //     ConnectionRequestBloc>()
                                //               // .add(ConnectionRequestEvent
                                //               //     .addConnectionRequests(
                                //               //         addConnectionRequestModel:
                                //               //             AddConnectionRequestModel(
                                //               //                 cardUserId:
                                //               //                     data.userId),
                                //               //         index: index));
                                //               Navigator.pop(context);
                                //             },
                                //             child: const Text('Reject'))
                                //       ]),
                                // );

                                showConfirmationDialog(
                                  context,
                                  heading: 'Reject  connection',
                                  actionButton: 'Reject',
                                  onPressed: () {
                                    connectionController
                                        .connectionRequestAcceptOrReject(
                                            acceptOrReject:
                                                AcceptOrRejectConnectionRequest(
                                                    connectionId:
                                                        connectionController
                                                                .recievedConnectionRequests[
                                                                    index]
                                                                .id ??
                                                            '',
                                                    status: 'rejected'));
                                    Navigator.pop(context);
                                  },
                                );
                              },
                              child: CircleAvatar(
                                child: Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: CircleAvatar(
                                      backgroundColor: kDefaultIconDarkColor,
                                      child: const Icon(
                                        Icons.close,
                                        color: kwhite,
                                      )),
                                ),
                              ),
                            ),
                            // accept request
                            InkWell(
                                onTap: () {
                                  // context.read<ConnectionRequestBloc>().add(
                                  //       ConnectionRequestEvent.addConnection(
                                  //         createConnectionWithCardIdModel:
                                  //             CreateConnectionWithCardIdModel(
                                  //           connectionRequestId: data.id,
                                  //         ),
                                  //       ),
                                  //     );
                                  // if (data.hasConnection == false) {
                                  // showDialog(
                                  //   context: context,
                                  //   builder: (context) => AlertDialog(
                                  //       title: const Text(
                                  //           'Request back to Add Connection'),
                                  //       actions: [
                                  //         OutlinedButton(
                                  //             onPressed: () {
                                  //               Navigator.pop(context);
                                  //             },
                                  //             child: const Text('Cancel')),
                                  //         OutlinedButton(
                                  //             onPressed: () {
                                  //               //context
                                  //               // .read<
                                  //               //     ConnectionRequestBloc>()
                                  //               // .add(ConnectionRequestEvent
                                  //               //     .addConnectionRequests(
                                  //               //         addConnectionRequestModel:
                                  //               //             AddConnectionRequestModel(
                                  //               //                 cardUserId:
                                  //               //                     data.userId),
                                  //               //         index: index));
                                  //               Navigator.pop(context);
                                  //             },
                                  //             child: const Text('Request'))
                                  //       ]),
                                  // );

                                  showConfirmationDialog(
                                    context,
                                    heading: 'Request back to add Connection',
                                    actionButton: 'Accept',
                                    onPressed: () {
                                      connectionController
                                          .connectionRequestAcceptOrReject(
                                              acceptOrReject:
                                                  AcceptOrRejectConnectionRequest(
                                                      connectionId:
                                                          connectionController
                                                                  .recievedConnectionRequests[
                                                                      index]
                                                                  .id ??
                                                              '',
                                                      status: 'accepted'));
                                      Navigator.pop(context);
                                      if (connectionController
                                          .followBackPossible.value) {
                                        showConfirmationDialog(
                                          context,
                                          heading:
                                              'Request back to add Connection',
                                          actionButton: 'Follow back',
                                          onPressed: () {
                                            // connectionController.followbackRequest(
                                            //     folowbackRequest:
                                            //         FollowBackRequestModel(
                                            //             toUser: connectionController
                                            //                     .recievedConnectionRequests[
                                            //                         index]
                                            //                     .id ??
                                            //                 ''));
                                            log('follow back request');
                                            // Navigator.pop(context);
                                          },
                                        );
                                      }
                                    },
                                  );
                                },
                                child: const CircleAvatar(
                                    child: Icon(Icons.check, color: kwhite))),
                          ],
                        )
                      ]),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

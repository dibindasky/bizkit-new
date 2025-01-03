import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/application/controller/level_sharing/level_sharing_controller.dart';
import 'package:bizkit/module/biz_card/application/presentation/screens/card_and_connection_tab.dart/widgets/connection_accept_dialog.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/accept_or_reject_connection_request/accept_or_reject_connection_request.dart';
import 'package:bizkit/module/module_manager/application/controller/access/access_controller.dart';
import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/refresh_indicator/refresh_custom.dart';
import 'package:bizkit/utils/show_dialogue/dailog.dart';
import 'package:bizkit/utils/snackbar/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConnectionRequestsTab extends StatefulWidget {
  const ConnectionRequestsTab({super.key});

  @override
  State<ConnectionRequestsTab> createState() => _ConnectionRequestsTabState();
}

class _ConnectionRequestsTabState extends State<ConnectionRequestsTab> {
  @override
  Widget build(BuildContext context) {
    final accessController = Get.find<AccessController>();
    final connectionController = Get.find<ConnectionsController>();
    final levelSharingController = Get.find<LevelSharingController>();
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      connectionController.fetchRecievedConnectionRequests();
      levelSharingController.fetchAllCommonSharedFields();
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
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
            } else if (!internetConnectinController
                    .isConnectedToInternet.value &&
                connectionController.filterdConnectionRequest.isEmpty) {
              return Center(
                child: InternetConnectionLostWidget(
                  onTap: () {
                    connectionController.fetchRecievedConnectionRequests();
                  },
                ),
              );
            } else if (connectionController.filterdConnectionRequest.isEmpty) {
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
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: connectionController.filterdConnectionRequest.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      elevation: 0,
                      child: Column(children: [
                        // image profile
                        adjustHieght(10.h),
                        CircleAvatar(
                          radius: kwidth * 0.08,
                          child: (connectionController
                                      .filterdConnectionRequest[index]
                                      .fromUserProfilePicture
                                      ?.isNotEmpty ??
                                  false)
                              ? NetworkImageWithLoader(
                                  connectionController
                                          .filterdConnectionRequest[index]
                                          .fromUserProfilePicture ??
                                      userProfileDummy,
                                  radius: 50,
                                )
                              : Image.asset(userProfileDummy),
                        ),
                        // CircleAvatar(
                        //   radius: kwidth * 0.08,
                        //   // backgroundImage: MemoryImage(
                        //   //   base64.decode(
                        //   //       imageTestingBase64.startsWith('data')
                        //   //           ? imageTestingBase64.substring(22)
                        //   //           : imageTestingBase64),
                        //   // ),
                        //   backgroundImage:
                        //       const AssetImage(userProfileDummy),
                        //   backgroundColor: smallBigGrey,
                        // ),
                        adjustHieght(10),
                        Text(
                          connectionController.filterdConnectionRequest[index]
                                  .fromUserName ??
                              'Name',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          connectionController.filterdConnectionRequest[index]
                                  .fromUserDesignation ??
                              'Designation',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontSize: 10),
                        ),
                        adjustHieght(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // cancel request
                            InkWell(
                              onTap: () {
                                if (internetConnectinController
                                    .isConnectedToInternet.value) {
                                  showConfirmationDialog(
                                    context,
                                    heading:
                                        'Are you sure do you want to reject this connection request',
                                    actionButton: 'Reject',
                                    onPressed: () {
                                      connectionController
                                          .connectionRequestAcceptOrReject(
                                              context: context,
                                              acceptOrReject:
                                                  AcceptOrRejectConnectionRequest(
                                                      connectionId:
                                                          connectionController
                                                                  .filterdConnectionRequest[
                                                                      index]
                                                                  .id ??
                                                              '',
                                                      status: 'rejected'));
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                  );
                                } else {
                                  showCustomToast(
                                      message:
                                          'You must be online to rejected this connection request. Please check your internet connection.',
                                      backgroundColor: kred);
                                }

                                // showDialog(
                                //   context: context,
                                //   builder: (context) => AlertDialog(
                                //       title: Text(
                                //         'Reject Connection Request',
                                //         style: Theme.of(context)
                                //             .textTheme
                                //             .displayMedium,
                                //       ),
                                //       actions: [
                                //         OutlinedButton(
                                //             onPressed: () {
                                //               Navigator.pop(context);
                                //             },
                                //             child: Text(
                                //               'Cancel',
                                //               style: Theme.of(context)
                                //                   .textTheme
                                //                   .displaySmall,
                                //             )),
                                //         OutlinedButton(
                                //             onPressed: () {},
                                //             child: Text(
                                //               'Reject',
                                //               style: Theme.of(context)
                                //                   .textTheme
                                //                   .displaySmall,
                                //             ))
                                //       ]),
                                // );
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(1),
                                child: CircleAvatar(
                                    backgroundColor: kblack,
                                    child: Icon(
                                      Icons.close,
                                      color: kwhite,
                                    )),
                              ),
                            ),
                            // accept request
                            InkWell(
                                onTap: () {
                                  if (internetConnectinController
                                      .isConnectedToInternet.value) {
                                    showConnectionAcceptDialog(
                                        context,
                                        accessController,
                                        levelSharingController,
                                        connectionController,
                                        index);
                                  } else {
                                    showCustomToast(
                                        message:
                                            'You must be online to accept this connection request. Please check your internet connection.',
                                        backgroundColor: kred);
                                  }
                                },
                                child: const CircleAvatar(
                                    child: Icon(Icons.check, color: kwhite))),
                          ],
                        )
                      ]),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

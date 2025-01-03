import 'package:bizkit/module/biz_card/application/controller/connections/connections_controller.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/bizcard_users_search_responce/result.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/cancel_connection_request_model/cancel_connection_request_model.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_request/send_connection_request.dart';
import 'package:bizkit/module/biz_card/domain/model/connections/send_connection_requets_responce/request.dart';
import 'package:bizkit/module/module_manager/application/controller/internet_controller.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/images/network_image_with_loader.dart';
import 'package:bizkit/utils/loading_indicator/loading_animation.dart';
import 'package:bizkit/utils/show_dialogue/confirmation_dialog.dart';
import 'package:bizkit/utils/snackbar/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConnectionTile extends StatefulWidget {
  const ConnectionTile({
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
  State<ConnectionTile> createState() => _ConnectionTileState();
}

class _ConnectionTileState extends State<ConnectionTile> {
  bool requested = false;

  @override
  Widget build(BuildContext context) {
    final internetConnectinController =
        Get.find<InternetConnectionController>();
    final connectionController = Get.find<ConnectionsController>();
    return Card(
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.fromPendingRequests
              ? CircleAvatar(
                  radius: kwidth * 0.08,
                  child: widget.allSendRequests?.toUserProfilePicture != null
                      ? NetworkImageWithLoader(
                          widget.allSendRequests?.toUserProfilePicture ??
                              userProfileDummy,
                          radius: kwidth * 0.08,
                        )
                      : Image.asset(userProfileDummy),
                )
              : CircleAvatar(
                  radius: kwidth * 0.08,
                  child: widget.data?.profilePicture != null
                      ? NetworkImageWithLoader(
                          widget.data!.profilePicture!,
                          radius: kwidth * 0.08,
                        )
                      : Image.asset(userProfileDummy),
                ),
          // CircleAvatar(
          //   radius: kwidth * 0.08,
          //   backgroundColor: textFieldFillColr,
          //   backgroundImage: const AssetImage(
          //     userProfileDummy,
          //   ),
          // ),
          adjustHieght(10.h),
          Text(
            widget.fromPendingRequests
                ? widget.allSendRequests?.toUserName ?? 'name'
                : widget.data?.username ?? 'name',
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontSize: 14),
          ),
          Text(
            widget.fromPendingRequests
                ? widget.allSendRequests?.toUserDesignation ?? 'designation'
                : widget.data?.designation ?? 'designation',
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
          ),
          adjustHieght(7),
          GestureDetector(
            onTap: () {
              if (internetConnectinController.isConnectedToInternet.value) {
                showCustomConfirmationDialogue(
                  context: context,
                  title: widget.fromPendingRequests
                      ? widget.allSendRequests?.requestId != null
                          ? 'Remove Connection Request'
                          : 'Send Connection Request'
                      : widget.data?.connectionRequestId != null
                          ? 'Remove Connection'
                          : 'Send Connection Request',
                  buttonText: widget.fromPendingRequests
                      ? widget.allSendRequests?.requestId != null
                          ? 'Remove'
                          : 'Send'
                      : widget.data?.connectionRequestId != null
                          ? 'Remove'
                          : 'Send',
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
                            cancelConnectionRequest:
                                CancelConnectionRequestModel(
                                    connectionId:
                                        widget.data?.connectionRequestId,
                                    userId: widget.data?.userId));
                      } else if (widget.data?.connectionExist == false) {
                        connectionController.sendConnectionRequest(
                            connectionRequest: SendConnectionRequest(
                                toUser: widget.data?.userId ?? ''),
                            context: context);
                      }
                    }
                  },
                );
              } else {
                showCustomToast(
                  message:
                      'An active internet connection is required to proceed. Please check your connection and try again.',
                  backgroundColor: kred,
                );
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
                        decoration: const BoxDecoration(
                            color: kneon,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Remove',
                            style: Theme.of(context).textTheme.displaySmall,
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
                        decoration: const BoxDecoration(
                            color: kneon,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: FittedBox(
                          child: Text(
                            widget.data?.connectionRequestId != null
                                ? 'Remove'
                                : 'Add Connection',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}

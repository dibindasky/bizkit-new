import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/message_read_marker.dart';
import 'package:bizkit/module/task/domain/model/chat/message.dart';
import 'package:bizkit/module/task/domain/model/chat/text/text_message.dart';
import 'package:bizkit/utils/clipper/chat_clipper.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatBubble extends StatelessWidget {
  final Message message;
  final bool showArrow;

  const ChatBubble({
    super.key,
    required this.message,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatController>();
    final message = this.message.textMessage!;
    final bool showCol = (message.message ?? '').length > 15;
    List<Widget> data = [
      Text(
        message.message ?? '',
        style: textStyle1.copyWith(color: message.sender ? kwhite : kblack),
      ),
      showCol ? kempty : adjustWidth(8.w),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DateTimeFormater.formatTimeAMPM(message.timestamp),
            style: textStyle1.copyWith(
              color: message.sender ? kgrey : kblack,
              fontSize: 8.sp,
            ),
          ),
          message.sender ? adjustWidth(5.w) : kempty,
          message.sender
              ? MessageReadMarker(
                  read: message.readByAll,
                  pending: (message.messageId?.isEmpty ?? true))
              : kempty
        ],
      ),
    ];
    return Align(
      alignment: message.sender ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
            top: 5.0.w,
            bottom: 0.w,
            left: message.sender ? 50.w : 0.w,
            right: !message.sender ? 50.w : 0.w),
        child: GestureDetector(
          onLongPress: () {
            controller.selectOrUnselectMessage(message: this.message);
          },
          onTap: () {
            if (controller.selectedMessages.isNotEmpty) {
              controller.selectOrUnselectMessage(message: this.message);
            }
          },
          child: Obx(() {
            final selected = controller.selectedMessages
                    .indexWhere((t) => t.messageId == this.message.messageId) !=
                -1;
            return ClipPath(
              clipper: ChatBubbleClipper(
                  isSender: message.sender, showArrow: showArrow),
              child: Container(
                  color: selected
                      ? kblue
                      : message.sender
                          ? neonShade.withGreen(190)
                          : kwhite,
                  padding: EdgeInsets.only(
                      left: message.sender ? 10.w : 20.w,
                      right: !message.sender ? 10.w : 20.w,
                      top: 5.w,
                      bottom: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      message.sender
                          ? kempty
                          : Text(
                              message.username ?? '',
                              style: textThinStyle1.copyWith(
                                  fontSize: 8.sp, color: kblack),
                            ),
                      showCol
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: data,
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: data,
                            )
                    ],
                  )),
            );
          }),
        ),
      ),
    );
  }
}

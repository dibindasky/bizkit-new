import 'package:bizkit/module/task/application/controller/chat/chat_controller.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/file_message/image_messge_card.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/file_message/pdf_message_card.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/message_read_marker.dart';
import 'package:bizkit/module/task/domain/model/chat/message.dart';
import 'package:bizkit/utils/clipper/chat_pol_clipper.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FileMessageCard extends StatelessWidget {
  const FileMessageCard({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final message = this.message.file;
    final sender = message!.sender;
    final controller = Get.find<ChatController>();
    return Obx(
      () => Container(
        color: controller.selectedMessages
                    .indexWhere((t) => t.messageId == this.message.messageId) ==
                -1
            ? null
            : kblue,
        child: Align(
          alignment: message.fileType == 'pdf' && sender
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(
                top: 5.0.w,
                bottom: 0.w,
                left: sender ? 50.w : 0.w,
                right: !sender ? 50.w : 0.w),
            child: GestureDetector(
              onLongPress: () {
                controller.selectOrUnselectMessage(message: this.message);
              },
              onTap: () {
                if (controller.selectedMessages.isNotEmpty) {
                  controller.selectOrUnselectMessage(message: this.message);
                }
              },
              child: ClipPath(
                clipper: PollChatClipper(isSender: sender),
                child: AnimatedContainer(
                  color: sender ? neonShade.withGreen(190) : kwhite,
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.only(
                      left: !sender ? 15.w : 5.w,
                      right: sender ? 15.w : 5.w,
                      top: sender ? 5.w : 0.w,
                      bottom: 0.h),
                  width: message.fileType == 'pdf' ? 150.h : null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sender
                          ? kempty
                          : Text(
                              message.username ?? '',
                              style: textThinStyle1.copyWith(
                                  fontSize: 8.sp, color: kblack),
                            ),
                      message.fileType == 'pdf'
                          ? PdfMessageCard(message: message)
                          : message.fileType == 'jpg' ||
                                  message.fileType == 'png' ||
                                  message.fileType == 'image'
                              ? ImageMessageCard(message: message)
                              : Text('Unknown file type',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                          color: sender ? kwhite : kblack,
                                          fontSize: 13)),
                      adjustHieght(5.h),
                      message.message?.isEmpty ?? true
                          ? kempty
                          : Text(message.message ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(color: sender ? kwhite : kblack)),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              DateTimeFormater.formatTimeAMPM(
                                  message.timestamp),
                              style: textThinStyle1.copyWith(
                                  color: sender ? kgrey : kgrey,
                                  fontSize: 8.sp),
                            ),
                            sender ? kWidth10 : kempty,
                            sender
                                ? MessageReadMarker(
                                    read: message.readByAll ?? false,
                                    pending: message.messageId?.isEmpty ?? true,
                                  )
                                : kempty
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:bizkit/module/task/application/presentation/screens/chat/file_message/image_messge_card.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/file_message/pdf_message_card.dart';
import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/message_read_marker.dart';
import 'package:bizkit/module/task/domain/model/chat/file_model.dart';
import 'package:bizkit/utils/clipper/chat_pol_clipper.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/contants.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FileMessageCard extends StatelessWidget {
  const FileMessageCard({super.key, required this.message});

  final FileMessage message;

  @override
  Widget build(BuildContext context) {
    final sender = message.sender;
    return Align(
      alignment: message.fileType == 'pdf'
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
            top: 5.0.w,
            bottom: 5.0.w,
            left: sender ? 50.w : 0.w,
            right: !sender ? 50.w : 0.w),
        child: ClipPath(
          clipper: PollChatClipper(isSender: sender),
          child: AnimatedContainer(
              color:
                  sender ? neonShade.withGreen(190) : kwhite.withOpacity(0.3),
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.only(
                  left: !sender ? 15.w : 5.w,
                  right: sender ? 15.w : 5.w,
                  top: 5.h,
                  bottom: 0.h),
              width: message.fileType == 'pdf' ? 150.h  : null,
              child: Column(
                children: [
                  message.fileType == 'image'
                      ? ImageMessageCard(message: message)
                      : message.fileType == 'pdf'
                          ? PdfMessageCard(message: message)
                          : const Text('Unknown file type'),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          DateTimeFormater.formatTimeAMPM(message.timestamp),
                          style: textThinStyle1.copyWith(
                              color: sender ? kgrey : klightgrey,
                              fontSize: 8.sp),
                        ),
                        sender ? kWidth10 : kempty,
                        sender
                            ? MessageReadMarker(
                                read: message.readByAll ?? false)
                            : kempty
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
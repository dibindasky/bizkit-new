import 'package:bizkit/module/task/application/presentation/screens/chat/widgets/message_read_marker.dart';
import 'package:bizkit/module/task/domain/model/chat/text/text_message.dart';
import 'package:bizkit/utils/clipper/chat_clipper.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:bizkit/utils/intl/intl_date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubble extends StatelessWidget {
  final TextMessage message;
  final bool showArrow;

  const ChatBubble({
    super.key,
    required this.message,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool showCol = (message.message ?? '').length > 15;
    List<Widget> data = [
      Text(
        message.message ?? '',
        style: textStyle1.copyWith(color: kwhite),
      ),
      showCol ? kempty : adjustWidth(8.w),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DateTimeFormater.formatTimeAMPM(message.timestamp),
            style: textStyle1.copyWith(
              color: message.sender ? kgrey : kwhite.withOpacity(0.5),
              fontSize: 8.sp,
            ),
          ),
          message.sender ? adjustWidth(5.w) : kempty,
          message.sender ? MessageReadMarker(read: message.readByAll) : kempty
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
        child: ClipPath(
          clipper:
              ChatBubbleClipper(isSender: message.sender, showArrow: showArrow),
          child: Container(
              color: message.sender ? neonShade.withGreen(190) : klightDarkGrey,
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
                              fontSize: 8.sp, color: kwhite.withOpacity(0.7)),
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
        ),
      ),
    );
  }
}

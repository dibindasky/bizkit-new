import 'package:bizkit/module/task/domain/model/chat/message.dart';
import 'package:bizkit/utils/clipper/chat_clipper.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:bizkit/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeletedChatMessageContainer extends StatelessWidget {
  const DeletedChatMessageContainer({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final bool sender = message.sender ?? false;
    return Align(
      alignment: sender ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
            top: 5.0.w,
            bottom: 0.w,
            left: sender ? 50.w : 0.w,
            right: !sender ? 50.w : 0.w),
        child: ClipPath(
          clipper: ChatBubbleClipper(isSender: sender, showArrow: true),
          child: Container(
            color: (sender ? neonShade.withGreen(190) : klightDarkGrey)
                .withOpacity(0.5),
            padding: EdgeInsets.only(
                left: sender ? 10.w : 20.w,
                right: !sender ? 10.w : 20.w,
                top: 5.w,
                bottom: 5.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.highlight_remove,
                  size: 13.sp,
                  color: kwhite.withOpacity(0.5),
                ),
                kWidth5,
                Text(
                  style: textThinerStyle1,
                  'This message has been deleted',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

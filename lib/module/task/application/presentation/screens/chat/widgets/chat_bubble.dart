import 'package:bizkit/utils/clipper/chat_clipper.dart';
import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final String time;
  final bool isImage;
  final String? imageUrl;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isSender,
    required this.time,
    this.isImage = false,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
            top: 5.0.w,
            bottom: 5.0.w,
            left: isSender ? 50.w : 0.w,
            right: !isSender ? 50.w : 0.w),
        child: ClipPath(
          clipper: ChatBubbleClipper(isSender: isSender),
          child: Container(
            color: isSender ? neonShade.withOpacity(0.8) : kwhite.withOpacity(.3),
            padding: EdgeInsets.only(
                left: isSender ? 10.w : 20.w,
                right: !isSender ? 10.w : 20.w,
                top: 10.w,
                bottom: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (isImage && imageUrl != null) ...[
                  Image.network(imageUrl!),
                  SizedBox(height: 5.h),
                ],
                Text(
                  text,
                  style: textStyle1.copyWith(color: kwhite ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      time,
                      style: textStyle1.copyWith(
                        color:isSender? kgrey:kGrayLight,
                        fontSize: 10.sp,
                      ),
                    ),
                    isSender ? adjustWidth(10.w) : kempty,
                    isSender
                        ? SizedBox(
                            height: 15.sp,
                            width: 15.sp,
                            child: const FittedBox(
                              child: Stack(
                                children: [
                                  Icon(Icons.check, color: kblue),
                                  Positioned(
                                      left: 5,
                                      child: Icon(Icons.check, color: kblue)),
                                ],
                              ),
                            ),
                          )
                        : kempty
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

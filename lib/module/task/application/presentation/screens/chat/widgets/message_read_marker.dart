import 'package:bizkit/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageReadMarker extends StatelessWidget {
  const MessageReadMarker({
    super.key,
    required this.read,
    this.pending = false,
  });

  final bool read;
  final bool pending;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.sp,
      width: 15.sp,
      child: FittedBox(
        child: pending && !read
            ? Icon(Icons.pending_outlined, color: kblack.withOpacity(0.5))
            : Stack(
                children: [
                  Icon(Icons.check,
                      color: read ? kblue : kblack.withOpacity(0.5)),
                  Positioned(
                      left: 5,
                      child: Icon(Icons.check,
                          color: read ? kblue : kblack.withOpacity(0.5))),
                ],
              ),
      ),
    );
  }
}
